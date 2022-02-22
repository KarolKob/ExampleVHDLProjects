library ieee;
	use ieee.std_logic_1164.all;
	use IEEE.STD_LOGIC_ARITH.ALL;
	use IEEE.STD_LOGIC_UNSIGNED.ALL;
	use ieee.numeric_std.all;
	use IEEE.STD_LOGIC_UNSIGNED.ALL;
	use work.devices_pkg.all;

entity counter is
	GENERIC (
        modulo: std_logic_vector(23 downto 0):= x"136259" 
    );
	PORT (
		reset: in std_logic := '0'; -- reset asynchroniczny, aktywny '1'
		clock: in std_logic;  -- zegar
		tc: out std_logic;
		cnt_output: out std_logic_vector(23 downto 0) -- wyjscie danych
	);
end counter;
		
architecture struct of counter is
    signal ceo_1, ceo_2, ceo_3, ceo_4, ceo_5, ceo_6, rsti, z : std_logic := '0';
	signal Qi: std_logic_vector(23 downto 0);
    
    begin
        cntr_1: component cntr_u
        port map(rst => z, ce => '1', clk => clock, ceo => ceo_1, q => Qi(3 downto 0)); 
		cntr_2: component cntr_u
        port map(rst => z, ce => ceo_1, clk => clock, ceo => ceo_2, q => Qi(7 downto 4));  
		cntr_3: component cntr_u
        port map(rst => z, ce => ceo_2, clk => clock, ceo => ceo_3, q => Qi(11 downto 8)); 
		cntr_4: component cntr_u
        port map(rst => z, ce => ceo_3, clk => clock, ceo => ceo_4, q => Qi(15 downto 12)); 
		cntr_5: component cntr_u
        port map(rst => z, ce => ceo_4, clk => clock, ceo => ceo_5, q => Qi(19 downto 16)); 
		cntr_6: component cntr_u
        port map(rst => z, ce => ceo_5, clk => clock, ceo => ceo_6, q => Qi(23 downto 20)); 
		
		rsti <= '1' when (Qi = modulo) else '0';
		tc <= rsti;
		z <= reset or rsti;
		cnt_output <= Qi;
              
end architecture struct;