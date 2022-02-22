LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity testbench is
    generic(
        d_width: integer := 8;
        clk_period: delay_length := 20 ns
    );
end entity testbench;

architecture logic of testbench is
    
    procedure clk_gen (signal s: out std_ulogic; offset,hpulse,period: delay_length ) is
    begin
        wait for offset;
        loop
            s <= '1', '0' after hpulse;
            wait for period;
        end loop;
    end procedure;

    signal data_1, data_2, clk, reset_n : std_logic;

begin
    
    clk_gen(clk, 0 ns, clk_period / 2, clk_period);

    reset_n <= '1';

    uut1 : entity work.user_logic
        port map(
            rx => data_1,
            tx => data_2,
            clk => clk,
            rst_n => reset_n
        );

    uut2 : entity work.uart_correspondent
        port map(
            rx => data_2,
            tx => data_1,
            clk => clk,
            rst_n => reset_n
        );
    
end architecture logic;