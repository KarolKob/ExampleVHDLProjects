LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all;

-- lrc := 0
-- for each byte b in the buffer do
--     lrc := (lrc + b) and 0xFF
-- lrc := (((lrc XOR 0xFF) + 1) and 0xFF)

package lrc is

    function checksum(msg: in string) return std_logic_vector;
    
end package lrc;

package body lrc is
    
    function checksum(msg: in string) return std_logic_vector is
        variable sum: std_logic_vector(7 downto 0);
    begin
        sum := x"00";

        for i in msg'range loop
            sum := std_logic_vector(unsigned(sum) + to_unsigned(character'pos(msg(i)), 8)) and x"FF";
        end loop;
        sum := (((sum xor x"FF") + 1) and x"FF");
        return sum;

    end function;
    
end package body lrc;