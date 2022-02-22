library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sample_hold is
    generic (
        initial : real := 0.0;
        vec_length : integer := 8
    );
    port(
        input: in std_logic_vector(vec_length-1 downto 0);
        clk: in std_logic;
        output: out real := initial
    );
end entity sample_hold;

architecture s_h of sample_hold is
    signal hold: real := initial;
    
begin
    
    sh_proc: process(clk)
    begin
        if rising_edge(clk) then
            hold <= real(to_integer(signed(input)));
        end if;
    end process sh_proc;

    output <= hold;
    
end architecture s_h;