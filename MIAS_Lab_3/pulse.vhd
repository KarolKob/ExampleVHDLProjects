library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.MATH_REAL.all;

entity pulse is
    generic (
        delay : integer := 1;
        w_pulse : integer := 1;
        initial : real := 0.0
    );
    port(
        clock: in std_logic;
        output: out real := initial
    );
end entity pulse;

architecture behav of pulse is

    signal step_val: real := 1.0;
    signal pulse_wid: integer := w_pulse;
    
begin

    zdel: entity work.zdelay
    generic map ( delay, initial )
    port map ( step_val, clock, output );

    prc: process(clock)
    begin
        if rising_edge(clock) then
            if(step_val = 1.0) then
                if(pulse_wid = 0) then
                    step_val <= 0.0;
                else
                    pulse_wid <= pulse_wid - 1;
                end if;
            end if;
        end if;
    end process prc;
    
end architecture behav;