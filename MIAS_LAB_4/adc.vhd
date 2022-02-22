-- 1 dla >0, 0 dla <0

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity adc is
    port (
        Analog_in: in real;
        Digital_out: out std_logic
    );
end entity;

architecture behav of adc is
begin
    
    conv: process(Analog_in)
    begin
        if Analog_in > 0.0 then
            Digital_out <= '1';
        else
            Digital_out <= '0';
        end if;
    end process conv;
    
end architecture behav;
