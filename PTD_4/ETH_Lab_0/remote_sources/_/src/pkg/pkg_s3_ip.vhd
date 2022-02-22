-------------------------------------------------------------------------------
-- Project: ---
-- Author(s): HusTakocem
-- Created: Dec 2015 
-------------------------------------------------------------------------------
-- Spartan3E ip-cores pkg
--

library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
--library unisim;
--use unisim.vcomponents.all;

Package pkg_s3_ip Is

  component net_dcm_25_dbg is
   port ( CLKIN_IN        : in    std_logic; 
          RST_IN          : in    std_logic; 
          CLKIN_IBUFG_OUT : out   std_logic; 
          CLK0_OUT        : out   std_logic; 
          CLK2X_OUT       : out   std_logic; 
          CLK2X180_OUT    : out   std_logic; 
          CLK180_OUT      : out   std_logic; 
          LOCKED_OUT      : out   std_logic);
  end component;

  component net_dcm_125_dgb is
     port ( CLKIN_IN        : in    std_logic; 
            RST_IN          : in    std_logic; 
            CLKFX_OUT       : out   std_logic; 
            CLKFX180_OUT    : out   std_logic; 
            CLKIN_IBUFG_OUT : out   std_logic; 
            CLK0_OUT        : out   std_logic; 
            LOCKED_OUT      : out   std_logic);
  end component;

    
    -- 2k 8-bit fifo with rst and prog full_th 
    COMPONENT event_fifo_8_2k
      PORT (
        rst : IN STD_LOGIC;
        wr_clk : IN STD_LOGIC;
        rd_clk : IN STD_LOGIC;
        din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        wr_en : IN STD_LOGIC;
        rd_en : IN STD_LOGIC;
        prog_full_thresh : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        full : OUT STD_LOGIC;
        empty : OUT STD_LOGIC;
        rd_data_count : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
        prog_full : OUT STD_LOGIC
      );
    END COMPONENT;

    -- 2k 16-bit fifo with rst and prog full_th 
    COMPONENT event_fifo_16_2k
      PORT (
        rst : IN STD_LOGIC;
        wr_clk : IN STD_LOGIC;
        rd_clk : IN STD_LOGIC;
        din : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        wr_en : IN STD_LOGIC;
        rd_en : IN STD_LOGIC;
        prog_full_thresh : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        dout : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        full : OUT STD_LOGIC;
        empty : OUT STD_LOGIC;
        rd_data_count : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
        prog_full : OUT STD_LOGIC
      );
    END COMPONENT;

    -- 2k 32-bit fifo with rst and prog full_th 
    component event_fifo_32_2k IS
      PORT (
        rst : IN STD_LOGIC;
        wr_clk : IN STD_LOGIC;
        rd_clk : IN STD_LOGIC;
        din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        wr_en : IN STD_LOGIC;
        rd_en : IN STD_LOGIC;
        prog_full_thresh : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        full : OUT STD_LOGIC;
        empty : OUT STD_LOGIC;
        rd_data_count : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
        prog_full : OUT STD_LOGIC
      );
    END component;

    -- 2k 64-bit fifo with rst and prog full_th 
    component event_fifo_64_2k IS
      PORT (
        rst : IN STD_LOGIC;
        wr_clk : IN STD_LOGIC;
        rd_clk : IN STD_LOGIC;
        din : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
        wr_en : IN STD_LOGIC;
        rd_en : IN STD_LOGIC;
        prog_full_thresh : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        dout : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
        full : OUT STD_LOGIC;
        empty : OUT STD_LOGIC;
        rd_data_count : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
        prog_full : OUT STD_LOGIC
      );
    END component;

    COMPONENT pay_fifo_8_2k
      PORT (
        rst : IN STD_LOGIC;
        wr_clk : IN STD_LOGIC;
        rd_clk : IN STD_LOGIC;
        din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        wr_en : IN STD_LOGIC;
        rd_en : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        full : OUT STD_LOGIC;
        empty : OUT STD_LOGIC;
        rd_data_count : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
      );
    END COMPONENT;

    COMPONENT pay_fifo_8_4k
      PORT (
        rst : IN STD_LOGIC;
        wr_clk : IN STD_LOGIC;
        rd_clk : IN STD_LOGIC;
        din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        wr_en : IN STD_LOGIC;
        rd_en : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        full : OUT STD_LOGIC;
        empty : OUT STD_LOGIC;
        rd_data_count : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
      );
    END COMPONENT;

End Package pkg_s3_ip;
