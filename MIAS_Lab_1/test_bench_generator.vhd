library ieee;
use ieee.std_logic_1164.all;

entity test_bench_generator is
	port(clk: inout std_logic;
		s1, s2, s3, s4: inout std_logic);
end test_bench_generator;

architecture behav of test_bench_generator is

	signal first_iteration_clk: std_logic := '1';

begin
	clk_cycle: process
	begin
		if (first_iteration_clk = '1') then
			clk <= '0';
			first_iteration_clk <= '0';
		else
			clk <= not clk;
		end if;
		wait for 20 ns;
	end process clk_cycle;
	
	s1_cycle: process
	begin
		s1 <= '0';
		wait for 20 ns;
		s1 <= '1';
		wait for 20 ns;
	end process s1_cycle;
	
	s2_cycle: process
	begin
		s2 <= '0';
		wait for 40 ns;
		s2 <= '1';
		wait for 40 ns;
	end process s2_cycle;
	
	s3_cycle: process
	begin
		s3 <= '0';
		wait for 80 ns;
		s3 <= '1';
		wait for 80 ns;
	end process s3_cycle;
	
	s4_cycle: process
	begin
		s4 <= '0';
		wait for 160 ns;
		s4 <= '1';
		wait for 160 ns;
	end process s4_cycle;
	
end architecture behav;
