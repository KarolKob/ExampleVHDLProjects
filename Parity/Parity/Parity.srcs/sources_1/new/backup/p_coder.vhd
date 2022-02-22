----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.12.2021 12:53:16
-- Design Name: 
-- Module Name: p_coder - behav
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity p_coder is
    Port ( input_matrix : in std_logic_vector(48 downto 0);
        in_sig : in std_logic;
        clk : in std_logic;
        out_sig : out std_logic;
        coded_out : out std_logic);
end p_coder;

architecture behav of p_coder is
    type state_type is (waiting, count_p, count_q, send);
    signal c_state: state_type := waiting;
    signal output_matrix std_logic_vector(63 downto 0);
    signal index integer := 0;
    signal p_vec std_logic_vector(6 downto 0);
    signal q_vec std_logic_vector(7 downto 0);

begin

    -- Rewrite the input matrix
    output_matrix(0 to 6) <= input_matrix(0 to 6);
    output_matrix(8 to 14) <= input_matrix(7 to 13);
    output_matrix(16 to 22) <= input_matrix(14 to 20);
    output_matrix(24 to 30) <= input_matrix(21 to 27);
    output_matrix(32 to 38) <= input_matrix(28 to 34);
    output_matrix(40 to 46) <= input_matrix(35 to 41);
    output_matrix(48 to 54) <= input_matrix(42 to 48);

    -- Merge with p vector in the last column
    output_matrix(7) <= p_vec(0);
    output_matrix(15) <= p_vec(1);
    output_matrix(23) <= p_vec(2);
    output_matrix(31) <= p_vec(3);
    output_matrix(39) <= p_vec(4);
    output_matrix(47) <= p_vec(5);
    output_matrix(55) <= p_vec(6);

    -- Add the q vector in the last row
    output_matrix(56 to 63) <= q_vec;

    proc_name: process(clk)
    begin
        if rising_edge(clk) then

            case c_state is
                when waiting =>

                    if in_sig = '1' then
                        c_state <= count_p;
                    end if;

                when count_p =>

                    p_vec(index) <= input_matrix(index*7) xor input_matrix(index*7 + 1) xor input_matrix(index*7 + 2) 
                    xor input_matrix(index*7 + 3) xor input_matrix(index*7 + 4) xor input_matrix(index*7 + 5) xor input_matrix(index*7 + 6);
                    index <= index + 1;

                    if index = 6 then
                        index <= 0;
                        c_state <= count_q;
                    end if;

                when count_q =>

                    if index < 7 then

                        q_vec(index) <= input_matrix(index) xor input_matrix(7+index) xor input_matrix(14+index) xor input_matrix(21+index)
                        xor input_matrix(28+index) xor input_matrix(35+index) xor input_matrix(42+index);
                        index <= index + 1;

                    elsif index = 7 then

                        q_vec(index) <= p_vec(0) xor p_vec(1) xor p_vec(2) xor p_vec(3) xor p_vec(4) xor p_vec(5) xor p_vec(6);
                        index <= index + 1;

                    else
                        index <= 0;
                        c_state <= send;
                        out_sig <= '1';
                    end if;

                when send =>

                    if index < 64 then
                        coded_out <= output_matrix(index);
                        index <= index + 1;
                    else
                        index <= 0;
                        c_state <= waiting;
                        out_sig <= '0';
                    end if;

                when others =>
                    null;
            end case;
        end if;
    end process proc_name;

end architecture behav;
