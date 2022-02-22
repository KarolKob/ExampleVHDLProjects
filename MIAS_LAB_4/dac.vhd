library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity dac is
    port (
        Analog_out: out real;
        Digital_in: in std_logic
    );
end entity;

architecture behav of dac is
begin
    
    conv: process(Digital_in)
    begin
        if Digital_in = '1' then
            Analog_out <= 1.0;
        else
            Analog_out <= -1.0;
        end if;
    end process conv;
    
end architecture behav;
