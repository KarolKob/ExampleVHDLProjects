library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity pulse_tb is
end;

architecture bench of pulse_tb is

    signal clk: std_logic;
    signal pulse_out, int_as, int_bs, int_cs: real := 0.0;
    constant clock_period: time := 10 ns;
    signal stop_the_clock: boolean;

begin
    
    uut_step: entity work.pulse port map(clk, pulse_out);

    integ_a: entity work.integrator(int_a) port map(pulse_out, clk, int_as);

    integ_b: entity work.integrator(int_b) port map(pulse_out, clk, int_bs);

    integ_c: entity work.integrator(int_c) port map(pulse_out, clk, int_cs);

    clocking: process
    begin
        while not stop_the_clock loop
            clk <= '1', '0' after clock_period / 2;
            wait for clock_period;
        end loop;
        wait;
    end process;
    
end architecture bench;
