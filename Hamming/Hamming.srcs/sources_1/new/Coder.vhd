library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Coder is
    Port (
        b: in std_logic_vector(3 downto 0);
        c: out std_logic_vector(6 downto 0)     -- cT = bT * G
    );
end Coder;

architecture Behavioral of Coder is

    signal G: std_logic_vector(27 downto 0) := "1000111010001100101010001110";
    signal c_temp: std_logic_vector(6 downto 0);

begin

    c <= c_temp;

    gen_logic: for index in 0 to 6 generate

        c_temp(index) <= (G(index) and b(0)) xor (G(index + 7) and b(1)) xor (G(index + 14) and b(2)) xor (G(index + 21) and b(3));

    end generate gen_logic;

end Behavioral;