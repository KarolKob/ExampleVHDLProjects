LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity clock_generator is
	generic(
		period: time := 100 ns
	);
	port(
		clk: out std_logic
	);
end clock_generator;

architecture behav of clock_generator is

begin
	clk_gen: process
	begin
		clk <= '0';
		wait for period/2;
		clk <= '1';
		wait for period/2;
	end process;
end architecture behav;
