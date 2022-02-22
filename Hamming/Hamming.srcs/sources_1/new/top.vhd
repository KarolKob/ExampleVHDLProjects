library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top is
    port (
        s : in std_logic_vector(3 downto 0);
        d : out std_logic_vector(3 downto 0));
end entity top;

architecture behav of top is
    
    signal cdr_b, decdr_ce: std_logic_vector(3 downto 0) := (others => '0');
    signal cdr_c, decdr_r: std_logic_vector(6 downto 0) := (others => '0');

begin

    cdr_b <= s;

    top_proc: process(cdr_c)
    begin
        decdr_r <= cdr_c;
        decdr_r(4) <= not cdr_c(4);
    end process top_proc;

    d <= decdr_ce;

   top1: entity work.Coder
    port map(
        b => cdr_b,
        c => cdr_c
    );

    top2: entity work.Decoder
    port map(
        r => decdr_r,
        ce => decdr_ce
    );

end architecture behav;
