-------------------------------------------------------------------------------
-- Project: UDP Data Logger
-- Author(s): HusTakocem
-- Created: Jan 2018
-------------------------------------------------------------------------------
-- 
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

use work.pkg_eth.all;
use work.pkg_s3_ip.all;

library UNISIM;
use UNISIM.Vcomponents.ALL; 

Entity eth_receiver_v0 Is
   Port (
     ext_rst : In std_logic;
   -- PHY Rx side
     rx_clk   : In  std_logic;
     rx_dv    : In  std_logic;
     rx_er    : In  std_logic;
     rx_data  : In  std_logic_vector(3 downto 0);

     err_o : out std_logic; -- error rx
     erl_o : out std_logic; -- error low
     
     en_o: out std_logic; -- data enable out
     stat: out std_logic_vector(15 downto 0);
     data_o : out std_logic_vector(7 downto 0)
   );
End eth_receiver_v0;

Architecture arch Of eth_receiver_v0 Is 

  type state is (IDLE, RX_LOW, RX_HIGH, RX_ERROR, L_ERROR);
  signal cr_st, nx_st: state;
  -- Reset signals
  signal rx_data_i, rx_data_ii: std_logic_vector(3 downto 0):=(others=>'0');
  signal data_o_i, data_O_ii: std_logic_vector(7 downto 0);
  signal en_low, en_out, rx_er_i, stat_o: std_logic;
  signal byte_cntr: std_logic_vector(15 downto 0):=(others=>'0');

begin
  
  fsm: process(cr_st, rx_dv, rx_er) begin
    erl_o <= '0';
    err_o <= '0';
    en_low <= '0';
    en_out <= '0';
    stat_o <= '0';

    case cr_st is
      when IDLE =>
        if rx_dv = '1' then
          stat_o <='1';
          nx_st <= RX_LOW;
        else 
          nx_st <= IDLE;
        end if;

      when RX_LOW =>
        en_low <= '1';
        if rx_er = '1' then
          nx_st <= RX_ERROR;
        elsif rx_dv = '1' then
          nx_st <= RX_HIGH;
        else 
          nx_st <= L_ERROR;
        end if;

      when RX_HIGH =>
        en_out <= '1';
        if rx_er = '1' then
          nx_st <= RX_ERROR;
        elsif rx_dv = '1' then
          nx_st <= RX_LOW;
        else 
          nx_st <= IDLE;
        end if;

      when RX_ERROR =>
        err_o <= '1';
        nx_st <= IDLE;

      when L_ERROR =>
        erl_o <= '1';
        nx_st <= IDLE;

    end case;
  end process;

  mem: process(rx_clk, ext_rst) begin
    if ext_rst='1' then
      cr_st <= IDLE;
      rx_data_i <= x"0";
      rx_er_i <= '0';
      en_o <= '0';
    elsif rising_edge(rx_clk) then
      cr_st <= nx_st;
      rx_er_i <= rx_er;
      if rx_dv ='1' then data_o_i <= rx_data & data_o_i(7 downto 4); end if;
      if en_out ='1' then data_o_ii <= data_o_i; end if;
      en_o <= en_out; -- 1d
    end if;
  end process;

  stat_proc: process (rx_clk, stat_o) begin
    if stat_o ='1' then
      byte_cntr <= (others=>'0');
    elsif rising_edge(rx_clk) then
      if en_out = '1' then
        byte_cntr <= byte_cntr +1;
      end if;
    end if;
  end process;

  data_o <= data_o_ii;
  stat <= byte_cntr;
End arch;
