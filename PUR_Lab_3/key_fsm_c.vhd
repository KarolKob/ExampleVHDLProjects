LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity key_fsm_c is
	generic (
		DIGIT: positive := 8
	);
	port (clk: in std_logic;
		rst: in std_logic; -- synch, high
		left, right, up, down, center: in std_logic; -- keys
		data_out: out std_logic_vector(DIGIT*4-1 downto 0);
		cntr_en: out std_logic;
		cntr_rst: out std_logic;
		cntr_load: out std_logic;
		edit_en_out: out std_logic
	);
end entity;

architecture behav of key_fsm_c is
	type state_type is (idle, start, stop, reset, load, edit, inc_val, dec_val, inc_pos, dec_pos);
	type reg is array(0 to DIGIT-1) of std_logic_vector(3 downto 0);
	signal memory_reg: reg := (others => (others => '0'));
    signal curr_state, nxt_state: state_type;
	signal counting_end: std_logic_vector(DIGIT*4-1 downto 0) := (others => '0');
	signal index: integer := 0;
	signal inc_val_flag, dec_val_flag, inc_pos_flag, dec_pos_flag: std_logic := '0';
begin
	proc_fsm: process(curr_state, left, right, up, down, center)
	begin

		cntr_load <= '0';
		cntr_rst <= '0';
		inc_val_flag <= '0';
		dec_val_flag <= '0';
		inc_pos_flag <= '0';
		dec_pos_flag <= '0';

		case curr_state is

			when idle =>

				if (left = '1') then
					nxt_state <= stop;
				elsif (right = '1') then
					nxt_state <= start;
				elsif (up = '1') then
					nxt_state <= load;
				elsif (down = '1') then
					nxt_state <= reset;
				elsif (center = '1') then
					nxt_state <= edit;
				else
					nxt_state <= idle;
				end if;

			when start =>

				nxt_state <= idle;
				
			when stop =>

				nxt_state <= idle;

			when reset =>

				cntr_load <= '0';
				cntr_rst <= '1';
				nxt_state <= idle;

			when load =>

				cntr_load <= '1';
				nxt_state <= idle;

			when inc_val =>

				inc_val_flag <= '1';
				nxt_state <= edit;

			when dec_val =>
				
				dec_val_flag <= '1';
				nxt_state <= edit;

			when inc_pos =>

				inc_pos_flag <= '1';
				nxt_state <= edit;

			when dec_pos =>

				dec_pos_flag <= '1';
				nxt_state <= edit;

			when edit =>

				if (left = '1') then
					nxt_state <= inc_pos;
				elsif (right = '1') then
					nxt_state <= dec_pos;
				elsif (up = '1') then
					nxt_state <= inc_val;
				elsif (down = '1') then
					nxt_state <= dec_val;
				elsif (center = '1') then
					nxt_state <= load;
				else
					nxt_state <= edit;
				end if;

		end case;
	end process;
	
	proc_memory: process (clk, rst)
	begin
		if (rst ='1') then 

			curr_state <= idle;
			memory_reg <= (others => (others => '0'));
			cntr_en <= '0';
			edit_en_out <= '0';
			index <= 0;

        elsif rising_edge(clk) then

            curr_state <= nxt_state;

			case curr_state is
				when start =>
					cntr_en <= '1';
				when stop =>
					cntr_en <= '0';
				when load =>
					edit_en_out <= '0';
				when edit =>
					cntr_en <= '0';
					edit_en_out <= '1';
				when others =>
				null;
			end case;

			if (inc_val_flag = '1') then
				if (memory_reg(index) = 9) then
					memory_reg(index) <= x"0";
				else
					memory_reg(index) <= memory_reg(index) + 1;
				end if;
			end if;
					
			if (dec_val_flag = '1') then
				if (memory_reg(index) = 0) then
					memory_reg(index) <= x"9";
				else
					memory_reg(index) <= memory_reg(index) - 1;
				end if;
			end if;

			if (inc_pos_flag = '1') then
				if (index < DIGIT-1) then
					index <= index + 1;
				else
					index <= 0;
				end if;
			end if;

			if (dec_pos_flag = '1') then
				if (index > 0) then
					index <= index - 4;
				else
					index <= DIGIT-1;
				end if;
			end if;

        end if;
	end process;

	gen_data_out: for iter in DIGIT-1 downto 0 generate
		data_out(4*(iter+1)-1 downto 4*iter) <= memory_reg(iter);
	end generate gen_data_out;

end architecture behav;