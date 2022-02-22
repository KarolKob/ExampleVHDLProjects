library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm_2 is
    port ( clk, reset, x1 : IN std_logic;
           outp           : OUT std_logic);
end entity;

architecture beh1 of fsm_2 is
    type state_type is (s1,s2,s3,s4);
    signal c_state, n_state: state_type;
begin

    proc_fsm: process(c_state, x1) begin
            outp <= '0';
            case c_state is
                when s1 =>  
                    outp <= '1';
                    if x1='1' then 
                        n_state <= s2;
                    else
                        n_state <= s3;
                    end if;
                when s2 => 
                    outp <= '1';
                    n_state <= s4;
                when s3 => 
                    n_state <= s4;
                when s4 => 
                    n_state <= s1;
            end case;
    end process;

    proc_memory: process (clk,reset)
    begin
        if (reset ='1') then 
            c_state <= s1;
        elsif rising_edge(clk) then
            c_state <= n_state;
        end if;
    end process;

end beh1;
