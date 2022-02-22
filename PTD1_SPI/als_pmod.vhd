library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity als_pmod is
    port (
        sck: in std_logic;
        cs: in std_logic;
        sdo: out std_logic;
        V_in: in real
    );
end entity;

architecture behav of als_pmod is

    constant bit_size: integer := 8;
    signal tx_load_en, busy: std_logic;
    signal adc_out: std_logic_vector(bit_size downto 1);
    
begin

    SLAVE : entity work.spi_slave
    GENERIC MAP (d_width => bit_size)
    PORT MAP(
        sclk => sck,
        reset_n => '1',
        ss_n => cs,
        miso => sdo,
        tx_load_en => tx_load_en,
        tx_load_data => adc_out,
        busy => busy,
        st_load_en => '0',
        st_load_trdy => '0',
        st_load_rrdy => '0',
        st_load_roe => '0',
        trdy => open,
        rrdy => open,
        roe => open,
        mosi => '0',
        rx_req => '0',
        rx_data => open
    );

    gen_load: process(busy)
    begin
        if busy = '0' then
            tx_load_en <= '1';
        else
            tx_load_en <= '0';
        end if;
    end process gen_load;

    ADC : entity work.ADC
        GENERIC MAP(V_a => 3.0, bit_size=> bit_size)
        PORT MAP(V_in=> V_in, Bits_out=> adc_out);

end behav ; -- behav