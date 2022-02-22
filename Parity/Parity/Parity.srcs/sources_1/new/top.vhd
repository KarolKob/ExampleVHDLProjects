library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top is
    port (
        clk : in std_logic;
        s : in std_logic_vector(3 downto 0);
        b : in std_logic_vector(3 downto 0);
        d : out std_logic_vector(6 downto 0));
end entity top;

architecture behav of top is
    type state_type is (write_coder, send, display);
    signal c_state: state_type := write_coder;
    signal write_matrix, corrected_matrix: std_logic_vector(48 downto 0) := (others => '0');
    signal coder_sig_in, coder_sig_out, coder_out, b_pressed, b_released: std_logic;
    signal decoder_sig_in, decoder_in, deb_up, deb_down, deb_acc, deb_chng: std_logic;
    signal column_index, row_index, send_index: integer := 0;

    signal prev_pressed: std_logic_vector(3 downto 0) := (others => '0');
    signal deb_index: integer := 20;
    signal was_pressed: std_logic := '0';
begin

    buttons_proc: process(clk)
    begin
        if rising_edge(clk) then

            column_index <= to_integer(unsigned(s));

            debouncer: if was_pressed = '1' and deb_index /= 0 then
                deb_index <= deb_index - 1;

            elsif was_pressed = '1' and deb_index = 0 then
                if prev_pressed = b then

                    deb_up <= b(3);
                    deb_acc <= b(2);
                    deb_down <= b(1);
                    deb_chng <= b(0);

                    b_pressed <= '1';

                else
                    null;
                end if;

                was_pressed <= '0';
                deb_index <= 20;

            elsif prev_pressed /= b then
                was_pressed <= '1';
                prev_pressed <= b;

            else
                null;
            end if debouncer;

            case c_state is
                when write_coder =>

                    d <= write_matrix(row_index * 7 + 6 downto row_index * 7);
    
                    if b_pressed = '1' then

                        if not ((row_index = 0 and deb_up = '1') or (row_index = 6 and deb_down = '1')) then

                            if deb_up = '1' then
                                row_index <= row_index - 1;
                            elsif deb_down = '1' then
                                row_index <= row_index + 1;
                            end if;

                        else
                            null;
                        end if;

                        if deb_chng = '1' then

                            write_matrix(((row_index)*7) + column_index) <= not write_matrix(((row_index)*7) + column_index);

                        elsif deb_acc = '1' then
                            c_state <= send;
                            coder_sig_in <= '1';
                        else
                            null;
                        end if;

                        b_pressed <= '0';
                    else
                        null;
                    end if;    

                when send =>

                    coder_sig_in <= '0';

                    if send_index = 64 then
                        send_index <= send_index + 1;
                    elsif coder_sig_out = '1' and send_index = 28 then
                        
                        decoder_in <= not coder_out;
                        send_index <= send_index + 1;
                        decoder_sig_in <= '1';

                    elsif coder_sig_out = '1' and send_index < 64 then
                        decoder_in <= coder_out;
                        send_index <= send_index + 1;
                        decoder_sig_in <= '1';

                    elsif send_index = 65 then
                        c_state <= display;
                        send_index <= 0;
                        decoder_sig_in <= '0';
                    end if;
    
                when display =>

                    d <= corrected_matrix(row_index * 7 + 6 downto row_index * 7);
                    
                    if not b_pressed = '1' then

                        if not ((row_index = 0 and deb_up = '1') or (row_index = 6 and deb_down = '1')) then

                            if deb_up = '1' then
                                row_index <= row_index - 1;
                            elsif deb_down = '1' then
                                row_index <= row_index + 1;
                            end if;

                        else
                            null;
                        end if;
                        
                        if deb_chng = '1' then
                            c_state <= write_coder;
                        else
                            null;
                        end if;

                        b_pressed <= '1';

                    elsif b_released = '1' then
                        b_pressed <= '0';
                        b_released <= '0';
                    else
                        null;
                    end if;
    
                when others =>
                    null;
            end case;
        end if;
    end process buttons_proc;
    
    top1: entity work.p_coder
    port map(
        input_matrix => write_matrix,
        in_sig => coder_sig_in,
        clk => clk,
        out_sig => coder_sig_out,
        coded_out => coder_out
    );

    top2: entity work.p_decoder
    port map(
        clk => clk,
        in_sig => decoder_sig_in,
        coded_in => decoder_in,
        corrected_matrix => corrected_matrix
    );

end architecture behav;
