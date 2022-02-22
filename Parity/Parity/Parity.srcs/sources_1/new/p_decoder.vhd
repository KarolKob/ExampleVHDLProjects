library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity p_decoder is
    port (
        clk : in std_logic;
        in_sig : in std_logic;
        coded_in : in std_logic;
        corrected_matrix : out std_logic_vector(48 downto 0)
    );
end entity p_decoder;

architecture behav of p_decoder is
    type state_type is (waiting, recieving, counting_q, counting_p);
    signal c_state: state_type := waiting;

    signal input_matrix: std_logic_vector(63 downto 0);
    signal b_matrix: std_logic_vector(48 downto 0);
    signal index, ind_q: integer := 0;
    signal p_vec: std_logic_vector(6 downto 0);
    signal q_vec: std_logic_vector(7 downto 0);

    signal check_q, check_p: std_logic;

begin    

    p_vec(0) <= input_matrix(7);
    p_vec(1) <= input_matrix(15);
    p_vec(2) <= input_matrix(23);
    p_vec(3) <= input_matrix(31);
    p_vec(4) <= input_matrix(39);
    p_vec(5) <= input_matrix(47);
    p_vec(6) <= input_matrix(55);

    q_vec <= input_matrix(63 downto 56);
    
    proc_name: process(clk)
    begin
        if rising_edge(clk) then
            case c_state is
                when waiting =>
                    
                    if in_sig = '1' then
                        c_state <= recieving;
                    end if;

                when recieving =>

                    b_matrix(6 downto 0)   <= input_matrix(6 downto 0);
                    b_matrix(13 downto 7)  <= input_matrix(14 downto 8);
                    b_matrix(20 downto 14) <= input_matrix(22 downto 16);
                    b_matrix(27 downto 21) <= input_matrix(30 downto 24);
                    b_matrix(34 downto 28) <= input_matrix(38 downto 32);
                    b_matrix(41 downto 35) <= input_matrix(46 downto 40);
                    b_matrix(48 downto 42) <= input_matrix(54 downto 48);

                    if in_sig = '0' or index = 64 then
                        c_state <= counting_q;
                        index <= 0;
                    else
                        input_matrix(index) <= coded_in;
                        index <= index + 1;
                    end if;

                when counting_q =>

                    if index < 7 then

                        check_q <= b_matrix(index) xor b_matrix(7+index) xor b_matrix(14+index) xor b_matrix(21+index)
                        xor b_matrix(28+index) xor b_matrix(35+index) xor b_matrix(42+index);
                        index <= index + 1;

                    elsif index = 7 then
                        null;
                    else
                        index <= 0;
                        c_state <= waiting;
                    end if;

                    if index > 0 then
                        if not(check_q = q_vec(index - 1)) then
                            ind_q <= index - 1;
                            index <= 0;
                            c_state <= counting_p;
                        end if;
                    end if;

                when counting_p =>

                    if index < 7 then

                        check_p <= b_matrix(index*7) xor b_matrix(index*7 + 1) xor b_matrix(index*7 + 2) 
                        xor b_matrix(index*7 + 3) xor b_matrix(index*7 + 4) xor b_matrix(index*7 + 5) xor b_matrix(index*7 + 6);
                        index <= index + 1;

                    elsif index = 7 then
                        index <= index + 1;
                    else
                        index <= 0;
                        c_state <= waiting;
                        corrected_matrix <= b_matrix;
                    end if;

                    if index > 0 and index < 8 then
                        if not(check_p = p_vec(index - 1)) then
                            b_matrix(((index-1)*7) + ind_q) <= not b_matrix(((index-1)*7) + ind_q);

                        end if;
                    end if;

                when others =>
                    null;
            
            end case;
            
        end if;
    end process proc_name;
    
end architecture behav;