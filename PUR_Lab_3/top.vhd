----------------------------------------------------------------------------------
-- Company: CCE
-- Engineer: Kropidlowski Marek
-- 
-- Create Date:    21:02:45 04/25/2021 
-- Nexys4DDR lab3 ISE
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top is
  generic(DEBUG: boolean:=true);
  port (clk_sys: in std_logic;
        BTN_input: in std_logic_vector(5 downto 1);
        rst: in std_logic;
        -- led out
        an: out std_logic_vector(7 downto 0);
        sseg: out std_logic_vector(6 downto 0);
        f_out: out std_logic
        ); 
end entity;

architecture struct of top is
 constant DIGIT: positive:=9;
 constant TC_VAL: std_logic_vector(DIGIT*4-1 downto 0):=x"1234_5678_0";
 signal s_tc_val, q_out: std_logic_vector(TC_VAL'range);
 signal f_100Hz, f_1kHz, f_1MHz, f_out_i, t_1sec, t_1ms, t_1us, edit_en_out: std_logic;
 signal locked, locked_re: std_logic_vector(0 to 0);
 signal cntr_data: std_logic_vector(TC_VAL'range);
 alias a is cntr_data(3 downto 0);
 alias b is cntr_data(7 downto 4);
 alias c is cntr_data(11 downto 8);
 alias d is cntr_data(15 downto 12);
 alias e is cntr_data(19 downto 16);
 alias f is cntr_data(23 downto 20);
 alias g is cntr_data(27 downto 24);
 alias h is cntr_data(31 downto 28);
 alias i is cntr_data(35 downto 32);
 --
 signal control0, control1: std_logic_vector(35 downto 0);
 signal async_out: std_logic_vector(5 downto 0);
 signal BTN_debounced, BTN: std_logic_vector(5 downto 1);
 --alias tc_high8 is async_out(7 downto 0);
 alias dcm_rst is async_out(0);
 signal sync_out: std_logic_vector(1 downto 0);
 alias cntr_ce is sync_out(0);
 alias cntr_rst is sync_out(1);
 signal trig0: std_logic_vector(72 downto 0);
 alias left is BTN(5);
 alias right is BTN(4);
 alias up is BTN(3);
 alias down is BTN(2);
 alias center is BTN(1);

 signal key_fsm_rst: std_logic := '0';
 
 component vio_1
  PORT (
    CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CLK : IN STD_LOGIC;
    ASYNC_OUT : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    SYNC_OUT : OUT STD_LOGIC_VECTOR(1 DOWNTO 0));

end component;

component icon_1
    PORT (
      CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));
  
  end component;

component ila_1
    PORT (
      CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
      CLK : IN STD_LOGIC;
      TRIG0 : IN STD_LOGIC_VECTOR(72 DOWNTO 0));
  
  end component;

begin

  f_out<=f_out_i;
  -- ----
    clk_gen_hz: entity work.clk_gen_1Hz_v6
    generic map(false)
    port map(
        clk_in => clk_sys,
        rst => rst, -- async high
        f_100Hz => f_100Hz, f_1kHz => f_1kHz, f_1MHz => f_1MHz,
        t_1sec => t_1sec, t_1ms => t_1ms, t_1us => t_1us
    );
  -- ----

  key_fsm: entity work.key_fsm_c 
  Generic MAP (DIGIT=>DIGIT)
  PORT MAP (
    clk => f_1MHz,
    rst => rst,
    left => left,
    right => right,
    up => up,
    down => down,
    center => center,

    data_out => s_tc_val,
    cntr_en => cntr_ce,
    cntr_rst => cntr_rst,
    cntr_load => locked_re(0),
    edit_en_out => edit_en_out
  );

  debouncer: entity work.debounceN
  generic map(N =>5)
    port map(
        clk_sys => f_1MHz, -- system clock
        clk_slow => f_100Hz, -- debounce clock (100Hz)
        button => BTN,
        trigger_out => BTN_debounced
    );

  edge_inst: entity work.edge_detector
    generic map(N=>5,RisingEdge=>true)
    port map(clk_sys=>f_1MHz, async_in=>BTN_debounced, edge_flag=>BTN);

        cntr_inst: entity work.cntr_Nbcd_load
    generic map(DIGIT=>DIGIT)
    port map(clk=>f_1MHz, rst=>cntr_rst, ce=>cntr_ce, 
        load=>locked_re(0), din=>s_tc_val, q=>q_out, ceo=>f_out_i );

    mux: entity work.mux2
    generic map(DIGIT=>DIGIT)
    port map(
        a1 => s_tc_val,
        a2 => q_out,
        sel => edit_en_out,
        b => cntr_data
    );

  led_drv_inst: entity work.led8_drv
    generic map(MAIN_CLK=>10E6, CLKDIV_INTERNAL=>true)
    port map(a=>b, b=>c, c=>d, d=>e, e=>f, f=>g, g=>h, h=>i,
        clk_in=>f_1kHz, sseg=>sseg, an=>an);

--- debug -----------------------------------------------------------

	debug_inst: if DEBUG generate

    your_instance_name : icon_1
    port map (
    CONTROL0 => CONTROL0);

	ila_inst : ila_1
	port map (
    CONTROL => control0,
    CLK => f_1MHz,
    TRIG0 => trig0);

	vio_inst : vio_1
	port map (
    CONTROL => control1,
    CLK => f_1MHz,
    ASYNC_OUT => async_out,
    SYNC_OUT => sync_out);
	--	        72-37       36	    35			 34				33		  32		 31-0
	trig0 <= (s_tc_val & f_out_i & locked(0) & locked_re(0) & cntr_ce & cntr_rst & cntr_data(35 downto 4));
	--s_tc_val <= tc_high8 & std_logic_vector'(x"99_9999_9");
	end generate;
	
	no_debug_inst: if not DEBUG generate
		async_out <= (others => '0');
    BTN <= (others => '0');
		sync_out <= "01";
		trig0 <= (others => '0');
		s_tc_val <= TC_VAL;
	end generate;

end architecture;
---------------------------------------------------------------------