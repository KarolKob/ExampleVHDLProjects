library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity h_decoder is
    port(clk: in std_logic;
		coded_in: in std_logic;
        out_sig: in std_logic;
        decoded_out: out std_logic_vector(3 downto 0)
        );
end entity;

architecture behav of h_decoder is

    type state_type is (start, st0, st1, st00, st01, st10, st11, st010, st011, 
        st100, st101, st110, st111, st1010, st1011, st1100, st1101, st1110, 
        st1111, st11010, st11011, st11100, st11101, st11110, st11111, st111100, 
        st111101, st111110, st111111, st1111110, st1111111);

	signal prev_input: std_logic := '0';
    signal c_state, n_state: state_type := start;

begin
	
    state_proc: process(clk)
    begin
        
        n_state <= start;
        
        if out_sig = '0' then
            null;
        else
        
            case c_state is
                when start => --n_state <= st0 when coded_in = '0' else st1;
                    if coded_in = '0' then
                        n_state <= st0;
                    else
                        n_state <= st1;
                    end if;
                when st0 => --n_state <= st00 when coded_in = '0' else st01;
                    if coded_in = '0' then
                        n_state <= st00;
                    else
                        n_state <= st01;
                    end if;
                when st01 => --n_state <= st010 when coded_in = '0' else st011;
                    if coded_in = '0' then
                        n_state <= st010;
                    else
                        n_state <= st011;
                    end if;
                when st1 => --n_state <= st10 when coded_in = '0' else st11;
                    if coded_in = '0' then
                        n_state <= st10;
                    else
                        n_state <= st11;
                    end if;
                when st10 => --n_state <= st010 when coded_in = '0' else st011;
                if coded_in = '0' then
                    n_state <= st100;
                else
                    n_state <= st101;
                end if;
                when st101 => --n_state <= st010 when coded_in = '0' else st011;
                if coded_in = '0' then
                    n_state <= st1010;
                else
                    n_state <= st1011;
                end if;
                when st11 => --n_state <= st110 when coded_in = '0' else st111;
                    if coded_in = '0' then
                        n_state <= st110;
                    else
                        n_state <= st111;
                    end if;
                when st110 => --n_state <= st1100 when coded_in = '0' else st1101;
                    if coded_in = '0' then
                        n_state <= st1100;
                    else
                        n_state <= st1101;
                    end if;
                when st1101 => --n_state <= st11010 when coded_in = '0' else st11011;
                    if coded_in = '0' then
                        n_state <= st11010;
                    else
                        n_state <= st11011;
                    end if;
                when st111 => --n_state <= st1110 when coded_in = '0' else st1111;
                    if coded_in = '0' then
                        n_state <= st1110;
                    else
                        n_state <= st1111;
                    end if;
                when st1110 => --n_state <= st11100 when coded_in = '0' else st11101;
                    if coded_in = '0' then
                        n_state <= st11100;
                    else
                        n_state <= st11101;
                    end if;
                when st1111 => --n_state <= st11100 when coded_in = '0' else st11101;
                if coded_in = '0' then
                    n_state <= st11110;
                else
                    n_state <= st11111;
                end if;
                when st11110 => --n_state <= st11110 when coded_in = '0' else st11111;
                    if coded_in = '0' then
                        n_state <= st111100;
                    else
                        n_state <= st111101;
                    end if;
                when st11111 => --n_state <= st11110 when coded_in = '0' else st11111;
                if coded_in = '0' then
                    n_state <= st111110;
                else
                    n_state <= st111111;
                end if;
                when st111111 => --n_state <= st11110 when coded_in = '0' else st11111;
                    if coded_in = '0' then
                        n_state <= st1111110;
                    else
                        n_state <= st1111111;
                    end if;
                when others =>
                    null;
            
            end case;
            
        end if;

    end process state_proc;
	
	clk_proc:  process (clk)
	begin
	  if clk'event and clk = '1' then

        c_state <= n_state;
        
        case c_state is                         -- DONE
            when st00 => decoded_out <= "0000";
                c_state <= start;
            when st010 => decoded_out <= "0001";
                c_state <= start;
            when st011 => decoded_out <= "0010";
                c_state <= start;
            when st100 => decoded_out <= "0100";
                c_state <= start;
            when st1010 => decoded_out <= "1000";
                c_state <= start;
            when st1011 => decoded_out <= "0011";
                c_state <= start;
            when st1100 => decoded_out <= "1100";
                c_state <= start;
            when st11010 => decoded_out <= "0101";
                c_state <= start;
            when st11011 => decoded_out <= "0110";
                c_state <= start;
            when st11100 => decoded_out <= "1001";
                c_state <= start;
            when st11101 => decoded_out <= "1010";
                c_state <= start;
            when st111100 => decoded_out <= "0111";
                c_state <= start;
            when st111101 => decoded_out <= "1011";
                c_state <= start;
            when st111110 => decoded_out <= "1101";
                c_state <= start;
            when st1111110 => decoded_out <= "1110";
                c_state <= start;
            when st1111111 => decoded_out <= "1111";
                c_state <= start;
            when others =>
                null;
            
        end case;
		
	  end if;
	end process;

end architecture;