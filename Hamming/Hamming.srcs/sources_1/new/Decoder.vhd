library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Decoder is
    Port (
        r: in std_logic_vector(6 downto 0);
        ce: out std_logic_vector(3 downto 0)
    );
end Decoder;

architecture Behavioral of Decoder is
    signal H: std_logic_vector(20 downto 0) := "101110011010101110001";
    signal s: std_logic_vector(2 downto 0);
    signal e, ce_i: std_logic_vector(3 downto 0);

begin

    s(0) <= (H(0) and r(0)) xor (H(1) and r(1)) xor (H(2) and r(2)) xor (H(3) and r(3)) xor (H(+ 4) and r(4)) xor (H(5) and r(5)) xor (H(6) and r(6));
    s(1) <= (H(7) and r(0)) xor (H(8) and r(1)) xor (H(9) and r(2)) xor (H(10) and r(3)) xor (H(11) and r(4)) xor (H(12) and r(5)) xor (H(13) and r(6));
    s(2) <= (H(14) and r(0)) xor (H(15) and r(1)) xor (H(16) and r(2)) xor (H(17) and r(3)) xor (H(18) and r(4)) xor (H(19) and r(5)) xor (H(20) and r(6));

    e(0) <= s(0) and s(1) and s(2);
    e(1) <= (not s(0)) and s(1) and s(2);
    e(2) <= s(0) and (not s(1)) and s(2);
    e(3) <= s(0) and s(1) and (not s(2));

    ce_i(3) <= r(6) xor e(0);
    ce_i(2) <= r(5) xor e(1);
    ce_i(1) <= r(4) xor e(2);
    ce_i(0) <= r(3) xor e(3);

    ce <= ce_i;

end Behavioral;
