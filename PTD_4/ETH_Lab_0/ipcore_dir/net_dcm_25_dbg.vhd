--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.6
--  \   \         Application : xaw2vhdl
--  /   /         Filename : net_dcm_25_dbg.vhd
-- /___/   /\     Timestamp : 02/18/2019 22:04:50
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: xaw2vhdl-st D:\_LABs\PTD\s3e_eth_0\ipcore_dir\.\net_dcm_25_dbg.xaw D:\_LABs\PTD\s3e_eth_0\ipcore_dir\.\net_dcm_25_dbg
--Design Name: net_dcm_25_dbg
--Device: xc3s500e-4fg320
--
-- Module net_dcm_25_dbg
-- Generated by Xilinx Architecture Wizard
-- Written for synthesis tool: XST

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity net_dcm_25_dbg is
   port ( CLKIN_IN        : in    std_logic; 
          RST_IN          : in    std_logic; 
          CLKIN_IBUFG_OUT : out   std_logic; 
          CLK0_OUT        : out   std_logic; 
          CLK2X_OUT       : out   std_logic; 
          CLK2X180_OUT    : out   std_logic; 
          CLK180_OUT      : out   std_logic; 
          LOCKED_OUT      : out   std_logic);
end net_dcm_25_dbg;

architecture BEHAVIORAL of net_dcm_25_dbg is
   signal CLKFB_IN        : std_logic;
   signal CLKIN_IBUFG     : std_logic;
   signal CLK0_BUF        : std_logic;
   signal CLK2X_BUF       : std_logic;
   signal CLK2X180_BUF    : std_logic;
   signal CLK180_BUF      : std_logic;
   signal GND_BIT         : std_logic;
begin
   GND_BIT <= '0';
   CLKIN_IBUFG_OUT <= CLKIN_IBUFG;
   CLK0_OUT <= CLKFB_IN;
   CLKIN_IBUFG_INST : IBUFG
      port map (I=>CLKIN_IN,
                O=>CLKIN_IBUFG);
   
   CLK0_BUFG_INST : BUFG
      port map (I=>CLK0_BUF,
                O=>CLKFB_IN);
   
   CLK2X_BUFG_INST : BUFG
      port map (I=>CLK2X_BUF,
                O=>CLK2X_OUT);
   
   CLK2X180_BUFG_INST : BUFG
      port map (I=>CLK2X180_BUF,
                O=>CLK2X180_OUT);
   
   CLK180_BUFG_INST : BUFG
      port map (I=>CLK180_BUF,
                O=>CLK180_OUT);
   
   DCM_SP_INST : DCM_SP
   generic map( CLK_FEEDBACK => "1X",
            CLKDV_DIVIDE => 2.0,
            CLKFX_DIVIDE => 1,
            CLKFX_MULTIPLY => 4,
            CLKIN_DIVIDE_BY_2 => FALSE,
            CLKIN_PERIOD => 40.000,
            CLKOUT_PHASE_SHIFT => "NONE",
            DESKEW_ADJUST => "SYSTEM_SYNCHRONOUS",
            DFS_FREQUENCY_MODE => "LOW",
            DLL_FREQUENCY_MODE => "LOW",
            DUTY_CYCLE_CORRECTION => TRUE,
            FACTORY_JF => x"C080",
            PHASE_SHIFT => 0,
            STARTUP_WAIT => FALSE)
      port map (CLKFB=>CLKFB_IN,
                CLKIN=>CLKIN_IBUFG,
                DSSEN=>GND_BIT,
                PSCLK=>GND_BIT,
                PSEN=>GND_BIT,
                PSINCDEC=>GND_BIT,
                RST=>RST_IN,
                CLKDV=>open,
                CLKFX=>open,
                CLKFX180=>open,
                CLK0=>CLK0_BUF,
                CLK2X=>CLK2X_BUF,
                CLK2X180=>CLK2X180_BUF,
                CLK90=>open,
                CLK180=>CLK180_BUF,
                CLK270=>open,
                LOCKED=>LOCKED_OUT,
                PSDONE=>open,
                STATUS=>open);
   
end BEHAVIORAL;


