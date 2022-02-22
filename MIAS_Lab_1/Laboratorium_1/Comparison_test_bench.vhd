library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.comparison_logic;
use work.test_bench_generator;

entity comparison_test_bench is
end comparison_test_bench;

architecture test of comparison_test_bench is
	signal A_I, B_I: std_logic_vector(1 downto 0);
	signal CLK_I, EQ_I, GE_I: std_logic := '0';
begin
	comp: entity comparison_logic (structural)
	port map(A => A_I, B => B_I, EQ => EQ_I, GE => GE_I);
	
	gen: entity test_bench_generator
	port map(clk => CLK_I, s1 => A_I(1), s2 => A_I(0), s3 => B_I(1), s4 => B_I(0));

end architecture test;