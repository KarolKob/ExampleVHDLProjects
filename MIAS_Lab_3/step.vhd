library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity step is
    generic (
        delay : integer := 5;
        initial : real := 0.0
    );
    port(
        clock: in std_logic;
        output: out real := initial
    );
end entity step;

architecture behav of step is

    signal step_val: real := 1.0;
    
begin

    zdel: entity work.zdelay
    generic map ( delay, initial )
    port map ( step_val, clock, output );
    
end architecture behav;