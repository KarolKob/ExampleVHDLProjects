-------------------------------------------------------------------------------
-- Project: IP components lib
-- Author(s): Marek Kropidlowski
-- Created: Dec 2015   
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee.std_logic_unsigned.all;
USE work.ip_pkg.all;
 
ENTITY debounceN_tb IS
END debounceN_tb;
 
ARCHITECTURE behavior OF debounceN_tb IS 
   constant BTN: natural:=5; -- no of btns

  component debounceN is
     generic(N: positive:=5;
             RE_DETECTOR: boolean:=True);
     port(clk_sys: in std_logic; -- system clock
          clk_slow: in std_logic; -- debounce clock (100Hz)
          button: in std_logic_vector(N-1 downto 0);
          trigger_out: out std_logic_vector(N-1 downto 0)
          );
  end component;   
   --Inputs
    signal clk_in, clk_slow: std_logic := '0';  
    signal rst: std_logic:='0';
    signal left,right,up,down,center: std_logic:='0';
    signal trigger_out, trigger_out_re, button: std_logic_vector(BTN-1 downto 0);

   -- Clock period definitions
   constant clk_in_period : time := 10 ns;
   constant clk_slow_period : time := 2 ms;
   constant bounce_time : time := clk_slow_period/2;
   
   constant offset: time := 3 ns;
   constant space: time := 3*clk_slow_period;
   constant pulseH: time := 2*clk_slow_period;
 
BEGIN
  
  button <= (left & right & up & down & center);
  
	-- Instantiate the Unit Under Test (UUT)
   debounce_ut_re: debounceN
        generic map(BTN,true)
        port map(
          clk_sys => clk_in,
          clk_slow => clk_slow,
          button => button,
          trigger_out => trigger_out_re
          );

   debounce_ut_nore: debounceN
        generic map(BTN,false)
        port map(
          clk_sys => clk_in,
          clk_slow => clk_slow,
          button => button,
          trigger_out => trigger_out
          );

  -- sequential stimuli
  process BEGIN
    pulse(center,pulseH,space); -- 
    bounced_pulse(left,3,bounce_time,pulseH,space); -- 
    bounced_pulse(right,4,bounce_time,pulseH,space); -- 
    bounced_pulse(up,2,bounce_time,pulseH,space); -- 
    bounced_pulse(down,3,bounce_time,pulseH,space); -- 
    bounced_pulse(center,1,bounce_time,pulseH,space); -- 

    wait;
  end process;

   -- Clock definition
   GenClock(clk_in, clk_in_period);
   GenClock(clk_slow, clk_slow_period);
   StopAfter( 50 * clk_slow_period );

END;
