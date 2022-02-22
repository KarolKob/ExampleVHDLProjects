library ieee;
use ieee.std_logic_1164.all;

entity sigma_delta is
    generic (
        count: integer := 1;
        initial: real := 0.0
    );
    port (
        input: in real;
        clk: in std_logic;
        output: out std_logic
    );
end entity sigma_delta;

architecture behav of sigma_delta is
    
    signal integ_in, integ_out, dac_out: real := initial;
    signal adc_out: std_logic := '0';

begin
    
    integ: entity work.integrator
    generic map (count, initial)
    port map (integ_in, clk, integ_out);

    adc: entity work.adc port map (integ_out, adc_out);

    dac: entity work.dac port map (dac_out, adc_out);

    integ_in <= input - dac_out;

    output <= adc_out;
    
end architecture behav;
