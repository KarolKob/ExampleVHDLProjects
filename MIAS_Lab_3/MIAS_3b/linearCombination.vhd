library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity linearCombination is
    generic (
        initial : real := 0.0;
        coeffA : real := 0.5;
        coeffB : real := 0.5
    );
    port(
        inputA: in real;
        inputB: in real;
        output: out real:= initial
    );
end entity linearCombination;

architecture lin_com of linearCombination is
    
begin
    
    output <= (inputA * coeffA) + (inputB * coeffB);
    
end architecture lin_com;
