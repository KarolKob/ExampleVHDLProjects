library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity h_decoder is
    port(clk: in std_logic;
		coded_in: in std_logic;
        decoded_out: out std_logic_vector(3 downto 0)
        );
end entity;

architecture behav of h_decoder is

    type state_type is (start, st0, st00, st01, st000, st001, st010, st011,
        st1, st10, st11, st110, st1100, st11000, st11001, st1101, st11010, st11011, st110110, st110111,
        st111, st1110, st11100, st11101, st111010, st111011, st1110110, st1110111, st1111, st11110, st11111);

	signal prev_input, input_changed: std_logic := '0';
    signal c_state, n_state: state_type := start;

begin
	
    state_proc: process(clk)
    begin
        
        n_state <= start;
        
         if coded_in = 'U' then
            null;
        else
        
            case c_state is
                when start => n_state <= st0 when coded_in = '0' else st1;
                    
                when st0 => n_state <= st00 when coded_in = '0' else st01;
    
                when st00 => n_state <= st000 when coded_in = '0' else st001;
    
                when st01 => n_state <= st010 when coded_in = '0' else st011;
    
                when st1 => n_state <= st10 when coded_in = '0' else st11;
    
                when st11 => n_state <= st110 when coded_in = '0' else st111;
    
                when st110 => n_state <= st1100 when coded_in = '0' else st1101;
    
                when st1100 => n_state <= st11000 when coded_in = '0' else st11001;
    
                when st1101 => n_state <= st11010 when coded_in = '0' else st11011;
    
                when st11011 => n_state <= st110110 when coded_in = '0' else st110111;
    
                when st111 => n_state <= st1110 when coded_in = '0' else st1111;
    
                when st1110 => n_state <= st11100 when coded_in = '0' else st11101;
    
                when st11101 => n_state <= st111010 when coded_in = '0' else st111011;
    
                when st111011 => n_state <= st1110110 when coded_in = '0' else st1110111;
    
                when st1111 => n_state <= st11110 when coded_in = '0' else st11111;
            
                when others =>
                    null;
            
            end case;
            
        end if;

    end process state_proc;
	
	clk_proc:  process (clk)
	begin
	  if clk'event and clk = '1' then

        c_state <= n_state;

        input_changed <= '0';
		
        if prev_input = coded_in or coded_in = 'U' then
            prev_input <= coded_in;
        else
            input_changed <= '1';       --od razu po rozpoczeciu symulacji pojawia sie 1
            prev_input <= coded_in;
        end if;
        
        case c_state is
            when st000 => decoded_out <= "0001";
                c_state <= start;
            when st001 => decoded_out <= "0010";
                c_state <= start;
            when st010 => decoded_out <= "0100";
                c_state <= start;
            when st011 => decoded_out <= "1000";
                c_state <= start;
            when st10 => decoded_out <= "0000";
                c_state <= start;
            when st11000 => decoded_out <= "0110";
                c_state <= start;
            when st11001 => decoded_out <= "1001";
                c_state <= start;
            when st11010 => decoded_out <= "1010";
                c_state <= start;
            when st110110 => decoded_out <= "1011";
                c_state <= start;
            when st110111 => decoded_out <= "1101";
                c_state <= start;
            when st11100 => decoded_out <= "0101";
                c_state <= start;
            when st111010 => decoded_out <= "0111";
                c_state <= start;
            when st1110110 => decoded_out <= "1111";
                c_state <= start;
            when st1110111 => decoded_out <= "1110";
                c_state <= start;
            when st11110 => decoded_out <= "0011";
                c_state <= start;
            when st11111 => decoded_out <= "1100";
                c_state <= start;
            when others =>
                null;
            
        end case;
		
	  end if;
	end process;

end architecture;