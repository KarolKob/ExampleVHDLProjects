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

Entity trigger Is
   Port(
      clk             :  In  Std_logic;
      rst             :  In  Std_logic;
      InData        :  In  Std_logic_vector (NO_OF_PROBES - 1 downto 0);
      OutData       :  Out Std_logic_vector (NO_OF_PROBES - 1 downto 0);
      daq_enable      :  Out Std_logic
       );
End Entity;

Architecture arch Of trigger Is

   signal probes_1d :  std_logic_vector(NO_OF_PROBES - 1 downto 0);
   signal probes_2d :  std_logic_vector(NO_OF_PROBES - 1 downto 0);

Begin

   Process(clk)
   Begin
      If clk'Event and clk = '1' Then
         If rst = '1' Then
            probes_1d  <= (others => '0');
            probes_2d <= (others => '0');
            daq_enable <= '0' ;
         Else
            probes_1d  <= InData;
            probes_2d <= probes_1d;
            daq_enable <= '1' ;
         End If; 
      End If; 
   End Process;

   --daq_enable <= '0' When probes_1d = probes_2d else '1';
   OutData  <= probes_1d;

End Architecture;
