library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb is
    generic(
        clk_period: delay_length := 10 ns
    );
end entity tb;

architecture behav of tb is
    procedure clk_gen (signal s: out std_ulogic; offset,hpulse,period: delay_length ) is
    begin
        wait for offset;
        loop
            s <= '1', '0' after hpulse;
            wait for period;
        end loop;
    end procedure;

    signal clk: std_logic;
    signal switches, buttons: std_logic_vector(3 downto 0);
    signal leds: std_logic_vector(6 downto 0);

begin
    
    clk_gen(clk, 0 ns, clk_period / 2, clk_period);

   tb_proc: process
   begin
       
    switches <= "0001";
    wait for 4000 ns;

    buttons <= "0001"; -- chng
    wait for 20000 ns;
    buttons <= "0000";
    wait for 20000 ns;

    switches <= "0101";
    wait for 4000 ns;

    buttons <= "0001"; -- chng
    wait for 20000 ns;
    buttons <= "0000";
    wait for 20000 ns;

    buttons <= "0010"; -- down
    wait for 20000 ns;
    buttons <= "0000";
    wait for 20000 ns;

    switches <= "0100";
    wait for 4000 ns;

    buttons <= "0001"; -- chng
    wait for 20000 ns;
    buttons <= "0000";
    wait for 20000 ns;

    buttons <= "0010"; -- down
    wait for 20000 ns;
    buttons <= "0000";
    wait for 20000 ns;

    buttons <= "0010"; -- down
    wait for 20000 ns;
    buttons <= "0000";
    wait for 20000 ns;

    switches <= "0010";
    wait for 4000 ns;

    buttons <= "0001"; -- chng
    wait for 20000 ns;
    buttons <= "0000";
    wait for 20000 ns;

    switches <= "0110";
    wait for 4000 ns;

    buttons <= "0001"; -- chng
    wait for 20000 ns;
    buttons <= "0000";
    wait for 20000 ns;

    buttons <= "0100"; -- acc
    wait for 20000 ns;
    buttons <= "0000";
    wait for 2 ms;

   end process tb_proc;

    uut1: entity work.top
    port map(
        clk => clk,
        s => switches,
        b => buttons,
        d => leds
    );
    
end architecture behav;