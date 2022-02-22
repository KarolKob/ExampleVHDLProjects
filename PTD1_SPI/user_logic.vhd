library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity user_logic is
    generic(
        bit_size: integer := 8;
        clk_period: delay_length := 100 ns
    );
    port (
        clk: out std_logic;
        reset_n: out std_logic;
        als_data: in std_logic_vector(bit_size - 1 downto 0)
    );
end entity;

architecture logic of user_logic is

    procedure clk_gen (signal s: out std_ulogic; offset,hpulse,period: delay_length ) is
    begin
        wait for offset;
        loop
            s <= '1', '0' after hpulse;
            wait for period;
        end loop;
    end procedure;

begin

    clk_gen(clk, 0 ns, clk_period / 2, clk_period);

    reset_n<='1';

end logic ; -- logic