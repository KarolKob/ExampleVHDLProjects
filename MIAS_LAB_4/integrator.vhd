library ieee;
use ieee.std_logic_1164.all;

entity integrator is
    generic (
        count: integer := 1;
        initial: real := 0.0
    );
    port (
        input: in real;
        clk: in std_logic;
        output: out real := initial
    );
end entity integrator;

architecture behav of integrator is

    signal zdel_in, zdel_out: real := initial;

begin

    zdel_in <= zdel_out + input;

    zdel: entity work.zdelay
    generic map ( count, initial )
    port map ( zdel_in, clk, zdel_out );

    output <= zdel_out;
    
    
end architecture behav;