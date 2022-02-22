-------------------------------------------------------------------------------
-- Copyright (c) 2021 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 14.6
--  \   \         Application: Xilinx CORE Generator
--  /   /         Filename   : vio_1.vhd
-- /___/   /\     Timestamp  : Thu Jun 03 11:14:30 Pacific Daylight Time 2021
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: XST Instantiation template
-------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

LIBRARY chipscope_vio_v1_05_a;

ENTITY vio_1 IS
  PORT (
    CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CLK : IN STD_LOGIC;
    ASYNC_OUT : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    SYNC_OUT : OUT STD_LOGIC_VECTOR(0 TO 0)
  );
END vio_1;

ARCHITECTURE artix7 OF vio_1 IS

  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF artix7 : ARCHITECTURE IS "chipscope_vio_v1_05_a, Xilinx CORE Generator 14.6";

  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF artix7 : ARCHITECTURE IS "vio_1,chipscope_vio_v1_05_a,NONE,NONE";

  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF artix7 : ARCHITECTURE IS "vio_1,chipscope_vio_v1_05_a,{c_xco_list=Component_Name=vio_1;Enable_Synchronous_Input_Port=false;Enable_Synchronous_Output_Port=true;Enable_Asynchronous_Input_Port=false;Enable_Asynchronous_Output_Port=true;Synchronous_Input_Port_Width=8;Synchronous_Output_Port_Width=1;Asynchronous_Input_Port_Width=8;Asynchronous_Output_Port_Width=6;Invert_Clock_Input=false,c_xdevicefamily=artix7,c_core_type=9,c_mfg_id=1,c_major_version=14,c_minor_version=6,c_build_revision=0,c_core_major_ver=1,c_core_minor_ver=2,c_core_minor_alpha_ver=97,c_srl16_type=2,c_use_inv_clk=0,c_use_async_in=0,c_use_async_out=1,c_use_sync_in=0,c_use_sync_out=1,c_async_in_width=8,c_async_out_width=6,c_sync_in_width=8,c_sync_out_width=1,c_constraint_type=external,c_example_design=true,}";


BEGIN
  U0: ENTITY chipscope_vio_v1_05_a.chipscope_vio
  GENERIC MAP (
    c_xco_list => "Component_Name=vio_1;Enable_Synchronous_Input_Port=false;Enable_Synchronous_Output_Port=true;Enable_Asynchronous_Input_Port=false;Enable_Asynchronous_Output_Port=true;Synchronous_Input_Port_Width=8;Synchronous_Output_Port_Width=1;Asynchronous_Input_Port_Width=8;Asynchronous_Output_Port_Width=6;Invert_Clock_Input=false",
    c_xdevicefamily => "artix7",
    c_core_type => 9,
    c_mfg_id => 1,
    c_major_version => 14,
    c_minor_version => 6,
    c_build_revision => 0,
    c_core_major_ver => 1,
    c_core_minor_ver => 2,
    c_core_minor_alpha_ver => 97,
    c_srl16_type => 2,
    c_use_inv_clk => 0,
    c_use_async_in => 0,
    c_use_async_out => 1,
    c_use_sync_in => 0,
    c_use_sync_out => 1,
    c_async_in_width => 8,
    c_async_out_width => 6,
    c_sync_in_width => 8,
    c_sync_out_width => 1,
    c_constraint_type => "external",
    c_example_design => true
  )
  PORT MAP (
    CONTROL => CONTROL,
    CLK => CLK,
    ASYNC_OUT => ASYNC_OUT,
    SYNC_OUT => SYNC_OUT
  );
END artix7;
