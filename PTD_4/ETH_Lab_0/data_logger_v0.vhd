-------------------------------------------------------------------------------
-- Project: UDP Data Logger test env,
-- Author(s): Hus Takocem
-- Created: Feb 2019
-------------------------------------------------------------------------------
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

use work.pkg_eth.all;
use work.pkg_s3_ip.all;

library UNISIM;
use UNISIM.Vcomponents.ALL; 

entity data_logger_v0 is
port
  (
   -- debug
   led_out             : out std_logic;
   -- board ctrl
   eth_clk          : in  std_logic; -- net clk 125MHz
   clk_25pi45       : out std_logic; -- clk test signal 
   -- 
   -- PHY control - reset is active low
   rstn     : Out std_logic;
   -- PHY Tx side
   --tx_clk   : Out std_logic; -- gtx clock
   tx_en_h    : Out std_logic;
   tx_er_h    : Out std_logic;
   tx_data_h  : Out std_logic_vector(3 downto 0);
   -- PHY Rx side
   rx_clk   : In  std_logic;
   rx_dv    : In  std_logic;
   rx_er    : In  std_logic;
   rx_data  : In  std_logic_vector(3 downto 0);

   data_clk : In std_logic; -- data clk 50MHz
   -- uart
   uart_rx  : in std_logic;  
   uart_tx  : out std_logic
  );
end;

architecture arc of data_logger_v0 is
 constant CNTR_OFFSET: natural:=0;
  ----
 signal eth_locked : std_logic;
 signal ext_start : std_logic;

 -- Clock to PHY
 signal mii_clk_tx  : std_logic;
 signal mii_clk_tx_n : std_logic;
 signal tx_en, tx_er, clk_25 : std_logic;
 signal tx_data: std_logic_vector(7 downto 0);
 
 signal cnt   : std_logic_vector(32 downto 0):= (others => '0');
 signal inData, inData_rx, data2trans : std_logic_vector(NO_OF_PROBES-1 downto 0);
 
 signal daq_enable: std_logic;
 signal usr_clk,udp_clk : std_logic;
 signal ext_rst : std_logic;
 signal alive_led : std_logic;
 signal usr_hdr: std_logic_vector(63 downto 0);

-----
 signal en_o: std_logic;
 signal led6, led5: std_logic;
 signal data_o : std_logic_vector(7 downto 0);
 signal stat : std_logic_vector(15 downto 0);

 attribute KEEP : string; 
 attribute KEEP of eth_locked : signal is "TRUE";

begin
---------------------------------------------------------
-- clock distribution
  net_dcm_inst: net_dcm_125_dgb
    port map(
        clkin_in => eth_clk,
        clk0_out => clk_25,
        CLKIN_IBUFG_OUT => open,
        clkfx_out => mii_clk_tx, -- 25/2 MHz
        clkfx180_out => mii_clk_tx_n,
        rst_in => '0',
        locked_out => eth_locked
      );
    clk_25pi45 <= clk_25;

-- MII data output
tx_gen: for i in 0 to 3 generate
  tx_ODDR_inst : ODDR2
     Generic Map(
        DDR_ALIGNMENT => "NONE",INIT => '0',SRTYPE => "ASYNC") 
     Port Map (
        Q => tx_data_h(i), 
        C0 => mii_clk_tx_n, 
        C1 => mii_clk_tx, 
        CE => '1',  
        D0 => tx_data(i),  
        D1 => tx_data(i+4),  
        R => '0',   
        S => '0'    
     );
end generate;

 udp_clk <= mii_clk_tx;
 usr_clk <= data_clk;

 process(mii_clk_tx_n) begin
  if rising_edge(mii_clk_tx_n) then
    tx_er_h <= tx_er;
    tx_en_h <= tx_en;
  end if;
 end process;
---------------------------------------------------------------------------

udp_daq_inst: udp_daq 
  port map(
    eth_clk => udp_clk,
    ext_rst => '0',
    ext_start => '0',
    daq_enable => daq_enable,
    rstn => rstn, -- phy rst out
    tx_en => tx_en, -- out
    tx_er => tx_er, -- out
    tx_data => tx_data, -- out
    data_clk => usr_clk,
    inData => data2trans
    );

  inData <= cnt(NO_OF_PROBES-1 +CNTR_OFFSET downto 0 +CNTR_OFFSET); 
  uart_tx <= uart_rx;

eth_rec: eth_receiver_v0
  port map(
    ext_rst => ext_rst,
    rx_clk => rx_clk,
    rx_dv => rx_dv,
    rx_er => rx_er,
    rx_data => rx_data,

    err_o => led6,
    erl_o => led5,
    en_o => en_o,
    stat => stat,
    data_o => data_o
    );

test_proc: process(rx_clk) begin
  if rising_edge(rx_clk) then
    if en_o ='1' then
      inData_rx <= data_o;
    end if;
  end if;
end process;

-- trigger processing
trig_inst: trigger
  port map(
    clk => usr_clk,
    rst => '0',
    InData => inData,
    OutData => data2trans,
    daq_enable => daq_enable
    );

---- Debug --------------------------------------------------------------------
  alive_counter: Process (usr_clk)
     Begin
       If rising_edge(usr_clk) Then
          cnt <= std_logic_vector(unsigned(cnt) + 1);
       end if;
     End Process;

  d1_proc: Process (usr_clk) begin
    if rising_edge(usr_clk) then
      alive_led <= cnt(23);
    end if;
  end process;

  -- test led assignment
  led_out <= alive_led;

end  arc;
