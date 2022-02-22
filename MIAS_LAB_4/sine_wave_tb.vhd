library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use work.sine_package.all;

entity sine_wave_tb is
  generic (
    zdel_count: integer := 1;
    initial: real := 0.0;
    dec_count: integer := 5
  );
end sine_wave_tb;

architecture bench of sine_wave_tb is

component sine_wave
  port( clock, reset, enable: in std_logic;
        wave_out: out sine_vector_type);
end component;

  signal clock, reset, enable: std_logic;
  signal wave_out: sine_vector_type;
  signal real_out: real;
  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;
  signal sh_out: real := initial;
  signal sd_out: std_logic := '0';
  signal dec_output: integer := 0;

begin

  real_out <= real(to_integer(signed(wave_out)));

  uut_wave: sine_wave port map ( clock, reset, enable, wave_out );

  uut_s_h: entity work.sample_hold port map ( wave_out, clock, sh_out );

  uut_s_d: entity work.sigma_delta
  generic map (zdel_count, initial)
  port map (sh_out, clock, sd_out);

  uut_dec: entity work.decymator
  generic map (dec_count)
  port map (
    clk => clock,
    rst => reset,
    dec_in => sd_out,
    dec_out => dec_output
  );

  stimulus: process
  begin
  
    -- Put initialisation code here

    enable <= '0';
    reset <= '1';
    wait for 5 ns;
    reset <= '0';

    wait for 5115 ns;
    enable <= '1';

    -- Put test bench stimulus code here
    wait for 1 ms;

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clock <= '1', '0' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;