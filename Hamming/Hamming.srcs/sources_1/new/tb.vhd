library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb is
    generic(
        clk_period: delay_length := 10 ns
    );
end entity tb;

architecture behav of tb is
    signal switches: std_logic_vector(3 downto 0);
    signal leds: std_logic_vector(3 downto 0);

begin

   tb_proc: process
   begin
       
    switches <= "1101";

    wait for 20 ns;

    switches <= "0101";
    wait for 20000 ns;

   end process tb_proc;

    uut1: entity work.top
    port map(
        s => switches,
        d => leds
    );
    
end architecture behav;