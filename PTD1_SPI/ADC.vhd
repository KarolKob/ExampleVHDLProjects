library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity ADC is
    generic(
        V_a: real range 2.7 to 5.25;
        bit_size: integer := 8
    );
    port (
        V_in: in real range 0.0 to V_a;
        Bits_out: out std_logic_vector(bit_size - 1 downto 0)
    );
end entity;

architecture behav of ADC is

    constant step_size: real := (2.0 ** bit_size - 1.0) / V_a;

begin
    
    conv: process(V_in)
    begin
        Bits_out <= std_logic_vector(to_unsigned(integer(V_in * step_size), Bits_out'length));
    end process conv;
    
end architecture behav;