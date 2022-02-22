-------------------------------------------------------------------------------
-- Copyright (c) 2021 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 14.6
--  \   \         Application: XILINX CORE Generator
--  /   /         Filename   : vio_1.vhd
-- /___/   /\     Timestamp  : Wed May 26 15:38:58 Pacific Daylight Time 2021
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: VHDL Synthesis Wrapper
-------------------------------------------------------------------------------
-- This wrapper is used to integrate with Project Navigator and PlanAhead

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY vio_1 IS
  port (
    CONTROL: inout std_logic_vector(35 downto 0);
    CLK: in std_logic;
    ASYNC_OUT: out std_logic_vector(5 downto 0);
    SYNC_OUT: out std_logic_vector(1 downto 0));
END vio_1;

ARCHITECTURE vio_1_a OF vio_1 IS
BEGIN

END vio_1_a;
