library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity h_coder is
    port(clk: in std_logic;
         s_0: in std_logic;	-- Numer oznacza pozycje na ktorej wystepuje 1
         s_1: in std_logic;	-- np stan wysoki na s_0 i niski na pozostalych to 0001
		 s_2: in std_logic;
         s_3: in std_logic;
		 coded_out: out std_logic;
		 out_sig: out std_logic
         );
end entity;

architecture behav of h_coder is
	signal input_vec: std_logic_vector(3 downto 0);
	signal vec_size, old_vec_size, offset: integer := 0;
	signal is_sending, send_flag, code_chng: std_logic := '0';
	signal code, old_code: std_logic_vector(6 downto 0);
begin

	input_vec(0) <= s_0;
	input_vec(1) <= s_1;
	input_vec(2) <= s_2;
	input_vec(3) <= s_3;

	przyc: process (input_vec)
	begin

		send_flag <= '0';
	
		if is_sending = '0' then
		
			case input_vec is
				when "0000" => code <= "0000000"; vec_size <= 2; send_flag <= '1';
				when "0001" => code <= "0000010"; vec_size <= 3; send_flag <= '1';
				when "0010" => code <= "0000011"; vec_size <= 3; send_flag <= '1';
				when "0100" => code <= "0000100"; vec_size <= 3; send_flag <= '1';
				when "1000" => code <= "0001010"; vec_size <= 4; send_flag <= '1';
				when "0011" => code <= "0001011"; vec_size <= 4; send_flag <= '1';
				when "1100" => code <= "0001100"; vec_size <= 4; send_flag <= '1';
				when "0101" => code <= "0011010"; vec_size <= 5; send_flag <= '1';
				when "0110" => code <= "0011011"; vec_size <= 5; send_flag <= '1';
				when "1001" => code <= "0011100"; vec_size <= 5; send_flag <= '1';
				when "1010" => code <= "0011101"; vec_size <= 5; send_flag <= '1';
				when "0111" => code <= "0111100"; vec_size <= 6; send_flag <= '1';
				when "1011" => code <= "0111101"; vec_size <= 6; send_flag <= '1';
				when "1101" => code <= "0111110"; vec_size <= 6; send_flag <= '1';
				when "1110" => code <= "1111110"; vec_size <= 7; send_flag <= '1';
				when "1111" => code <= "1111111"; vec_size <= 7; send_flag <= '1';
				when others => null;
			end case;
			
		else	
			null;
		end if;
	  
	end process;
	
	clk_proc:  process (clk)
	begin
	  if clk'event and clk = '1' then

		out_sig <= '1';
		
		if code = old_code and old_vec_size = vec_size then
		  code_chng <= '0';
		else
		  code_chng <= '1';
		  old_code <= code;
		  old_vec_size <= vec_size;
		end if;
		
		if code_chng = '1' and send_flag = '1' and is_sending = '0' and vec_size > 1 then
		
			is_sending <= '1';
			offset <= vec_size - 2;
			coded_out <= code(vec_size - 1);

		elsif offset >= 0 and is_sending = '1' then

			coded_out <= code(offset);
			offset <= offset - 1;

		else

			is_sending <= '0';
			coded_out <= '0';
			out_sig <= '0';

		end if;
			
			
		
	  end if;
	end process;

end architecture;