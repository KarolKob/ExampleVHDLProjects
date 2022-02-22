library IEEE;
use IEEE.std_logic_1164.all;
entity mux2 is
    generic(DIGIT: positive := 8);
    port(
    a1      : in  std_logic_vector(DIGIT*4-1 downto 0);
    a2      : in  std_logic_vector(DIGIT*4-1 downto 0);
    sel     : in  std_logic;
    b       : out std_logic_vector(DIGIT*4-1 downto 0));
end mux2;

architecture rtl of mux2 is
  -- declarative part: empty
begin

  with sel select
    b <= a1 when '1',
       a2 when others;

end rtl;