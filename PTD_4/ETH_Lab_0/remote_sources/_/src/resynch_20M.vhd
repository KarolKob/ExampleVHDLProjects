-------------------------------------------------------------------------------
-- Project: UDP Data Logger
-- Author(s): HusTakocem
-- Created: Mar 2016 
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity resynch_20M is
    generic(t: time := 100 ps;
            N: integer := 16);
    port(synch_out: out std_logic_vector(N-1 downto 0);
        bus_in: in std_logic_vector(N-1 downto 0);
        --asynch_in: in std_logic;
        clk_sys : in std_logic);
end resynch_20M;

architecture behav of resynch_20M is
    signal inData_d1, inData_d2: std_logic_vector(N-1 downto 0);

begin

-- adc resampling to main clk domain
data_resampl: Process (clk_sys) begin
  if rising_edge(clk_sys) Then
    inData_d1 <= bus_in;
    inData_d2 <= inData_d1;
  end if;
end Process;

synch_out <= inData_d2;

end behav;