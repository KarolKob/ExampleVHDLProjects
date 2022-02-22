library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  USE std.env.ALL; 

entity testbench is
  generic(
    bit_size: integer := 8;
    slave_count: integer := 1
    );
end testbench;

architecture logic of testbench is

  signal clk, reset_n, sclk, miso: std_logic;
  signal als_data: std_logic_vector(bit_size - 1 downto 0);
  signal ss_n: std_logic_vector(0 downto 0);

  procedure stop_after(t: in time) is
  begin
    wait for t;
    stop(2);
  end procedure;
        
begin

  stop_after(5 ms);

  uut1 : entity work.als_pmod
  PORT MAP(sck => sclk, cs => ss_n(0), sdo => miso, V_in => +1.5);

  uut2 : entity work.user_logic
  PORT MAP(clk => clk, reset_n => reset_n, als_data => als_data);

  uut3 : entity work.ambient_light_sensor
  PORT MAP(
    clk => clk,      
    reset_n => reset_n,    
    miso => miso,      
    sclk => sclk,     
    ss_n => ss_n,     
    als_data => als_data
    );
  
end logic ; -- logic