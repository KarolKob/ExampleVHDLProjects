library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity zdelay is
    generic (
        count: integer := 10;
        initial: real := 0.0
    );
    port(
        input: in real;
        clk: in std_logic;
        output: out real := initial
    );
end entity zdelay;

architecture arch_delay of zdelay is
    type holds_array is array ( 0 to count ) of real;
    signal holds : holds_array := (others => initial);
    signal index_out: integer := 1;
    signal index_delay: integer :=0;
begin

    proc_name: process(clk)
    begin
        if rising_edge(clk) then
            if index_delay < count then
                index_delay <= index_delay + 1;
                holds(index_delay) <= input;
            else
                index_delay <= 0;
                holds(index_delay) <= input;
            end if;

            if index_out < count then
                index_out <= index_out + 1;
                output <= holds(index_out);
            else
                index_out <= 0;
                output <= holds(index_out);
            end if;
        end if;
    end process proc_name;
    
end architecture arch_delay;
