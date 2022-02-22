----------------------------------------------------------------------------------
-- Company: CCE
-- Engineer: Kropidlowski Marek
-- 
-- Create Date:    17:11:23 03/16/2019 
-- fsm tester
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee.std_logic_unsigned.all;
USE work.pkg_symuli.all;
 
ENTITY fsm_2_tb IS
END fsm_2_tb;
 
ARCHITECTURE behavior OF fsm_2_tb IS 

   --Inputs
    signal clk_in: std_logic := '0';  
    signal rst: std_logic:='0';
    signal x1: std_logic:='0';

    signal outp: std_logic;

   -- Clock period definitions
   constant clk_in_period : time := 10 ns;
   constant offset: time := 3 ns;
   constant space: time := 20*clk_in_period;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.fsm_2 
        PORT MAP (
          clk => clk_in,
          reset => rst,
          x1 => x1,
          outp => outp
        );

   -- reset all
   pulse(rst,2*clk_in_period,clk_in_period);

   -- stimuli
   pulse_gen(x1,20,2.3*clk_in_period,3.9*clk_in_period);
   stop_after(space);
  
   -- clock definition
   clk_gen(clk_in, offset, clk_in_period/2, clk_in_period);

END;
