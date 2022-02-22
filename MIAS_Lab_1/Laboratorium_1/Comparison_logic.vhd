library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comparison_logic is
	port(A, B: in std_logic_vector(1 downto 0);
		EQ, GE: out std_logic);
end comparison_logic;

architecture behavioral of comparison_logic is
begin
	
	comparison_process: process (A, B)
	begin
		if (A = B) then
			EQ <= '1';
			GE <= '1';
		elsif (A > B) then
			EQ <= '0';
			GE <= '1';
		else
			EQ <= '0';
			GE <= '0';
		end if;
	end process;
end architecture behavioral;

architecture structural of comparison_logic is

	signal x1, x2, x3, x4: std_logic;

begin
	
	x1 <= A(1);
	x2 <= A(0);
	x3 <= B(1);
	x4 <= B(0);
	
	EQ <= ((x1 nor x3) or (x1 and x3)) and ((x2 nor x4) or (x2 and x4));
	
	GE <= (x3 nor x4) or (x1 and x2) or (x1 and (not x3)) or (x2 and (not x3)) or (x1 and (not x4));

end architecture structural;