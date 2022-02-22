library ieee;
use ieee.std_logic_1164.all;

entity test_signal_generator is
	port(clk: inout std_logic;
		s1, s2: inout std_logic;
		s3: inout std_logic_vector(1 downto 0);
		s4: inout integer);
end test_signal_generator;

architecture behav of test_signal_generator is

	signal first_iteration_clk: std_logic := '1';
	signal first_iteration_s2: std_logic := '1';

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
		s1 <= '1';
		wait for 10 ns;
		s1 <= '0';
		wait for 10 ns;
	end process s1_cycle;
	
	s2_cycle: process
	begin
		if (first_iteration_s2 = '1') then
			s2 <= '1';
			first_iteration_s2 <= '0';
			wait for 10 ns;
			s2 <= '0';
		else
			wait for 20 ns;
			s2 <= '1';
			wait for 20 ns;
			s2 <= '0';
		end if;
	end process s2_cycle;
	
	s3_cycle: process
	begin
		s3(1) <= '0';
		s3(0) <= '1';
		wait for 10 ns;
		s3(1) <= '0';
		s3(0) <= '0';
		wait for 10 ns;
		s3(1) <= '1';
		s3(0) <= '1';
		wait for 10 ns;
	end process s3_cycle;
	
	s4_cycle: process
	begin
		wait for 10 ns;
		s4 <= 2;
		wait for 30 ns;
		s4 <= 5;
	end process s4_cycle;
	
end architecture behav;

architecture test_bench of test_signal_generator is
begin

end architecture test_bench;
	