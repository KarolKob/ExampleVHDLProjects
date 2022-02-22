LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use STD.textio.all;

entity decymator_tb is
	generic(
		period_tb: time := 100 ns;
		osr_tb: natural := 4;
		input_file: string := "input_file.txt";
		output_file: string := "output_file.txt"
	);
end decymator_tb;

architecture behav of decymator_tb is
	
	signal clk_tb, rst_tb: std_logic := '0';
	signal dec_in_tb: std_logic_vector(osr_tb downto 1);
	signal dec_out_tb: integer := 0;
	
begin
	
	read_proc: process(clk_tb)
	variable rLine: line;
	variable temp_d_in : std_logic_vector(osr_tb downto 1) := (others => '0');
	file input_f: text open READ_MODE is input_file;
	begin
		while not endfile(input_f) loop
			readline(input_f, rLine);
			read(rLine, temp_d_in);
			dec_in_tb <= temp_d_in;
		end loop;
	end process;
	
	write_proc: process(dec_out_tb)
	variable wLine: line;
	file output: text open WRITE_MODE is output_file;
	begin
		write(wLine, dec_out_tb);
		writeline(output, wLine);
	end process;
	
	clock_gen: entity work.clock_generator
	generic map(period => period_tb)
	port map(clk => clk_tb);
	
	decym: entity work.decymator
	generic map(osr => osr_tb)
	port map(clk => clk_tb,
		rst => rst_tb,
		dec_in => dec_in_tb,
		dec_out => dec_out_tb);
	
end architecture behav;
