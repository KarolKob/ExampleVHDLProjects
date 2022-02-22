LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity testbench is
    generic(
        msg_delay: delay_length := 1 us;
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

    signal clk, s_0, s_1, s_2, s_3, coded_out: std_logic;
    signal decoded_out: std_logic_vector(3 downto 0);

begin
    
    clk_gen(clk, 0 ns, clk_period / 2, clk_period);

    msg_gen: process
    begin
        wait for msg_delay;
        s_0 <= '0';
        s_1 <= '0';
        s_2 <= '0';
        s_3 <= '0';

        wait for msg_delay;
        s_0 <= '1';
        s_1 <= '0';
        s_2 <= '0';
        s_3 <= '0';

        wait for msg_delay;
        s_0 <= '0';
        s_1 <= '0';
        s_2 <= '1';
        s_3 <= '0';

        wait for msg_delay;
        s_0 <= '0';
        s_1 <= '0';
        s_2 <= '1';
        s_3 <= '1';

        wait for msg_delay;
        s_0 <= '0';
        s_1 <= '1';
        s_2 <= '1';
        s_3 <= '0';

        wait for msg_delay;
        s_0 <= '1';
        s_1 <= '1';
        s_2 <= '1';
        s_3 <= '0';

        wait for msg_delay;
        s_0 <= '0';
        s_1 <= '1';
        s_2 <= '1';
        s_3 <= '1';
    end process msg_gen;

    uut1 : entity work.h_coder
        port map(
            clk => clk,
            s_0 => s_0,
            s_1 => s_1,
		    s_2 => s_2,
            s_3 => s_3,
		    coded_out => coded_out
        );

    uut2 : entity work.h_decoder
        port map(
            clk => clk,
		    coded_in => coded_out,
            decoded_out => decoded_out
        );
    
end architecture logic;