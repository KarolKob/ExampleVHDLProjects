-------------------------------------------------------------------------------
-- Project: UDP Data Logger, 20MHz sync
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

entity udp_daq is
port
  (
   -- board ctrl
   eth_clk    : in std_logic; -- net clk : mii_clk_tx
   ext_rst    : in std_logic; -- external reset
   ext_start  : in std_logic; -- net test
   daq_enable : in std_logic; -- active high
   -- 
   -- PHY control - reset is active low
   rstn     : Out std_logic;
   -- PHY Tx side
   --tx_clk   : Out std_logic; -- gtx clock
   tx_en    : Out std_logic;
   tx_er    : Out std_logic;
   tx_data  : Out std_logic_vector(7 downto 0);
   
   -- adc inputs
   data_clk : In std_logic; 
   inData   : In std_logic_vector(NO_OF_PROBES-1 downto 0)
  );
end;

architecture arc of udp_daq is

  -- Reset signals
 signal rst_SW   : std_logic;
 signal rst_HW   : std_logic; -- reset hw phy
  -- Clock for probes
 signal probes_clk  : std_logic;

 signal cnt   : std_logic_vector(32 downto 0):= (others => '0');
 signal data_to_trans : std_logic_vector(NO_OF_PROBES-1 downto 0);
 
 signal inData_d1 : std_logic_vector(NO_OF_PROBES-1 downto 0);
 signal inData_d2 : std_logic_vector(NO_OF_PROBES-1 downto 0); 

 signal reset_udp : std_logic;
 signal fs_cntr: std_logic_vector(7 downto 0):=(others=>'0');
 signal trans_fifo_epmty : std_logic;
 signal trans_fifo_almost_empty, trans_fifo_almost_full : std_logic;

 signal probes_change, test_mode: std_logic;
 signal tx_en_int : std_logic;

 signal usr_hdr: std_logic_vector(63 downto 0);

 attribute KEEP : string; 
 attribute KEEP of inData_d2 : signal is "TRUE";

begin
---------------------------------------------------------

data_to_trans <= inData_d2;
test_mode <= '1';
probes_clk <= data_clk;

----------------------------------------------------------
-- input resynch 
resynch_inst: resynch_20M
  generic map(N=>NO_OF_PROBES)
  port map(
    synch_out => inData_d2,
    bus_in => inData, 
    clk_sys => data_clk
    );

proc_fs_cntr: process(probes_clk)  begin
  if rising_edge(probes_clk) then
    if FS_DIV = 1 then
      fs_cntr <= (others=>'0');
      probes_change<=daq_enable;
    else 
      if fs_cntr=FS_DIV then
        probes_change<= daq_enable;
        fs_cntr <= (others=>'0');
      else 
        probes_change <= '0';
        fs_cntr <= fs_cntr + 1;
      end if;
    end if;
  end if;
end process;

-- Reset gen
rst_inst : rst_gen
      Generic Map(
         rst_cycles => CYCLE_SW,
         rst1_cycles => CYCLE_HW)
      Port Map(
         clk      => data_clk, --mii_clk_tx,
         ext_rst  => ext_rst,
         rst      => rst_SW,
         rst1     => rst_HW -- rst eth phy
      );

-- rst distrib 
  rstn <= not rst_HW;
  reset_udp <= rst_HW; --ext_rst; -- high
  usr_hdr <= USER_FLAGS;

-- UDP/Ethernet transmiter
udp_trans_inst: udp_transmiter_v9
   generic map(NO_OF_PROBES)
   port map(
      test_mode => test_mode,
      mii_clk_tx => eth_clk,
      probes_clk => probes_clk,
      probes_change => probes_change,
      usr_hdr => usr_hdr,

      event_empty => trans_fifo_epmty,
      event_almost_empty => trans_fifo_almost_empty,
      event_full => trans_fifo_almost_full,
      ext_start => ext_start,
      sys_rst => reset_udp,--ext_rst,
      rstn => open, --rstn,
      tx_en => tx_en_int,
      tx_er => tx_er,
      tx_data => tx_data,
      inProbes => data_to_trans
      );

   tx_en <= tx_en_int;

end  arc;
