LIBRARY ieee;
USE ieee.std_logic_1164.all;
use work.lrc.all;

entity uart_correspondent is
    generic(
        d_width: integer := 8
    );
    port(
        clk: in std_logic;
        rst_n: in std_logic;
        tx: out std_logic;
        rx: in std_logic
    );
end entity uart_correspondent;

architecture logic of uart_correspondent is
    
    signal tx_data, rx_data : std_logic_vector(7 downto 0);
    signal tx_enable, tx_busy, rx_busy, rx_error, tx_is_ready, send_was_enabled : std_logic := '0';

    type state_type is (idle_s, recv_s, send_s, proc_s);
    signal curr_state, next_state: state_type := idle_s;

    signal msg: std_logic_vector(7 downto 0);

begin
    
    uart_interface : entity work.uart
        generic map(d_width => d_width)
        port map(clk => clk,
            reset_n	=> rst_n,
            tx_ena => tx_enable,
            tx_data => tx_data,
            rx => rx,
            rx_busy	=> rx_busy,
            rx_error => rx_error,
            rx_data	=> rx_data,
            tx_busy => tx_busy,
            tx => tx
        );

        proc_fsm: process(rx_busy, tx_is_ready, rx_data, tx_enable, tx_busy, curr_state)
        begin
            case curr_state is
                when idle_s =>
                    if send_was_enabled = '1' or rx_busy = '1' then

                        next_state <= recv_s;

                    else
                        case rx_data is
                            when checksum("Hello") =>
                                
                                msg <= checksum("Hello");
                                next_state <= proc_s;
                        
                            when checksum("What is the temperature?") =>
                                
                                msg <= checksum("20 degrees");
                                next_state <= proc_s;
                        
                            when checksum("Bye") =>

                                msg <= checksum("Bye");
                                next_state <= proc_s;

                            when others =>

                                next_state <= idle_s;

                        end case;
                    end if;
            
                when recv_s =>

                    if rx_busy = '0' then
                        next_state <= idle_s;
                    else
                        next_state <= recv_s;
                        send_was_enabled <= '0';
                    end if;

                when send_s =>

                    send_was_enabled <= '1';

                    if tx_enable = '0' and tx_busy = '0' then
                        next_state <= recv_s;
                    else
                        next_state <= send_s;
                    end if;

                when proc_s =>

                    if tx_is_ready = '0' then
                        next_state <= proc_s;
                    else
                        next_state <= send_s;
                    end if;
            
            end case;
        end process proc_fsm;
    
        proc_memory: process (clk, rst_n) is
        begin
            if rising_edge(clk) then
                if rst_n = '0' then 

                    curr_state <= idle_s;

                else

                    curr_state <= next_state;

                    case next_state is
                        when send_s =>
                            
                        if send_was_enabled = '0' then
                            tx_enable <= '1';
                            
                        else
                            tx_enable <= '0';
                            tx_is_ready <= '0';

                        end if;

                        when proc_s =>

                            tx_data <= msg;
                            tx_is_ready <= '1';

                        when others => null;

                    end case;
                end if;
            end if;
        end process proc_memory;
    
end architecture logic;
