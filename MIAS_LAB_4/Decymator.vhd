LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee.std_logic_unsigned.all;

entity decymator is
	generic(
	osr: natural := 4
	);
	port(
	clk: in std_logic;
	rst: in std_logic;
	dec_in: in std_logic;
	dec_out: out integer
	);
end decymator;

architecture behav of decymator is

	signal temp: natural := osr;
	signal iter: natural := osr;
	
begin

	main_proc: process (clk, rst)
	begin
		if (rst = '1') then
			temp <= osr;
			iter <= osr;
		elsif (clk'event and clk='1') then
			if (not (iter = 0)) then
				if (dec_in = '1') then
					temp <= temp + 1;
				elsif (dec_in = '0') then
					temp <= temp - 1;
				end if;
				iter <= iter - 1;
			else
				dec_out <= temp;
				iter <= osr;
				temp <= osr;
			end if;
		end if;
	end process;
	
end architecture behav;
