library ieee;
use ieee.std_logic_1164.all;
use IEEE.MATH_REAL.all;

entity integrator is
    generic (
        initial : real := 0.0
    );
    port(
        input: in real;
        clk: in std_logic;
        output: out real := initial
    );
end entity integrator;

architecture int_a of integrator is

    signal zdel_out, zdel_in: real := 0.0;
    
begin

    zdel: entity work.zdelay
    generic map ( 1, initial )
    port map ( zdel_in, clk, zdel_out );

    output <= input + zdel_out;

    zdel_in <= input + zdel_out;
    
end architecture int_a;

architecture int_b of integrator is

    signal x_hold: real := initial;
    signal zdel_out, zdel_in: real := initial;
    
begin

    zdel_x: entity work.zdelay
    generic map ( 1, initial )
    port map ( input, clk, x_hold );

    zdel_y: entity work.zdelay
    generic map ( 1, initial )
    port map ( zdel_in, clk, zdel_out );

    output <= x_hold + zdel_out;

    zdel_in <= x_hold + zdel_out;
    
end architecture int_b;

architecture int_c of integrator is

    signal x_hold: real := initial;
    signal zdel_out, zdel_in: real := initial;
    
begin

    zdel_x: entity work.zdelay
    generic map ( 1, initial )
    port map ( input, clk, x_hold );

    zdel_y: entity work.zdelay
    generic map ( 1, initial )
    port map ( zdel_in, clk, zdel_out );

    output <= input + x_hold + zdel_out;

    zdel_in <= input + x_hold + zdel_out;
    
end architecture int_c;
