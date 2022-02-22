--Sine tb

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use work.sine_package.all;

entity sine_wave_tb is
end;

architecture bench of sine_wave_tb is

component sine_wave
  port( clock, reset, enable: in std_logic;
        wave_out: out sine_vector_type);
end component;

  signal clock, slow_clk, reset, reset_2, enable, enable_2: std_logic;
  signal wave_out, wave_out_2: sine_vector_type;
  signal real_out, real_out_2: real;
  constant clock_period: time := 10 ns;
  constant clock_slow_period: time := 100 ns;
  signal stop_the_clock: boolean;
  signal sh_out, zdel_out, lincom_out: real := 0.0;

begin

  real_out <= real(to_integer(signed(wave_out)));

  real_out_2 <= real(to_integer(signed(wave_out_2)));

  uut_wave: sine_wave port map ( clock, reset, enable, wave_out );

  uut_wave_2: sine_wave port map ( clock, reset_2, enable_2, wave_out_2 );

  uut_s_h: entity work.sample_hold port map ( wave_out, slow_clk, sh_out );

  uut_zdel: entity work.zdelay port map ( real_out, slow_clk, zdel_out );

  uut_lin_com: entity work.linearcombination port map ( real_out, real_out_2, lincom_out );

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

  stimulus_2: process
  begin
  
    -- Put initialisation code here

    wait for 500 ns;

    enable_2 <= '0';
    reset_2 <= '1';
    wait for 5 ns;
    reset_2 <= '0';

    wait for 5115 ns;
    enable_2 <= '1';

    -- Put test bench stimulus code here
    wait for 1 ms;
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

  slow_clocking: process
  begin
    while not stop_the_clock loop
      slow_clk <= '1', '0' after clock_slow_period / 2;
      wait for clock_slow_period;
    end loop;
    wait;
  end process;

end;
