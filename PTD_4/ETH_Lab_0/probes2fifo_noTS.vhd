-------------------------------------------------------------------------------
-- Project: ADC-UDP transmiter
--          no TS version
-- Author(s): HusTakocem
-- Created: Jan 2016  
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.pkg_eth.all;


Entity probes2fifo_noTS Is
   Generic(
      probes_number   : positive := 16
      );
   Port(
      clk         : in  std_logic;
      rst         : in  std_logic;

      DataTrg     : in  std_logic;
      DataIn      : in  std_logic_vector(probes_number - 1 downto 0);
      
      fifo_data   : out std_logic_vector(probes_number - 1 downto 0);
      fifo_wrreq  : out std_logic;
      fifo_wrfull : in  std_logic;
      fifo_err    : out std_logic
      );
End Entity;

Architecture arch Of probes2fifo_noTS Is
   constant reset_stamp: std_logic_vector(probes_number - 1 downto 0):= STAMP_RST;
   constant error_stamp: std_logic_vector(probes_number - 1 downto 0):= STAMP_ERR;
   Type probes2fifo_state_t Is (reset, normal, err);
   signal state_c      : probes2fifo_state_t := normal;
   signal rst_sent     : std_logic := '0';

Begin

   Process(clk)
   Begin
      If clk'Event And clk = '1' Then
         If rst = '1' Then
            state_c <= reset;
            rst_sent <= '0';
         Else
            Case state_c Is
               When reset  =>
                  -- If there is a space in fifo
                  -- Send timestamp and reset flag twice
                  If fifo_wrfull = '0' Then
                     rst_sent <= '1';
                     If rst_sent = '1' Then
                        state_c <= normal;
                     End If;
                  End If;
               When normal =>
                  If DataTrg = '1' Then
                     If fifo_wrfull = '1' Then
                        state_c <= err;
                     Else
                        state_c <= normal;
                     End If;
                  End If;
               When err    =>
                  If fifo_wrfull = '0' Then
                     state_c <= normal;
                  End If;
            End Case;
         End If;
      End If;
   End Process;

   Process(state_c, fifo_wrfull, rst, DataTrg, DataIn)
   Begin
      If rst = '1' Then
         fifo_wrreq <= '0';
         fifo_err <= '0';
         fifo_data <= (others => '0');
      Else
         fifo_wrreq <= '0';
         Case state_c Is
            When reset  =>
               fifo_data <= reset_stamp;
               fifo_err <= '0';
               fifo_wrreq <= not fifo_wrfull;
            When normal =>
               fifo_data <= DataIn;
               fifo_err <= '0';
               fifo_wrreq <= (not fifo_wrfull) and DataTrg;
            When err    =>
               fifo_data <= error_stamp;
               fifo_err <= '1';
               fifo_wrreq <= not fifo_wrfull;
         End Case;
      End If;
   End Process;

End arch;
