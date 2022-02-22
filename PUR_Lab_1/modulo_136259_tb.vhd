library ieee;
	use ieee.std_logic_1164.all;
	use IEEE.STD_LOGIC_ARITH.ALL;
	use IEEE.STD_LOGIC_UNSIGNED.ALL;
	use ieee.numeric_std.all;
	use IEEE.STD_LOGIC_UNSIGNED.ALL;
	use work.counter;
	
entity modulo_136259_tb is
	generic(
		force_time: time := 100 ns;
		simulation_time: time := 14000000 ns
	);
end entity modulo_136259_tb;

architecture behav of modulo_136259_tb is
	signal rst_i, clk_i, tc_i: std_logic := '0';
	signal cnt_out_i: std_logic_vector(23 downto 0);

	procedure clock_gen(signal s:out std_logic; period: delay_length) is
		begin loop
			s <= '0', '1' after period/2;
			wait for period;
		end loop;
	end procedure; 
 
	procedure end_of_sim is
	begin
		wait for simulation_time;
		assert false
		report "End of simulation at time " & time'image(now)
		severity Failure;
	end procedure;
	
	procedure get_pulse(signal s:in std_logic; name: string:="signal ") is
	variable t1, t2: delay_length:=0 ns;
	begin
		if rising_edge(s) then t1:=now;
			wait until s='0';
			t2:=now - t1;
			report name & time'image(t2) severity Warning;
		end if;
	end procedure;
	
	procedure counting_time(signal cnt:in std_logic_vector(23 downto 0); name: string:="signal ") is
	variable t1, t2: delay_length := 0 ns;
	begin
		if (cnt = x"000000") then t1 := now;
			wait until cnt = x"136258";
			t2 := now - t1;
			report name & time'image(t2) severity Warning;
			report "Last state: 136258";
		end if;
	end procedure;

begin
	cnt_mod: entity counter
	port map(reset => rst_i, clock => clk_i, tc => tc_i, cnt_output => cnt_out_i);
	
	end_of_sim;
	
	clock_gen(clk_i, force_time);
	
	get_pulse(tc_i, "Detected ceo rising edge. Duration: ");
	
	counting_time(cnt_out_i, "Counting cycle ended. Time: ");
	
end architecture behav;
