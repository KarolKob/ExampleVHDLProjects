--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.68d
--  \   \         Application: netgen
--  /   /         Filename: key_fsm_c_timesim.vhd
-- /___/   /\     Timestamp: Thu May 20 02:07:29 2021
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -s 3 -pcf key_fsm_c.pcf -rpw 100 -tpw 0 -ar Structure -tm key_fsm_c -insert_pp_buffers true -w -dir netgen/par -ofmt vhdl -sim key_fsm_c.ncd key_fsm_c_timesim.vhd 
-- Device	: 7a100tcsg324-3 (PRODUCTION 1.09 2013-06-08)
-- Input file	: key_fsm_c.ncd
-- Output file	: C:\Users\IEUser\Desktop\PUR_Lab_3\ISE_PUR_Lab3\netgen\par\key_fsm_c_timesim.vhd
-- # of Entities	: 1
-- Design Name	: key_fsm_c
-- Xilinx	: C:\Xilinx\14.6\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

entity key_fsm_c is
  port (
    clk : in STD_LOGIC := 'X'; 
    rst : in STD_LOGIC := 'X'; 
    left : in STD_LOGIC := 'X'; 
    right : in STD_LOGIC := 'X'; 
    up : in STD_LOGIC := 'X'; 
    down : in STD_LOGIC := 'X'; 
    center : in STD_LOGIC := 'X'; 
    cntr_en : out STD_LOGIC; 
    cntr_rst : out STD_LOGIC; 
    cntr_load : out STD_LOGIC; 
    edit_en_out : out STD_LOGIC; 
    data_out : out STD_LOGIC_VECTOR ( 31 downto 0 ) 
  );
end key_fsm_c;

architecture Structure of key_fsm_c is
  signal Q_n0410_inv : STD_LOGIC; 
  signal clk_BUFGP : STD_LOGIC; 
  signal memory_reg_0_3_memory_reg_0_3_mux_87_OUT_0_Q : STD_LOGIC; 
  signal rst_IBUF_1081 : STD_LOGIC; 
  signal edit_en_out_OBUF_1082 : STD_LOGIC; 
  signal curr_state_FSM_FFd4_1083 : STD_LOGIC; 
  signal curr_state_FSM_FFd4_In2_1084 : STD_LOGIC; 
  signal up_IBUF_1085 : STD_LOGIC; 
  signal down_IBUF_1086 : STD_LOGIC; 
  signal curr_state_FSM_FFd2_1087 : STD_LOGIC; 
  signal curr_state_FSM_FFd3_1088 : STD_LOGIC; 
  signal center_IBUF_1089 : STD_LOGIC; 
  signal Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1121_1090 : STD_LOGIC; 
  signal Madd_index_2_GND_6_o_add_31_OUT_cy_0_0 : STD_LOGIC; 
  signal Madd_index_2_GND_6_o_add_31_OUT_lut_3_0 : STD_LOGIC; 
  signal Madd_index_2_GND_6_o_add_31_OUT_lut_1_0 : STD_LOGIC; 
  signal Madd_index_2_GND_6_o_add_31_OUT_lut_2_0 : STD_LOGIC; 
  signal dec_pos_flag : STD_LOGIC; 
  signal curr_state_FSM_FFd1_1096 : STD_LOGIC; 
  signal Q_n0298_inv_0 : STD_LOGIC; 
  signal Q_n0314_inv : STD_LOGIC; 
  signal cntr_rst_OBUF_1101 : STD_LOGIC; 
  signal cntr_load_OBUF_0 : STD_LOGIC; 
  signal Q_n0330_inv : STD_LOGIC; 
  signal memory_reg_2_0_0 : STD_LOGIC; 
  signal index_2_Decoder_32_OUT_3_Q : STD_LOGIC; 
  signal dec_val_flag_0 : STD_LOGIC; 
  signal Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1122 : STD_LOGIC; 
  signal Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1123 : STD_LOGIC; 
  signal Q_n0346_inv_0 : STD_LOGIC; 
  signal Q_n0362_inv_0 : STD_LOGIC; 
  signal index_2_Decoder_32_OUT_4_Q : STD_LOGIC; 
  signal index_2_Decoder_32_OUT_5_Q : STD_LOGIC; 
  signal index_2_Decoder_32_OUT_6_Q : STD_LOGIC; 
  signal Q_n0394_inv : STD_LOGIC; 
  signal index_2_Decoder_32_OUT_7_Q : STD_LOGIC; 
  signal Q_n0378_inv : STD_LOGIC; 
  signal index_2_Decoder_32_OUT_1_Q : STD_LOGIC; 
  signal index_2_Decoder_32_OUT_0_0 : STD_LOGIC; 
  signal Mcompar_GND_6_o_index_31_LessThan_96_o_cy_3_Q_1140 : STD_LOGIC; 
  signal Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0 : STD_LOGIC; 
  signal index_2_Decoder_32_OUT_2_0 : STD_LOGIC; 
  signal left_IBUF_1161 : STD_LOGIC; 
  signal right_IBUF_1162 : STD_LOGIC; 
  signal Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1101_1163 : STD_LOGIC; 
  signal Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1102 : STD_LOGIC; 
  signal cntr_en_OBUF_1166 : STD_LOGIC; 
  signal Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_3_Q_1168 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_7_Q_1169 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_11_Q_1170 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_15_Q_1171 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_19_Q_1172 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_23_Q_1173 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_27_Q_1174 : STD_LOGIC; 
  signal Mcompar_index_31_GND_6_o_LessThan_100_o_cy_3_Q_1175 : STD_LOGIC; 
  signal clk_BUFGP_IBUFG_1176 : STD_LOGIC; 
  signal Q_n0451_inv : STD_LOGIC; 
  signal curr_state_FSM_FFd4_In1_1198 : STD_LOGIC; 
  signal curr_state_FSM_FFd2_In1_1199 : STD_LOGIC; 
  signal curr_state_FSM_FFd3_In1_1200 : STD_LOGIC; 
  signal curr_state_FSM_FFd3_In2_1201 : STD_LOGIC; 
  signal Q_n0439_inv : STD_LOGIC; 
  signal Mcompar_GND_6_o_index_31_LessThan_96_o_lut_0_Q_52 : STD_LOGIC; 
  signal Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi_50 : STD_LOGIC; 
  signal Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi3_41 : STD_LOGIC; 
  signal Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi1_38 : STD_LOGIC; 
  signal Mcompar_GND_6_o_index_31_LessThan_96_o_lut_1_Q_37 : STD_LOGIC; 
  signal Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi2_25 : STD_LOGIC; 
  signal Mcompar_GND_6_o_index_31_LessThan_96_o_lut_2_Q_24 : STD_LOGIC; 
  signal Mcompar_GND_6_o_index_31_LessThan_96_o_lut_3_Q_23 : STD_LOGIC; 
  signal Mcompar_GND_6_o_index_31_LessThan_96_o_lut_4_Q_15 : STD_LOGIC; 
  signal Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi5_13 : STD_LOGIC; 
  signal Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi4_9 : STD_LOGIC; 
  signal Mcompar_GND_6_o_index_31_LessThan_96_o_lut_5_Q_8 : STD_LOGIC; 
  signal Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi6_3 : STD_LOGIC; 
  signal Mcompar_GND_6_o_index_31_LessThan_96_o_lut_6_Q_2 : STD_LOGIC; 
  signal Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_Q_1 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_17_Q_272 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_16_Q_271 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_17_mand1_265 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_16_mand1_261 : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_17_Q : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_19_Q : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_18_mand1_251 : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_18_Q : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_19_Q_246 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_18_Q_245 : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_16_Q : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_19_mand1_241 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_25_Q_362 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_24_Q_361 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_25_mand1_355 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_24_mand1_351 : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_25_Q : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_27_Q : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_26_mand1_341 : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_26_Q : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_27_Q_336 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_26_Q_335 : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_24_Q : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_27_mand1_331 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_21_Q_317 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_20_Q_316 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_21_mand1_310 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_20_mand1_306 : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_21_Q : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_23_Q : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_22_mand1_296 : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_22_Q : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_23_Q_291 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_22_Q_290 : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_20_Q : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_23_mand1_286 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_13_Q_227 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_12_Q_226 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_13_mand1_220 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_12_mand1_216 : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_13_Q : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_15_Q : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_14_mand1_206 : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_14_Q : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_15_Q_201 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_14_Q_200 : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_12_Q : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_15_mand1_196 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_9_Q_182 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_8_Q_181 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_9_mand1_175 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_8_mand1_171 : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_9_Q : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_11_Q : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_10_mand1_161 : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_10_Q : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_11_Q_156 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_10_Q_155 : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_8_Q : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_11_mand1_151 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_28_mand1_396 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_28_Q_392 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_30_Q_388 : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_28_Q : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_29_mand1_383 : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_29_Q : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_30_Q : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_29_Q_374 : STD_LOGIC; 
  signal Mcompar_index_31_GND_6_o_LessThan_100_o_lut_0_Q_423 : STD_LOGIC; 
  signal Mcompar_index_31_GND_6_o_LessThan_100_o_lut_1_Q_422 : STD_LOGIC; 
  signal Mcompar_index_31_GND_6_o_LessThan_100_o_lut_2_Q_414 : STD_LOGIC; 
  signal Mcompar_index_31_GND_6_o_LessThan_100_o_lut_3_Q_413 : STD_LOGIC; 
  signal ProtoComp26_INTERMDISABLE_GND_0 : STD_LOGIC; 
  signal up_ProtoComp26_INTERMDISABLE_GND_0 : STD_LOGIC; 
  signal Mcompar_index_31_GND_6_o_LessThan_100_o_lut_4_Q_455 : STD_LOGIC; 
  signal Mcompar_index_31_GND_6_o_LessThan_100_o_lut_5_Q_442 : STD_LOGIC; 
  signal Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_Q_441 : STD_LOGIC; 
  signal Mcompar_index_31_GND_6_o_LessThan_100_o_lut_6_Q_438 : STD_LOGIC; 
  signal right_ProtoComp26_INTERMDISABLE_GND_0 : STD_LOGIC; 
  signal memory_reg_6_3_memory_reg_6_3_mux_93_OUT_3_Q : STD_LOGIC; 
  signal memory_reg_4_3_memory_reg_4_3_mux_91_OUT_1_Q : STD_LOGIC; 
  signal down_ProtoComp26_INTERMDISABLE_GND_0 : STD_LOGIC; 
  signal center_ProtoComp26_INTERMDISABLE_GND_0 : STD_LOGIC; 
  signal Q_n0362_inv : STD_LOGIC; 
  signal memory_reg_1_3_memory_reg_1_3_mux_88_OUT_3_Q : STD_LOGIC; 
  signal Q_n0298_inv : STD_LOGIC; 
  signal left_ProtoComp26_INTERMDISABLE_GND_0 : STD_LOGIC; 
  signal memory_reg_4_3_memory_reg_4_3_mux_91_OUT_2_Q : STD_LOGIC; 
  signal index_2_Decoder_32_OUT_4_pack_2 : STD_LOGIC; 
  signal rst_ProtoComp26_INTERMDISABLE_GND_0 : STD_LOGIC; 
  signal memory_reg_6_3_memory_reg_6_3_mux_93_OUT_2_Q : STD_LOGIC; 
  signal memory_reg_6_3_memory_reg_6_3_mux_93_OUT_1_Q : STD_LOGIC; 
  signal index_2_Decoder_32_OUT_6_pack_8 : STD_LOGIC; 
  signal Q_n0394_inv_pack_7 : STD_LOGIC; 
  signal memory_reg_0_3_memory_reg_0_3_mux_87_OUT_3_Q : STD_LOGIC; 
  signal memory_reg_0_3_memory_reg_0_3_mux_87_OUT_1_Q : STD_LOGIC; 
  signal memory_reg_0_3_memory_reg_0_3_mux_87_OUT_2_Q : STD_LOGIC; 
  signal curr_state_FSM_FFd2_In : STD_LOGIC; 
  signal curr_state_FSM_FFd3_In : STD_LOGIC; 
  signal curr_state_FSM_FFd3_In2_pack_14 : STD_LOGIC; 
  signal Q_n0439_inv_pack_1 : STD_LOGIC; 
  signal Q_n0421 : STD_LOGIC; 
  signal curr_state_FSM_FFd4_In1_pack_5 : STD_LOGIC; 
  signal curr_state_FSM_FFd4_In : STD_LOGIC; 
  signal curr_state_FSM_FFd1_In : STD_LOGIC; 
  signal dec_val_flag : STD_LOGIC; 
  signal cntr_load_OBUF_1030 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_0_Q_93 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_1_Q_91 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_2_Q : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_0_Q : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_1_Q : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_2_Q_75 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_3_Q_70 : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_0_Q : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_3_mand1_68 : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_1_Q : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_2_Q : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_3_Q : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_5_Q_137 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_4_Q_136 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_5_mand1_130 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_4_mand1_126 : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_5_Q : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_7_Q : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_6_mand1_116 : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_6_Q : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_7_Q_111 : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_6_Q_110 : STD_LOGIC; 
  signal index_31_GND_6_o_mux_102_OUT_4_Q : STD_LOGIC; 
  signal Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_7_mand1_106 : STD_LOGIC; 
  signal memory_reg_4_3_memory_reg_4_3_mux_91_OUT_3_Q : STD_LOGIC; 
  signal mux2_3_942 : STD_LOGIC; 
  signal mux2_4_934 : STD_LOGIC; 
  signal Madd_index_2_GND_6_o_add_31_OUT_lut_2_Q : STD_LOGIC; 
  signal Madd_index_2_GND_6_o_add_31_OUT_cy_0_Q : STD_LOGIC; 
  signal mux_3_758 : STD_LOGIC; 
  signal mux_4_757 : STD_LOGIC; 
  signal Madd_index_2_GND_6_o_add_31_OUT_lut_1_Q : STD_LOGIC; 
  signal mux1_3_774 : STD_LOGIC; 
  signal mux1_4_773 : STD_LOGIC; 
  signal memory_reg_5_3_memory_reg_5_3_mux_92_OUT_1_Q : STD_LOGIC; 
  signal memory_reg_5_3_memory_reg_5_3_mux_92_OUT_2_Q : STD_LOGIC; 
  signal memory_reg_5_3_memory_reg_5_3_mux_92_OUT_3_Q : STD_LOGIC; 
  signal mux3_3_742 : STD_LOGIC; 
  signal Madd_index_2_GND_6_o_add_31_OUT_lut_3_Q : STD_LOGIC; 
  signal mux3_4_735 : STD_LOGIC; 
  signal Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1102_pack_1 : STD_LOGIC; 
  signal memory_reg_3_3_memory_reg_3_3_mux_90_OUT_1_Q : STD_LOGIC; 
  signal memory_reg_7_3_memory_reg_7_3_mux_94_OUT_3_Q : STD_LOGIC; 
  signal memory_reg_7_3_memory_reg_7_3_mux_94_OUT_1_Q : STD_LOGIC; 
  signal memory_reg_7_3_memory_reg_7_3_mux_94_OUT_2_Q : STD_LOGIC; 
  signal memory_reg_1_3_memory_reg_1_3_mux_88_OUT_2_Q : STD_LOGIC; 
  signal index_2_Decoder_32_OUT_0_Q : STD_LOGIC; 
  signal memory_reg_1_3_memory_reg_1_3_mux_88_OUT_1_Q : STD_LOGIC; 
  signal memory_reg_2_3_memory_reg_2_3_mux_89_OUT_2_Q : STD_LOGIC; 
  signal memory_reg_2_3_memory_reg_2_3_mux_89_OUT_1_Q : STD_LOGIC; 
  signal memory_reg_2_3_memory_reg_2_3_mux_89_OUT_3_Q : STD_LOGIC; 
  signal Q_n0346_inv : STD_LOGIC; 
  signal memory_reg_3_3_memory_reg_3_3_mux_90_OUT_2_Q : STD_LOGIC; 
  signal memory_reg_3_3_memory_reg_3_3_mux_90_OUT_3_Q : STD_LOGIC; 
  signal index_2_Decoder_32_OUT_2_Q : STD_LOGIC; 
  signal Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1123_pack_9 : STD_LOGIC; 
  signal NlwBufferSignal_index_19_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_18_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_17_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_16_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_27_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_26_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_25_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_24_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_23_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_22_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_21_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_20_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_15_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_14_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_13_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_12_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_11_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_10_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_9_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_8_CLK : STD_LOGIC; 
  signal NlwBufferSignal_data_out_10_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_index_30_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_29_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_28_CLK : STD_LOGIC; 
  signal NlwBufferSignal_cntr_en_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_11_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_cntr_rst_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_edit_en_out_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_DI_2_Q : STD_LOGIC; 
  signal NlwBufferSignal_data_out_12_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_13_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_20_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_0_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_4_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_30_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_2_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_16_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_18_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_22_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_15_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_1_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_31_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_3_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_25_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_21_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_17_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_26_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_6_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_19_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_24_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_23_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_14_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_5_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_7_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_28_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_27_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_6_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_clk_BUFGP_BUFG_IN : STD_LOGIC; 
  signal NlwBufferSignal_data_out_29_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_data_out_9_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_cntr_load_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_4_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_data_out_8_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_6_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_6_0_IN : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_1_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_4_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_4_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_6_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_6_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_0_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_0_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_0_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_0_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_0_0_IN : STD_LOGIC; 
  signal NlwBufferSignal_curr_state_FSM_FFd3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_curr_state_FSM_FFd2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_cntr_en_CLK : STD_LOGIC; 
  signal NlwBufferSignal_curr_state_FSM_FFd1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_curr_state_FSM_FFd4_CLK : STD_LOGIC; 
  signal NlwBufferSignal_edit_en_out_CLK : STD_LOGIC; 
  signal NlwBufferSignal_edit_en_out_IN : STD_LOGIC; 
  signal NlwBufferSignal_index_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_7_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_6_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_5_CLK : STD_LOGIC; 
  signal NlwBufferSignal_index_4_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_4_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_3_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_3_0_IN : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_5_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_5_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_5_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_5_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_5_0_IN : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_2_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_2_0_IN : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_3_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_7_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_7_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_7_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_7_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_7_0_IN : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_1_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_1_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_1_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_1_0_IN : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_2_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_2_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_2_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_3_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_memory_reg_3_2_CLK : STD_LOGIC; 
  signal NLW_ProtoComp15_CYINITVCC_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_3_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_3_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_3_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_3_O_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_3_O_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_3_O_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_3_O_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_CO_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_DI_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_O_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_O_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_O_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_O_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_S_3_UNCONNECTED : STD_LOGIC; 
  signal GND : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_19_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_19_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_19_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_27_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_27_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_27_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_23_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_23_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_23_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_15_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_15_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_15_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_11_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_11_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_11_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_xor_30_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_xor_30_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_xor_30_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_xor_30_CO_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_xor_30_DI_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_xor_30_DI_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_xor_30_O_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_xor_30_S_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_N1_4_D5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_ProtoComp24_CYINITVCC_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_3_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_3_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_3_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_3_O_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_3_O_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_3_O_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_3_O_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_N1_3_C5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N1_2_B5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N1_A5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_CO_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_DI_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_O_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_O_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_O_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_O_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_S_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_N1_6_B5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N1_5_A5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_3_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_3_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_3_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_7_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_7_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_7_CO_2_UNCONNECTED : STD_LOGIC; 
  signal memory_reg_7 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal memory_reg_0 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal memory_reg_1 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal memory_reg_3 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal index : STD_LOGIC_VECTOR ( 30 downto 0 ); 
  signal memory_reg_4 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal memory_reg_6 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal memory_reg_2 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal memory_reg_5 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
begin
  Mcompar_GND_6_o_index_31_LessThan_96_o_lut_3_Q : X_LUT6
    generic map(
      LOC => "SLICE_X75Y116",
      INIT => X"0000000100000001"
    )
    port map (
      ADR4 => index(15),
      ADR0 => index(16),
      ADR3 => index(17),
      ADR1 => index(18),
      ADR2 => index(19),
      ADR5 => '1',
      O => Mcompar_GND_6_o_index_31_LessThan_96_o_lut_3_Q_23
    );
  Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi3 : X_LUT5
    generic map(
      LOC => "SLICE_X75Y116",
      INIT => X"FFFFFFFE"
    )
    port map (
      ADR4 => index(15),
      ADR0 => index(16),
      ADR3 => index(17),
      ADR1 => index(18),
      ADR2 => index(19),
      O => Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi3_41
    );
  ProtoComp15_CYINITVCC : X_ONE
    generic map(
      LOC => "SLICE_X75Y116"
    )
    port map (
      O => NLW_ProtoComp15_CYINITVCC_O_UNCONNECTED
    );
  Mcompar_GND_6_o_index_31_LessThan_96_o_cy_3_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X75Y116"
    )
    port map (
      CI => '0',
      CYINIT => '1',
      CO(3) => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_3_Q_1140,
      CO(2) => NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_3_CO_2_UNCONNECTED,
      CO(1) => NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_3_CO_1_UNCONNECTED,
      CO(0) => NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_3_CO_0_UNCONNECTED,
      DI(3) => Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi3_41,
      DI(2) => Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi2_25,
      DI(1) => Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi1_38,
      DI(0) => Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi_50,
      O(3) => NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_3_O_3_UNCONNECTED,
      O(2) => NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_3_O_2_UNCONNECTED,
      O(1) => NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_3_O_1_UNCONNECTED,
      O(0) => NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_3_O_0_UNCONNECTED,
      S(3) => Mcompar_GND_6_o_index_31_LessThan_96_o_lut_3_Q_23,
      S(2) => Mcompar_GND_6_o_index_31_LessThan_96_o_lut_2_Q_24,
      S(1) => Mcompar_GND_6_o_index_31_LessThan_96_o_lut_1_Q_37,
      S(0) => Mcompar_GND_6_o_index_31_LessThan_96_o_lut_0_Q_52
    );
  Mcompar_GND_6_o_index_31_LessThan_96_o_lut_2_Q : X_LUT6
    generic map(
      LOC => "SLICE_X75Y116",
      INIT => X"0000000100000001"
    )
    port map (
      ADR3 => index(10),
      ADR4 => index(11),
      ADR0 => index(12),
      ADR2 => index(13),
      ADR1 => index(14),
      ADR5 => '1',
      O => Mcompar_GND_6_o_index_31_LessThan_96_o_lut_2_Q_24
    );
  Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi2 : X_LUT5
    generic map(
      LOC => "SLICE_X75Y116",
      INIT => X"FFFFFFFE"
    )
    port map (
      ADR3 => index(10),
      ADR4 => index(11),
      ADR0 => index(12),
      ADR2 => index(13),
      ADR1 => index(14),
      O => Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi2_25
    );
  Mcompar_GND_6_o_index_31_LessThan_96_o_lut_1_Q : X_LUT6
    generic map(
      LOC => "SLICE_X75Y116",
      INIT => X"0000000100000001"
    )
    port map (
      ADR2 => index(5),
      ADR4 => index(6),
      ADR1 => index(7),
      ADR0 => index(8),
      ADR3 => index(9),
      ADR5 => '1',
      O => Mcompar_GND_6_o_index_31_LessThan_96_o_lut_1_Q_37
    );
  Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi1 : X_LUT5
    generic map(
      LOC => "SLICE_X75Y116",
      INIT => X"FFFFFFFE"
    )
    port map (
      ADR2 => index(5),
      ADR4 => index(6),
      ADR1 => index(7),
      ADR0 => index(8),
      ADR3 => index(9),
      O => Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi1_38
    );
  Mcompar_GND_6_o_index_31_LessThan_96_o_lut_0_Q : X_LUT6
    generic map(
      LOC => "SLICE_X75Y116",
      INIT => X"0400000004000000"
    )
    port map (
      ADR0 => index(3),
      ADR2 => index(4),
      ADR3 => index(2),
      ADR4 => index(0),
      ADR1 => index(1),
      ADR5 => '1',
      O => Mcompar_GND_6_o_index_31_LessThan_96_o_lut_0_Q_52
    );
  Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi : X_LUT5
    generic map(
      LOC => "SLICE_X75Y116",
      INIT => X"FAFAFAFA"
    )
    port map (
      ADR0 => index(3),
      ADR2 => index(4),
      ADR1 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi_50
    );
  Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_CMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_Q_1,
      O => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0
    );
  Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X75Y117"
    )
    port map (
      CI => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_3_Q_1140,
      CYINIT => '0',
      CO(3) => NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_CO_3_UNCONNECTED,
      CO(2) => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_Q_1,
      CO(1) => NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_CO_1_UNCONNECTED,
      CO(0) => NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_CO_0_UNCONNECTED,
      DI(3) => NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_DI_3_UNCONNECTED,
      DI(2) => Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi6_3,
      DI(1) => Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi5_13,
      DI(0) => Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi4_9,
      O(3) => NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_O_3_UNCONNECTED,
      O(2) => NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_O_2_UNCONNECTED,
      O(1) => NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_O_1_UNCONNECTED,
      O(0) => NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_O_0_UNCONNECTED,
      S(3) => NLW_Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_S_3_UNCONNECTED,
      S(2) => Mcompar_GND_6_o_index_31_LessThan_96_o_lut_6_Q_2,
      S(1) => Mcompar_GND_6_o_index_31_LessThan_96_o_lut_5_Q_8,
      S(0) => Mcompar_GND_6_o_index_31_LessThan_96_o_lut_4_Q_15
    );
  Mcompar_GND_6_o_index_31_LessThan_96_o_lut_6_Q : X_LUT6
    generic map(
      LOC => "SLICE_X75Y117",
      INIT => X"000000FF000000FF"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR4 => index(30),
      ADR3 => index(25),
      ADR5 => '1',
      O => Mcompar_GND_6_o_index_31_LessThan_96_o_lut_6_Q_2
    );
  Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi6 : X_LUT5
    generic map(
      LOC => "SLICE_X75Y117",
      INIT => X"00FF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR4 => index(30),
      ADR3 => index(25),
      O => Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi6_3
    );
  Mcompar_GND_6_o_index_31_LessThan_96_o_lut_5_Q : X_LUT6
    generic map(
      LOC => "SLICE_X75Y117",
      INIT => X"0000000100000001"
    )
    port map (
      ADR1 => index(25),
      ADR0 => index(26),
      ADR2 => index(27),
      ADR4 => index(28),
      ADR3 => index(29),
      ADR5 => '1',
      O => Mcompar_GND_6_o_index_31_LessThan_96_o_lut_5_Q_8
    );
  Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi5 : X_LUT5
    generic map(
      LOC => "SLICE_X75Y117",
      INIT => X"FFFFFFFE"
    )
    port map (
      ADR1 => index(25),
      ADR0 => index(26),
      ADR2 => index(27),
      ADR4 => index(28),
      ADR3 => index(29),
      O => Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi5_13
    );
  Mcompar_GND_6_o_index_31_LessThan_96_o_lut_4_Q : X_LUT6
    generic map(
      LOC => "SLICE_X75Y117",
      INIT => X"0000000100000001"
    )
    port map (
      ADR4 => index(20),
      ADR1 => index(21),
      ADR0 => index(22),
      ADR2 => index(23),
      ADR3 => index(24),
      ADR5 => '1',
      O => Mcompar_GND_6_o_index_31_LessThan_96_o_lut_4_Q_15
    );
  Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi4 : X_LUT5
    generic map(
      LOC => "SLICE_X75Y117",
      INIT => X"FFFFFFFE"
    )
    port map (
      ADR4 => index(20),
      ADR1 => index(21),
      ADR0 => index(22),
      ADR2 => index(23),
      ADR3 => index(24),
      O => Mcompar_GND_6_o_index_31_LessThan_96_o_lutdi4_9
    );
  index_19 : X_FF
    generic map(
      LOC => "SLICE_X74Y118",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_19_CLK,
      I => index_31_GND_6_o_mux_102_OUT_19_Q,
      O => index(19),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_19_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y118",
      INIT => X"88F8087888F80878"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR1 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR2 => index(19),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_19_Q_246
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_19_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y118",
      INIT => X"007080F0"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR1 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR2 => index(19),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_19_mand1_241
    );
  index_18 : X_FF
    generic map(
      LOC => "SLICE_X74Y118",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_18_CLK,
      I => index_31_GND_6_o_mux_102_OUT_18_Q,
      O => index(18),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_19_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X74Y118"
    )
    port map (
      CI => Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_15_Q_1171,
      CYINIT => '0',
      CO(3) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_19_Q_1172,
      CO(2) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_19_CO_2_UNCONNECTED,
      CO(1) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_19_CO_1_UNCONNECTED,
      CO(0) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_19_CO_0_UNCONNECTED,
      DI(3) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_19_mand1_241,
      DI(2) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_18_mand1_251,
      DI(1) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_17_mand1_265,
      DI(0) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_16_mand1_261,
      O(3) => index_31_GND_6_o_mux_102_OUT_19_Q,
      O(2) => index_31_GND_6_o_mux_102_OUT_18_Q,
      O(1) => index_31_GND_6_o_mux_102_OUT_17_Q,
      O(0) => index_31_GND_6_o_mux_102_OUT_16_Q,
      S(3) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_19_Q_246,
      S(2) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_18_Q_245,
      S(1) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_17_Q_272,
      S(0) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_16_Q_271
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_18_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y118",
      INIT => X"A0EC206CA0EC206C"
    )
    port map (
      ADR2 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(18),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_18_Q_245
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_18_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y118",
      INIT => X"004C80CC"
    )
    port map (
      ADR2 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(18),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_18_mand1_251
    );
  index_17 : X_FF
    generic map(
      LOC => "SLICE_X74Y118",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_17_CLK,
      I => index_31_GND_6_o_mux_102_OUT_17_Q,
      O => index(17),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_17_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y118",
      INIT => X"AE0C260CAE0C260C"
    )
    port map (
      ADR3 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(17),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_17_Q_272
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_17_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y118",
      INIT => X"040C8C0C"
    )
    port map (
      ADR3 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(17),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_17_mand1_265
    );
  index_16 : X_FF
    generic map(
      LOC => "SLICE_X74Y118",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_16_CLK,
      I => index_31_GND_6_o_mux_102_OUT_16_Q,
      O => index(16),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_16_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y118",
      INIT => X"AE0C260CAE0C260C"
    )
    port map (
      ADR3 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(16),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_16_Q_271
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_16_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y118",
      INIT => X"040C8C0C"
    )
    port map (
      ADR3 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(16),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_16_mand1_261
    );
  index_27 : X_FF
    generic map(
      LOC => "SLICE_X74Y120",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_27_CLK,
      I => index_31_GND_6_o_mux_102_OUT_27_Q,
      O => index(27),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_27_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y120",
      INIT => X"88F8087888F80878"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR1 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR2 => index(27),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_27_Q_336
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_27_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y120",
      INIT => X"007080F0"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR1 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR2 => index(27),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_27_mand1_331
    );
  index_26 : X_FF
    generic map(
      LOC => "SLICE_X74Y120",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_26_CLK,
      I => index_31_GND_6_o_mux_102_OUT_26_Q,
      O => index(26),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_27_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X74Y120"
    )
    port map (
      CI => Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_23_Q_1173,
      CYINIT => '0',
      CO(3) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_27_Q_1174,
      CO(2) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_27_CO_2_UNCONNECTED,
      CO(1) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_27_CO_1_UNCONNECTED,
      CO(0) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_27_CO_0_UNCONNECTED,
      DI(3) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_27_mand1_331,
      DI(2) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_26_mand1_341,
      DI(1) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_25_mand1_355,
      DI(0) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_24_mand1_351,
      O(3) => index_31_GND_6_o_mux_102_OUT_27_Q,
      O(2) => index_31_GND_6_o_mux_102_OUT_26_Q,
      O(1) => index_31_GND_6_o_mux_102_OUT_25_Q,
      O(0) => index_31_GND_6_o_mux_102_OUT_24_Q,
      S(3) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_27_Q_336,
      S(2) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_26_Q_335,
      S(1) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_25_Q_362,
      S(0) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_24_Q_361
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_26_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y120",
      INIT => X"A0EC206CA0EC206C"
    )
    port map (
      ADR2 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(26),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_26_Q_335
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_26_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y120",
      INIT => X"004C80CC"
    )
    port map (
      ADR2 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(26),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_26_mand1_341
    );
  index_25 : X_FF
    generic map(
      LOC => "SLICE_X74Y120",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_25_CLK,
      I => index_31_GND_6_o_mux_102_OUT_25_Q,
      O => index(25),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_25_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y120",
      INIT => X"AE0C260CAE0C260C"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR3 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(25),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_25_Q_362
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_25_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y120",
      INIT => X"040C8C0C"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR3 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(25),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_25_mand1_355
    );
  index_24 : X_FF
    generic map(
      LOC => "SLICE_X74Y120",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_24_CLK,
      I => index_31_GND_6_o_mux_102_OUT_24_Q,
      O => index(24),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_24_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y120",
      INIT => X"AE0C260CAE0C260C"
    )
    port map (
      ADR3 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(24),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_24_Q_361
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_24_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y120",
      INIT => X"040C8C0C"
    )
    port map (
      ADR3 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(24),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_24_mand1_351
    );
  index_23 : X_FF
    generic map(
      LOC => "SLICE_X74Y119",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_23_CLK,
      I => index_31_GND_6_o_mux_102_OUT_23_Q,
      O => index(23),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_23_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y119",
      INIT => X"88F8087888F80878"
    )
    port map (
      ADR1 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR2 => index(23),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_23_Q_291
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_23_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y119",
      INIT => X"007080F0"
    )
    port map (
      ADR1 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR2 => index(23),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_23_mand1_286
    );
  index_22 : X_FF
    generic map(
      LOC => "SLICE_X74Y119",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_22_CLK,
      I => index_31_GND_6_o_mux_102_OUT_22_Q,
      O => index(22),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_23_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X74Y119"
    )
    port map (
      CI => Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_19_Q_1172,
      CYINIT => '0',
      CO(3) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_23_Q_1173,
      CO(2) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_23_CO_2_UNCONNECTED,
      CO(1) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_23_CO_1_UNCONNECTED,
      CO(0) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_23_CO_0_UNCONNECTED,
      DI(3) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_23_mand1_286,
      DI(2) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_22_mand1_296,
      DI(1) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_21_mand1_310,
      DI(0) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_20_mand1_306,
      O(3) => index_31_GND_6_o_mux_102_OUT_23_Q,
      O(2) => index_31_GND_6_o_mux_102_OUT_22_Q,
      O(1) => index_31_GND_6_o_mux_102_OUT_21_Q,
      O(0) => index_31_GND_6_o_mux_102_OUT_20_Q,
      S(3) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_23_Q_291,
      S(2) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_22_Q_290,
      S(1) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_21_Q_317,
      S(0) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_20_Q_316
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_22_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y119",
      INIT => X"A0EC206CA0EC206C"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR2 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(22),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_22_Q_290
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_22_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y119",
      INIT => X"004C80CC"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR2 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(22),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_22_mand1_296
    );
  index_21 : X_FF
    generic map(
      LOC => "SLICE_X74Y119",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_21_CLK,
      I => index_31_GND_6_o_mux_102_OUT_21_Q,
      O => index(21),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_21_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y119",
      INIT => X"AE0C260CAE0C260C"
    )
    port map (
      ADR3 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(21),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_21_Q_317
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_21_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y119",
      INIT => X"040C8C0C"
    )
    port map (
      ADR3 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(21),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_21_mand1_310
    );
  index_20 : X_FF
    generic map(
      LOC => "SLICE_X74Y119",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_20_CLK,
      I => index_31_GND_6_o_mux_102_OUT_20_Q,
      O => index(20),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_20_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y119",
      INIT => X"AE0C260CAE0C260C"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR3 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(20),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_20_Q_316
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_20_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y119",
      INIT => X"040C8C0C"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR3 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(20),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_20_mand1_306
    );
  index_15 : X_FF
    generic map(
      LOC => "SLICE_X74Y117",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_15_CLK,
      I => index_31_GND_6_o_mux_102_OUT_15_Q,
      O => index(15),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_15_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y117",
      INIT => X"CE0A460ACE0A460A"
    )
    port map (
      ADR3 => curr_state_FSM_FFd4_1083,
      ADR1 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR0 => index(15),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_15_Q_201
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_15_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y117",
      INIT => X"020A8A0A"
    )
    port map (
      ADR3 => curr_state_FSM_FFd4_1083,
      ADR1 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR0 => index(15),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_15_mand1_196
    );
  index_14 : X_FF
    generic map(
      LOC => "SLICE_X74Y117",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_14_CLK,
      I => index_31_GND_6_o_mux_102_OUT_14_Q,
      O => index(14),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_15_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X74Y117"
    )
    port map (
      CI => Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_11_Q_1170,
      CYINIT => '0',
      CO(3) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_15_Q_1171,
      CO(2) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_15_CO_2_UNCONNECTED,
      CO(1) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_15_CO_1_UNCONNECTED,
      CO(0) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_15_CO_0_UNCONNECTED,
      DI(3) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_15_mand1_196,
      DI(2) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_14_mand1_206,
      DI(1) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_13_mand1_220,
      DI(0) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_12_mand1_216,
      O(3) => index_31_GND_6_o_mux_102_OUT_15_Q,
      O(2) => index_31_GND_6_o_mux_102_OUT_14_Q,
      O(1) => index_31_GND_6_o_mux_102_OUT_13_Q,
      O(0) => index_31_GND_6_o_mux_102_OUT_12_Q,
      S(3) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_15_Q_201,
      S(2) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_14_Q_200,
      S(1) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_13_Q_227,
      S(0) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_12_Q_226
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_14_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y117",
      INIT => X"AE0C260CAE0C260C"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR3 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(14),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_14_Q_200
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_14_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y117",
      INIT => X"040C8C0C"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR3 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(14),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_14_mand1_206
    );
  index_13 : X_FF
    generic map(
      LOC => "SLICE_X74Y117",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_13_CLK,
      I => index_31_GND_6_o_mux_102_OUT_13_Q,
      O => index(13),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_13_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y117",
      INIT => X"AE0C260CAE0C260C"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR3 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(13),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_13_Q_227
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_13_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y117",
      INIT => X"040C8C0C"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR3 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(13),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_13_mand1_220
    );
  index_12 : X_FF
    generic map(
      LOC => "SLICE_X74Y117",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_12_CLK,
      I => index_31_GND_6_o_mux_102_OUT_12_Q,
      O => index(12),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_12_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y117",
      INIT => X"AE0C260CAE0C260C"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR3 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(12),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_12_Q_226
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_12_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y117",
      INIT => X"040C8C0C"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR3 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(12),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_12_mand1_216
    );
  index_11 : X_FF
    generic map(
      LOC => "SLICE_X74Y116",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_11_CLK,
      I => index_31_GND_6_o_mux_102_OUT_11_Q,
      O => index(11),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_11_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y116",
      INIT => X"88F8087888F80878"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR1 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR2 => index(11),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_11_Q_156
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_11_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y116",
      INIT => X"007080F0"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR1 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR2 => index(11),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_11_mand1_151
    );
  index_10 : X_FF
    generic map(
      LOC => "SLICE_X74Y116",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_10_CLK,
      I => index_31_GND_6_o_mux_102_OUT_10_Q,
      O => index(10),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_11_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X74Y116"
    )
    port map (
      CI => Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_7_Q_1169,
      CYINIT => '0',
      CO(3) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_11_Q_1170,
      CO(2) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_11_CO_2_UNCONNECTED,
      CO(1) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_11_CO_1_UNCONNECTED,
      CO(0) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_11_CO_0_UNCONNECTED,
      DI(3) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_11_mand1_151,
      DI(2) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_10_mand1_161,
      DI(1) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_9_mand1_175,
      DI(0) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_8_mand1_171,
      O(3) => index_31_GND_6_o_mux_102_OUT_11_Q,
      O(2) => index_31_GND_6_o_mux_102_OUT_10_Q,
      O(1) => index_31_GND_6_o_mux_102_OUT_9_Q,
      O(0) => index_31_GND_6_o_mux_102_OUT_8_Q,
      S(3) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_11_Q_156,
      S(2) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_10_Q_155,
      S(1) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_9_Q_182,
      S(0) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_8_Q_181
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_10_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y116",
      INIT => X"A0EC206CA0EC206C"
    )
    port map (
      ADR2 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(10),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_10_Q_155
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_10_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y116",
      INIT => X"004C80CC"
    )
    port map (
      ADR2 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(10),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_10_mand1_161
    );
  index_9 : X_FF
    generic map(
      LOC => "SLICE_X74Y116",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_9_CLK,
      I => index_31_GND_6_o_mux_102_OUT_9_Q,
      O => index(9),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_9_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y116",
      INIT => X"A0EC206CA0EC206C"
    )
    port map (
      ADR2 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(9),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_9_Q_182
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_9_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y116",
      INIT => X"004C80CC"
    )
    port map (
      ADR2 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(9),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_9_mand1_175
    );
  index_8 : X_FF
    generic map(
      LOC => "SLICE_X74Y116",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_8_CLK,
      I => index_31_GND_6_o_mux_102_OUT_8_Q,
      O => index(8),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_8_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y116",
      INIT => X"88F8087888F80878"
    )
    port map (
      ADR1 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR2 => index(8),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_8_Q_181
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_8_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y116",
      INIT => X"007080F0"
    )
    port map (
      ADR1 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR2 => index(8),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_8_mand1_171
    );
  data_out_10_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y139"
    )
    port map (
      I => NlwBufferSignal_data_out_10_OBUF_I,
      O => data_out(10)
    );
  index_30 : X_FF
    generic map(
      LOC => "SLICE_X74Y121",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_30_CLK,
      I => index_31_GND_6_o_mux_102_OUT_30_Q,
      O => index(30),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_xor_30_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X74Y121"
    )
    port map (
      CI => Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_27_Q_1174,
      CYINIT => '0',
      CO(3) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_xor_30_CO_3_UNCONNECTED,
      CO(2) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_xor_30_CO_2_UNCONNECTED,
      CO(1) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_xor_30_CO_1_UNCONNECTED,
      CO(0) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_xor_30_CO_0_UNCONNECTED,
      DI(3) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_xor_30_DI_3_UNCONNECTED,
      DI(2) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_xor_30_DI_2_UNCONNECTED,
      DI(1) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_29_mand1_383,
      DI(0) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_28_mand1_396,
      O(3) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_xor_30_O_3_UNCONNECTED,
      O(2) => index_31_GND_6_o_mux_102_OUT_30_Q,
      O(1) => index_31_GND_6_o_mux_102_OUT_29_Q,
      O(0) => index_31_GND_6_o_mux_102_OUT_28_Q,
      S(3) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_xor_30_S_3_UNCONNECTED,
      S(2) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_30_Q_388,
      S(1) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_29_Q_374,
      S(0) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_28_Q_392
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_30_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y121",
      INIT => X"F0003000FCCC3CCC"
    )
    port map (
      ADR0 => '1',
      ADR5 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR2 => curr_state_FSM_FFd1_1096,
      ADR1 => index(30),
      ADR3 => curr_state_FSM_FFd4_1083,
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_30_Q_388
    );
  index_29 : X_FF
    generic map(
      LOC => "SLICE_X74Y121",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_29_CLK,
      I => index_31_GND_6_o_mux_102_OUT_29_Q,
      O => index(29),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_29_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y121",
      INIT => X"AE0C260CAE0C260C"
    )
    port map (
      ADR3 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(29),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_29_Q_374
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_29_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y121",
      INIT => X"040C8C0C"
    )
    port map (
      ADR3 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(29),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_29_mand1_383
    );
  index_28 : X_FF
    generic map(
      LOC => "SLICE_X74Y121",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_28_CLK,
      I => index_31_GND_6_o_mux_102_OUT_28_Q,
      O => index(28),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_28_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y121",
      INIT => X"AE0C260CAE0C260C"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR3 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(28),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_28_Q_392
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_28_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y121",
      INIT => X"040C8C0C"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR3 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(28),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_28_mand1_396
    );
  cntr_en_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y107"
    )
    port map (
      I => NlwBufferSignal_cntr_en_OBUF_I,
      O => cntr_en
    );
  data_out_11_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y136"
    )
    port map (
      I => NlwBufferSignal_data_out_11_OBUF_I,
      O => data_out(11)
    );
  Mcompar_index_31_GND_6_o_LessThan_100_o_lut_3_Q : X_LUT6
    generic map(
      LOC => "SLICE_X73Y116",
      INIT => X"0000000100000001"
    )
    port map (
      ADR4 => index(15),
      ADR0 => index(16),
      ADR2 => index(17),
      ADR3 => index(18),
      ADR1 => index(19),
      ADR5 => '1',
      O => Mcompar_index_31_GND_6_o_LessThan_100_o_lut_3_Q_413
    );
  N1_4_D5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X73Y116",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N1_4_D5LUT_O_UNCONNECTED
    );
  ProtoComp24_CYINITVCC : X_ONE
    generic map(
      LOC => "SLICE_X73Y116"
    )
    port map (
      O => NLW_ProtoComp24_CYINITVCC_O_UNCONNECTED
    );
  Mcompar_index_31_GND_6_o_LessThan_100_o_cy_3_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X73Y116"
    )
    port map (
      CI => '0',
      CYINIT => '1',
      CO(3) => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_3_Q_1175,
      CO(2) => NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_3_CO_2_UNCONNECTED,
      CO(1) => NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_3_CO_1_UNCONNECTED,
      CO(0) => NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_3_CO_0_UNCONNECTED,
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_3_O_3_UNCONNECTED,
      O(2) => NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_3_O_2_UNCONNECTED,
      O(1) => NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_3_O_1_UNCONNECTED,
      O(0) => NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_3_O_0_UNCONNECTED,
      S(3) => Mcompar_index_31_GND_6_o_LessThan_100_o_lut_3_Q_413,
      S(2) => Mcompar_index_31_GND_6_o_LessThan_100_o_lut_2_Q_414,
      S(1) => Mcompar_index_31_GND_6_o_LessThan_100_o_lut_1_Q_422,
      S(0) => Mcompar_index_31_GND_6_o_LessThan_100_o_lut_0_Q_423
    );
  Mcompar_index_31_GND_6_o_LessThan_100_o_lut_2_Q : X_LUT6
    generic map(
      LOC => "SLICE_X73Y116",
      INIT => X"0000000100000001"
    )
    port map (
      ADR2 => index(10),
      ADR3 => index(11),
      ADR0 => index(12),
      ADR1 => index(13),
      ADR4 => index(14),
      ADR5 => '1',
      O => Mcompar_index_31_GND_6_o_LessThan_100_o_lut_2_Q_414
    );
  N1_3_C5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X73Y116",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N1_3_C5LUT_O_UNCONNECTED
    );
  Mcompar_index_31_GND_6_o_LessThan_100_o_lut_1_Q : X_LUT6
    generic map(
      LOC => "SLICE_X73Y116",
      INIT => X"0000000100000001"
    )
    port map (
      ADR2 => index(5),
      ADR1 => index(6),
      ADR0 => index(7),
      ADR3 => index(8),
      ADR4 => index(9),
      ADR5 => '1',
      O => Mcompar_index_31_GND_6_o_LessThan_100_o_lut_1_Q_422
    );
  N1_2_B5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X73Y116",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N1_2_B5LUT_O_UNCONNECTED
    );
  Mcompar_index_31_GND_6_o_LessThan_100_o_lut_0_Q : X_LUT6
    generic map(
      LOC => "SLICE_X73Y116",
      INIT => X"0000000100000001"
    )
    port map (
      ADR4 => index(4),
      ADR0 => index(3),
      ADR3 => index(2),
      ADR2 => index(1),
      ADR1 => index(0),
      ADR5 => '1',
      O => Mcompar_index_31_GND_6_o_LessThan_100_o_lut_0_Q_423
    );
  N1_A5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X73Y116",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N1_A5LUT_O_UNCONNECTED
    );
  ProtoComp26_INTERMDISABLE_GND : X_ZERO
    generic map(
      LOC => "IOB_X1Y128"
    )
    port map (
      O => ProtoComp26_INTERMDISABLE_GND_0
    );
  clk_BUFGP_IBUFG : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X1Y128"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => ProtoComp26_INTERMDISABLE_GND_0,
      O => clk_BUFGP_IBUFG_1176,
      I => clk,
      TPWRGT => '1'
    );
  cntr_rst_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y113"
    )
    port map (
      I => NlwBufferSignal_cntr_rst_OBUF_I,
      O => cntr_rst
    );
  ProtoComp26_INTERMDISABLE_GND_1 : X_ZERO
    generic map(
      LOC => "IOB_X1Y111"
    )
    port map (
      O => up_ProtoComp26_INTERMDISABLE_GND_0
    );
  up_IBUF : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X1Y111"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => up_ProtoComp26_INTERMDISABLE_GND_0,
      O => up_IBUF_1085,
      I => up,
      TPWRGT => '1'
    );
  edit_en_out_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y110"
    )
    port map (
      I => NlwBufferSignal_edit_en_out_OBUF_I,
      O => edit_en_out
    );
  Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_CMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_Q_441,
      O => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0
    );
  Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X73Y117"
    )
    port map (
      CI => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_3_Q_1175,
      CYINIT => '0',
      CO(3) => NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_CO_3_UNCONNECTED,
      CO(2) => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_Q_441,
      CO(1) => NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_CO_1_UNCONNECTED,
      CO(0) => NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_CO_0_UNCONNECTED,
      DI(3) => NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_DI_3_UNCONNECTED,
      DI(2) => NlwBufferSignal_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_DI_2_Q,
      DI(1) => '0',
      DI(0) => '0',
      O(3) => NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_O_3_UNCONNECTED,
      O(2) => NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_O_2_UNCONNECTED,
      O(1) => NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_O_1_UNCONNECTED,
      O(0) => NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_O_0_UNCONNECTED,
      S(3) => NLW_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_S_3_UNCONNECTED,
      S(2) => Mcompar_index_31_GND_6_o_LessThan_100_o_lut_6_Q_438,
      S(1) => Mcompar_index_31_GND_6_o_LessThan_100_o_lut_5_Q_442,
      S(0) => Mcompar_index_31_GND_6_o_LessThan_100_o_lut_4_Q_455
    );
  Mcompar_index_31_GND_6_o_LessThan_100_o_lut_6_Q : X_LUT6
    generic map(
      LOC => "SLICE_X73Y117",
      INIT => X"000000000000FFFF"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => index(30),
      ADR5 => index(25),
      O => Mcompar_index_31_GND_6_o_LessThan_100_o_lut_6_Q_438
    );
  Mcompar_index_31_GND_6_o_LessThan_100_o_lut_5_Q : X_LUT6
    generic map(
      LOC => "SLICE_X73Y117",
      INIT => X"0000000100000001"
    )
    port map (
      ADR1 => index(25),
      ADR0 => index(26),
      ADR2 => index(27),
      ADR3 => index(28),
      ADR4 => index(29),
      ADR5 => '1',
      O => Mcompar_index_31_GND_6_o_LessThan_100_o_lut_5_Q_442
    );
  N1_6_B5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X73Y117",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N1_6_B5LUT_O_UNCONNECTED
    );
  Mcompar_index_31_GND_6_o_LessThan_100_o_lut_4_Q : X_LUT6
    generic map(
      LOC => "SLICE_X73Y117",
      INIT => X"0000000100000001"
    )
    port map (
      ADR4 => index(20),
      ADR3 => index(21),
      ADR1 => index(22),
      ADR0 => index(23),
      ADR2 => index(24),
      ADR5 => '1',
      O => Mcompar_index_31_GND_6_o_LessThan_100_o_lut_4_Q_455
    );
  N1_5_A5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X73Y117",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N1_5_A5LUT_O_UNCONNECTED
    );
  data_out_12_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y137"
    )
    port map (
      I => NlwBufferSignal_data_out_12_OBUF_I,
      O => data_out(12)
    );
  data_out_13_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y134"
    )
    port map (
      I => NlwBufferSignal_data_out_13_OBUF_I,
      O => data_out(13)
    );
  data_out_20_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y129"
    )
    port map (
      I => NlwBufferSignal_data_out_20_OBUF_I,
      O => data_out(20)
    );
  data_out_0_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y148"
    )
    port map (
      I => NlwBufferSignal_data_out_0_OBUF_I,
      O => data_out(0)
    );
  data_out_4_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y145"
    )
    port map (
      I => NlwBufferSignal_data_out_4_OBUF_I,
      O => data_out(4)
    );
  data_out_30_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y115"
    )
    port map (
      I => NlwBufferSignal_data_out_30_OBUF_I,
      O => data_out(30)
    );
  data_out_2_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y147"
    )
    port map (
      I => NlwBufferSignal_data_out_2_OBUF_I,
      O => data_out(2)
    );
  data_out_16_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y133"
    )
    port map (
      I => NlwBufferSignal_data_out_16_OBUF_I,
      O => data_out(16)
    );
  data_out_18_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y131"
    )
    port map (
      I => NlwBufferSignal_data_out_18_OBUF_I,
      O => data_out(18)
    );
  data_out_22_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y124"
    )
    port map (
      I => NlwBufferSignal_data_out_22_OBUF_I,
      O => data_out(22)
    );
  data_out_15_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y132"
    )
    port map (
      I => NlwBufferSignal_data_out_15_OBUF_I,
      O => data_out(15)
    );
  data_out_1_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y146"
    )
    port map (
      I => NlwBufferSignal_data_out_1_OBUF_I,
      O => data_out(1)
    );
  data_out_31_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y117"
    )
    port map (
      I => NlwBufferSignal_data_out_31_OBUF_I,
      O => data_out(31)
    );
  data_out_3_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y144"
    )
    port map (
      I => NlwBufferSignal_data_out_3_OBUF_I,
      O => data_out(3)
    );
  data_out_25_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y123"
    )
    port map (
      I => NlwBufferSignal_data_out_25_OBUF_I,
      O => data_out(25)
    );
  data_out_21_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y126"
    )
    port map (
      I => NlwBufferSignal_data_out_21_OBUF_I,
      O => data_out(21)
    );
  data_out_17_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y130"
    )
    port map (
      I => NlwBufferSignal_data_out_17_OBUF_I,
      O => data_out(17)
    );
  data_out_26_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y120"
    )
    port map (
      I => NlwBufferSignal_data_out_26_OBUF_I,
      O => data_out(26)
    );
  ProtoComp26_INTERMDISABLE_GND_2 : X_ZERO
    generic map(
      LOC => "IOB_X1Y116"
    )
    port map (
      O => right_ProtoComp26_INTERMDISABLE_GND_0
    );
  right_IBUF : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X1Y116"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => right_ProtoComp26_INTERMDISABLE_GND_0,
      O => right_IBUF_1162,
      I => right,
      TPWRGT => '1'
    );
  data_out_6_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y143"
    )
    port map (
      I => NlwBufferSignal_data_out_6_OBUF_I,
      O => data_out(6)
    );
  data_out_19_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y127"
    )
    port map (
      I => NlwBufferSignal_data_out_19_OBUF_I,
      O => data_out(19)
    );
  data_out_24_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y122"
    )
    port map (
      I => NlwBufferSignal_data_out_24_OBUF_I,
      O => data_out(24)
    );
  data_out_23_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y125"
    )
    port map (
      I => NlwBufferSignal_data_out_23_OBUF_I,
      O => data_out(23)
    );
  data_out_14_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y135"
    )
    port map (
      I => NlwBufferSignal_data_out_14_OBUF_I,
      O => data_out(14)
    );
  data_out_5_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y142"
    )
    port map (
      I => NlwBufferSignal_data_out_5_OBUF_I,
      O => data_out(5)
    );
  data_out_7_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y140"
    )
    port map (
      I => NlwBufferSignal_data_out_7_OBUF_I,
      O => data_out(7)
    );
  data_out_28_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y118"
    )
    port map (
      I => NlwBufferSignal_data_out_28_OBUF_I,
      O => data_out(28)
    );
  data_out_27_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y121"
    )
    port map (
      I => NlwBufferSignal_data_out_27_OBUF_I,
      O => data_out(27)
    );
  memory_reg_6_3 : X_FF
    generic map(
      LOC => "SLICE_X75Y110",
      INIT => '0'
    )
    port map (
      CE => Q_n0394_inv,
      CLK => NlwBufferSignal_memory_reg_6_3_CLK,
      I => memory_reg_6_3_memory_reg_6_3_mux_93_OUT_3_Q,
      O => memory_reg_6(3),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1241 : X_LUT6
    generic map(
      LOC => "SLICE_X75Y110",
      INIT => X"FFFFFFFFCCF000F0"
    )
    port map (
      ADR0 => '1',
      ADR2 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1121_1090,
      ADR3 => index_2_Decoder_32_OUT_6_Q,
      ADR1 => dec_val_flag_0,
      ADR4 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1122,
      ADR5 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1123,
      O => memory_reg_6_3_memory_reg_6_3_mux_93_OUT_3_Q
    );
  clk_BUFGP_BUFG : X_CKBUF
    generic map(
      LOC => "BUFGCTRL_X0Y31",
      PATHPULSE => 50 ps
    )
    port map (
      I => NlwBufferSignal_clk_BUFGP_BUFG_IN,
      O => clk_BUFGP
    );
  data_out_29_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y119"
    )
    port map (
      I => NlwBufferSignal_data_out_29_OBUF_I,
      O => data_out(29)
    );
  data_out_9_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y138"
    )
    port map (
      I => NlwBufferSignal_data_out_9_OBUF_I,
      O => data_out(9)
    );
  cntr_load_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y114"
    )
    port map (
      I => NlwBufferSignal_cntr_load_OBUF_I,
      O => cntr_load
    );
  memory_reg_4_1 : X_FF
    generic map(
      LOC => "SLICE_X76Y108",
      INIT => '0'
    )
    port map (
      CE => Q_n0362_inv_0,
      CLK => NlwBufferSignal_memory_reg_4_1_CLK,
      I => memory_reg_4_3_memory_reg_4_3_mux_91_OUT_1_Q,
      O => memory_reg_4(1),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1141 : X_LUT6
    generic map(
      LOC => "SLICE_X76Y108",
      INIT => X"FFFF7FFF80000000"
    )
    port map (
      ADR5 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1101_1163,
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR1 => curr_state_FSM_FFd3_1088,
      ADR3 => curr_state_FSM_FFd2_1087,
      ADR2 => index_2_Decoder_32_OUT_4_Q,
      ADR4 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1102,
      O => memory_reg_4_3_memory_reg_4_3_mux_91_OUT_1_Q
    );
  ProtoComp26_INTERMDISABLE_GND_4 : X_ZERO
    generic map(
      LOC => "IOB_X1Y108"
    )
    port map (
      O => down_ProtoComp26_INTERMDISABLE_GND_0
    );
  down_IBUF : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X1Y108"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => down_ProtoComp26_INTERMDISABLE_GND_0,
      O => down_IBUF_1086,
      I => down,
      TPWRGT => '1'
    );
  ProtoComp26_INTERMDISABLE_GND_5 : X_ZERO
    generic map(
      LOC => "IOB_X1Y112"
    )
    port map (
      O => center_ProtoComp26_INTERMDISABLE_GND_0
    );
  center_IBUF : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X1Y112"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => center_ProtoComp26_INTERMDISABLE_GND_0,
      O => center_IBUF_1089,
      I => center,
      TPWRGT => '1'
    );
  data_out_8_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y141"
    )
    port map (
      I => NlwBufferSignal_data_out_8_OBUF_I,
      O => data_out(8)
    );
  memory_reg_6_0 : X_FF
    generic map(
      LOC => "SLICE_X75Y112",
      INIT => '0'
    )
    port map (
      CE => Q_n0394_inv,
      CLK => NlwBufferSignal_memory_reg_6_0_CLK,
      I => NlwBufferSignal_memory_reg_6_0_IN,
      O => memory_reg_6(0),
      RST => rst_IBUF_1081,
      SET => GND
    );
  memory_reg_1_3_memory_reg_1_3_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Q_n0362_inv,
      O => Q_n0362_inv_0
    );
  memory_reg_1_3 : X_FF
    generic map(
      LOC => "SLICE_X76Y106",
      INIT => '0'
    )
    port map (
      CE => Q_n0314_inv,
      CLK => NlwBufferSignal_memory_reg_1_3_CLK,
      I => memory_reg_1_3_memory_reg_1_3_mux_88_OUT_3_Q,
      O => memory_reg_1(3),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT141 : X_LUT6
    generic map(
      LOC => "SLICE_X76Y106",
      INIT => X"FFFFFFFFCFC00F00"
    )
    port map (
      ADR0 => '1',
      ADR3 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1121_1090,
      ADR2 => index_2_Decoder_32_OUT_1_Q,
      ADR1 => dec_val_flag_0,
      ADR4 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1122,
      ADR5 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1123,
      O => memory_reg_1_3_memory_reg_1_3_mux_88_OUT_3_Q
    );
  Q_n0314_inv1 : X_LUT6
    generic map(
      LOC => "SLICE_X76Y106",
      INIT => X"0200000002000000"
    )
    port map (
      ADR2 => index(2),
      ADR1 => index(1),
      ADR4 => index(0),
      ADR0 => curr_state_FSM_FFd3_1088,
      ADR3 => curr_state_FSM_FFd2_1087,
      ADR5 => '1',
      O => Q_n0314_inv
    );
  Q_n0362_inv1 : X_LUT5
    generic map(
      LOC => "SLICE_X76Y106",
      INIT => X"00002000"
    )
    port map (
      ADR2 => index(2),
      ADR1 => index(1),
      ADR4 => index(0),
      ADR0 => curr_state_FSM_FFd3_1088,
      ADR3 => curr_state_FSM_FFd2_1087,
      O => Q_n0362_inv
    );
  Q_n0410_inv_n0410_inv_BMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Q_n0298_inv,
      O => Q_n0298_inv_0
    );
  Q_n0410_inv1 : X_LUT6
    generic map(
      LOC => "SLICE_X76Y107",
      INIT => X"8000000080000000"
    )
    port map (
      ADR4 => curr_state_FSM_FFd3_1088,
      ADR1 => curr_state_FSM_FFd2_1087,
      ADR0 => index(2),
      ADR3 => index(1),
      ADR2 => index(0),
      ADR5 => '1',
      O => Q_n0410_inv
    );
  Q_n0298_inv1 : X_LUT5
    generic map(
      LOC => "SLICE_X76Y107",
      INIT => X"00040000"
    )
    port map (
      ADR4 => curr_state_FSM_FFd3_1088,
      ADR1 => curr_state_FSM_FFd2_1087,
      ADR0 => index(2),
      ADR3 => index(1),
      ADR2 => index(0),
      O => Q_n0298_inv
    );
  ProtoComp26_INTERMDISABLE_GND_3 : X_ZERO
    generic map(
      LOC => "IOB_X1Y109"
    )
    port map (
      O => left_ProtoComp26_INTERMDISABLE_GND_0
    );
  left_IBUF : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X1Y109"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => left_ProtoComp26_INTERMDISABLE_GND_0,
      O => left_IBUF_1161,
      I => left,
      TPWRGT => '1'
    );
  memory_reg_4_2_memory_reg_4_2_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => index_2_Decoder_32_OUT_4_pack_2,
      O => index_2_Decoder_32_OUT_4_Q
    );
  index_2_Decoder_32_OUT_5_2_1 : X_LUT6
    generic map(
      LOC => "SLICE_X74Y109",
      INIT => X"0000888800008888"
    )
    port map (
      ADR2 => '1',
      ADR3 => '1',
      ADR0 => index(0),
      ADR1 => index(2),
      ADR4 => index(1),
      ADR5 => '1',
      O => index_2_Decoder_32_OUT_5_Q
    );
  index_2_Decoder_32_OUT_4_2_1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y109",
      INIT => X"00004444"
    )
    port map (
      ADR2 => '1',
      ADR3 => '1',
      ADR0 => index(0),
      ADR1 => index(2),
      ADR4 => index(1),
      O => index_2_Decoder_32_OUT_4_pack_2
    );
  memory_reg_4_2 : X_FF
    generic map(
      LOC => "SLICE_X74Y109",
      INIT => '0'
    )
    port map (
      CE => Q_n0362_inv_0,
      CLK => NlwBufferSignal_memory_reg_4_2_CLK,
      I => memory_reg_4_3_memory_reg_4_3_mux_91_OUT_2_Q,
      O => memory_reg_4(2),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1151 : X_LUT6
    generic map(
      LOC => "SLICE_X74Y109",
      INIT => X"F30C33CCCF20FF00"
    )
    port map (
      ADR5 => Madd_index_2_GND_6_o_add_31_OUT_cy_0_0,
      ADR1 => Madd_index_2_GND_6_o_add_31_OUT_lut_1_0,
      ADR3 => Madd_index_2_GND_6_o_add_31_OUT_lut_2_0,
      ADR0 => Madd_index_2_GND_6_o_add_31_OUT_lut_3_0,
      ADR2 => dec_val_flag_0,
      ADR4 => index_2_Decoder_32_OUT_4_Q,
      O => memory_reg_4_3_memory_reg_4_3_mux_91_OUT_2_Q
    );
  memory_reg_4_0 : X_FF
    generic map(
      LOC => "SLICE_X74Y109",
      INIT => '0'
    )
    port map (
      CE => Q_n0362_inv_0,
      CLK => NlwBufferSignal_memory_reg_4_0_CLK,
      I => memory_reg_0_3_memory_reg_0_3_mux_87_OUT_0_Q,
      O => memory_reg_4(0),
      RST => rst_IBUF_1081,
      SET => GND
    );
  memory_reg_0_3_memory_reg_0_3_mux_87_OUT_0_1_INV_0 : X_LUT6
    generic map(
      LOC => "SLICE_X74Y109",
      INIT => X"00000000FFFFFFFF"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      ADR5 => Madd_index_2_GND_6_o_add_31_OUT_cy_0_0,
      O => memory_reg_0_3_memory_reg_0_3_mux_87_OUT_0_Q
    );
  ProtoComp26_INTERMDISABLE_GND_6 : X_ZERO
    generic map(
      LOC => "IOB_X1Y149"
    )
    port map (
      O => rst_ProtoComp26_INTERMDISABLE_GND_0
    );
  rst_IBUF : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X1Y149"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => rst_ProtoComp26_INTERMDISABLE_GND_0,
      O => rst_IBUF_1081,
      I => rst,
      TPWRGT => '1'
    );
  memory_reg_6_2_memory_reg_6_2_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => index_2_Decoder_32_OUT_6_pack_8,
      O => index_2_Decoder_32_OUT_6_Q
    );
  memory_reg_6_2_memory_reg_6_2_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Q_n0394_inv_pack_7,
      O => Q_n0394_inv
    );
  index_2_Decoder_32_OUT_7_2_1 : X_LUT6
    generic map(
      LOC => "SLICE_X75Y109",
      INIT => X"AA000000AA000000"
    )
    port map (
      ADR2 => '1',
      ADR1 => '1',
      ADR3 => index(2),
      ADR4 => index(1),
      ADR0 => index(0),
      ADR5 => '1',
      O => index_2_Decoder_32_OUT_7_Q
    );
  index_2_Decoder_32_OUT_6_2_1 : X_LUT5
    generic map(
      LOC => "SLICE_X75Y109",
      INIT => X"55000000"
    )
    port map (
      ADR2 => '1',
      ADR1 => '1',
      ADR3 => index(2),
      ADR4 => index(1),
      ADR0 => index(0),
      O => index_2_Decoder_32_OUT_6_pack_8
    );
  memory_reg_6_2 : X_FF
    generic map(
      LOC => "SLICE_X75Y109",
      INIT => '0'
    )
    port map (
      CE => Q_n0394_inv,
      CLK => NlwBufferSignal_memory_reg_6_2_CLK,
      I => memory_reg_6_3_memory_reg_6_3_mux_93_OUT_2_Q,
      O => memory_reg_6(2),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1231 : X_LUT6
    generic map(
      LOC => "SLICE_X75Y109",
      INIT => X"C3CC33CCCC2CCCCC"
    )
    port map (
      ADR5 => Madd_index_2_GND_6_o_add_31_OUT_cy_0_0,
      ADR3 => Madd_index_2_GND_6_o_add_31_OUT_lut_1_0,
      ADR1 => Madd_index_2_GND_6_o_add_31_OUT_lut_2_0,
      ADR0 => Madd_index_2_GND_6_o_add_31_OUT_lut_3_0,
      ADR4 => dec_val_flag_0,
      ADR2 => index_2_Decoder_32_OUT_6_Q,
      O => memory_reg_6_3_memory_reg_6_3_mux_93_OUT_2_Q
    );
  memory_reg_6_1 : X_FF
    generic map(
      LOC => "SLICE_X75Y109",
      INIT => '0'
    )
    port map (
      CE => Q_n0394_inv,
      CLK => NlwBufferSignal_memory_reg_6_1_CLK,
      I => memory_reg_6_3_memory_reg_6_3_mux_93_OUT_1_Q,
      O => memory_reg_6(1),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1221 : X_LUT6
    generic map(
      LOC => "SLICE_X75Y109",
      INIT => X"FFFF7FFF80000000"
    )
    port map (
      ADR5 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1101_1163,
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR1 => curr_state_FSM_FFd3_1088,
      ADR3 => curr_state_FSM_FFd2_1087,
      ADR2 => index_2_Decoder_32_OUT_6_Q,
      ADR4 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1102,
      O => memory_reg_6_3_memory_reg_6_3_mux_93_OUT_1_Q
    );
  Q_n0378_inv1 : X_LUT6
    generic map(
      LOC => "SLICE_X75Y109",
      INIT => X"0080000000800000"
    )
    port map (
      ADR0 => curr_state_FSM_FFd3_1088,
      ADR2 => curr_state_FSM_FFd2_1087,
      ADR4 => index(0),
      ADR1 => index(2),
      ADR3 => index(1),
      ADR5 => '1',
      O => Q_n0378_inv
    );
  Q_n0394_inv1 : X_LUT5
    generic map(
      LOC => "SLICE_X75Y109",
      INIT => X"00008000"
    )
    port map (
      ADR0 => curr_state_FSM_FFd3_1088,
      ADR2 => curr_state_FSM_FFd2_1087,
      ADR4 => index(0),
      ADR1 => index(2),
      ADR3 => index(1),
      O => Q_n0394_inv_pack_7
    );
  curr_state_n0456_1_1 : X_LUT6
    generic map(
      LOC => "SLICE_X75Y114",
      INIT => X"CCCCCCCC00000000"
    )
    port map (
      ADR0 => '1',
      ADR4 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR5 => curr_state_FSM_FFd4_1083,
      ADR1 => curr_state_FSM_FFd1_1096,
      O => dec_pos_flag
    );
  memory_reg_0_3 : X_FF
    generic map(
      LOC => "SLICE_X76Y109",
      INIT => '0'
    )
    port map (
      CE => Q_n0298_inv_0,
      CLK => NlwBufferSignal_memory_reg_0_3_CLK,
      I => memory_reg_0_3_memory_reg_0_3_mux_87_OUT_3_Q,
      O => memory_reg_0(3),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT41 : X_LUT6
    generic map(
      LOC => "SLICE_X76Y109",
      INIT => X"FFFFFFFFEE444444"
    )
    port map (
      ADR2 => '1',
      ADR1 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1121_1090,
      ADR0 => index_2_Decoder_32_OUT_0_0,
      ADR3 => dec_val_flag_0,
      ADR4 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1122,
      ADR5 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1123,
      O => memory_reg_0_3_memory_reg_0_3_mux_87_OUT_3_Q
    );
  memory_reg_0_2 : X_FF
    generic map(
      LOC => "SLICE_X76Y109",
      INIT => '0'
    )
    port map (
      CE => Q_n0298_inv_0,
      CLK => NlwBufferSignal_memory_reg_0_2_CLK,
      I => memory_reg_0_3_memory_reg_0_3_mux_87_OUT_2_Q,
      O => memory_reg_0(2),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT31 : X_LUT6
    generic map(
      LOC => "SLICE_X76Y109",
      INIT => X"B43CD2F0B43CD0F0"
    )
    port map (
      ADR1 => Madd_index_2_GND_6_o_add_31_OUT_cy_0_0,
      ADR4 => Madd_index_2_GND_6_o_add_31_OUT_lut_1_0,
      ADR2 => Madd_index_2_GND_6_o_add_31_OUT_lut_2_0,
      ADR5 => Madd_index_2_GND_6_o_add_31_OUT_lut_3_0,
      ADR3 => dec_val_flag_0,
      ADR0 => index_2_Decoder_32_OUT_0_0,
      O => memory_reg_0_3_memory_reg_0_3_mux_87_OUT_2_Q
    );
  memory_reg_0_1 : X_FF
    generic map(
      LOC => "SLICE_X76Y109",
      INIT => '0'
    )
    port map (
      CE => Q_n0298_inv_0,
      CLK => NlwBufferSignal_memory_reg_0_1_CLK,
      I => memory_reg_0_3_memory_reg_0_3_mux_87_OUT_1_Q,
      O => memory_reg_0(1),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT21 : X_LUT6
    generic map(
      LOC => "SLICE_X76Y109",
      INIT => X"FFFF80007FFF0000"
    )
    port map (
      ADR4 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1101_1163,
      ADR1 => curr_state_FSM_FFd4_1083,
      ADR3 => curr_state_FSM_FFd3_1088,
      ADR0 => curr_state_FSM_FFd2_1087,
      ADR2 => index_2_Decoder_32_OUT_0_0,
      ADR5 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1102,
      O => memory_reg_0_3_memory_reg_0_3_mux_87_OUT_1_Q
    );
  memory_reg_0_0 : X_FF
    generic map(
      LOC => "SLICE_X76Y109",
      INIT => '0'
    )
    port map (
      CE => Q_n0298_inv_0,
      CLK => NlwBufferSignal_memory_reg_0_0_CLK,
      I => NlwBufferSignal_memory_reg_0_0_IN,
      O => memory_reg_0(0),
      RST => rst_IBUF_1081,
      SET => GND
    );
  curr_state_FSM_FFd3_curr_state_FSM_FFd3_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => curr_state_FSM_FFd3_In2_pack_14,
      O => curr_state_FSM_FFd3_In2_1201
    );
  curr_state_FSM_FFd3_In1 : X_LUT6
    generic map(
      LOC => "SLICE_X79Y111",
      INIT => X"AAAAAAFAAAAAAAFA"
    )
    port map (
      ADR1 => '1',
      ADR4 => up_IBUF_1085,
      ADR2 => down_IBUF_1086,
      ADR3 => right_IBUF_1162,
      ADR0 => left_IBUF_1161,
      ADR5 => '1',
      O => curr_state_FSM_FFd3_In1_1200
    );
  curr_state_FSM_FFd3_In2 : X_LUT5
    generic map(
      LOC => "SLICE_X79Y111",
      INIT => X"00550050"
    )
    port map (
      ADR1 => '1',
      ADR4 => up_IBUF_1085,
      ADR2 => down_IBUF_1086,
      ADR3 => right_IBUF_1162,
      ADR0 => left_IBUF_1161,
      O => curr_state_FSM_FFd3_In2_pack_14
    );
  curr_state_FSM_FFd3 : X_FF
    generic map(
      LOC => "SLICE_X79Y111",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_curr_state_FSM_FFd3_CLK,
      I => curr_state_FSM_FFd3_In,
      O => curr_state_FSM_FFd3_1088,
      RST => rst_IBUF_1081,
      SET => GND
    );
  curr_state_FSM_FFd3_In3 : X_LUT6
    generic map(
      LOC => "SLICE_X79Y111",
      INIT => X"2000200020112000"
    )
    port map (
      ADR3 => curr_state_FSM_FFd2_1087,
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR4 => curr_state_FSM_FFd3_In1_1200,
      ADR1 => curr_state_FSM_FFd3_1088,
      ADR5 => curr_state_FSM_FFd1_1096,
      ADR2 => curr_state_FSM_FFd3_In2_1201,
      O => curr_state_FSM_FFd3_In
    );
  curr_state_FSM_FFd2_In1 : X_LUT6
    generic map(
      LOC => "SLICE_X79Y111",
      INIT => X"AAAA0500AAAA0504"
    )
    port map (
      ADR4 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd2_1087,
      ADR2 => curr_state_FSM_FFd3_1088,
      ADR3 => up_IBUF_1085,
      ADR1 => center_IBUF_1089,
      ADR5 => down_IBUF_1086,
      O => curr_state_FSM_FFd2_In1_1199
    );
  curr_state_FSM_FFd2 : X_FF
    generic map(
      LOC => "SLICE_X79Y111",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_curr_state_FSM_FFd2_CLK,
      I => curr_state_FSM_FFd2_In,
      O => curr_state_FSM_FFd2_1087,
      RST => rst_IBUF_1081,
      SET => GND
    );
  curr_state_FSM_FFd2_In2 : X_LUT6
    generic map(
      LOC => "SLICE_X79Y111",
      INIT => X"FCFCFDFCCCCCDDCC"
    )
    port map (
      ADR1 => curr_state_FSM_FFd1_1096,
      ADR2 => curr_state_FSM_FFd3_1088,
      ADR3 => curr_state_FSM_FFd2_In1_1199,
      ADR5 => curr_state_FSM_FFd2_1087,
      ADR4 => left_IBUF_1161,
      ADR0 => right_IBUF_1162,
      O => curr_state_FSM_FFd2_In
    );
  cntr_en_OBUF_cntr_en_OBUF_BMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Q_n0439_inv_pack_1,
      O => Q_n0439_inv
    );
  cntr_en_419 : X_FF
    generic map(
      LOC => "SLICE_X88Y107",
      INIT => '0'
    )
    port map (
      CE => Q_n0439_inv,
      CLK => NlwBufferSignal_cntr_en_CLK,
      I => Q_n0421,
      O => cntr_en_OBUF_1166,
      RST => rst_IBUF_1081,
      SET => GND
    );
  curr_state_n04211 : X_LUT6
    generic map(
      LOC => "SLICE_X88Y107",
      INIT => X"FF00FF55FF00FF55"
    )
    port map (
      ADR2 => '1',
      ADR1 => '1',
      ADR0 => curr_state_FSM_FFd3_1088,
      ADR4 => curr_state_FSM_FFd2_1087,
      ADR3 => curr_state_FSM_FFd1_1096,
      ADR5 => '1',
      O => Q_n0421
    );
  Q_n0439_inv1 : X_LUT5
    generic map(
      LOC => "SLICE_X88Y107",
      INIT => X"0050005A"
    )
    port map (
      ADR1 => '1',
      ADR2 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd3_1088,
      ADR4 => curr_state_FSM_FFd2_1087,
      ADR3 => curr_state_FSM_FFd1_1096,
      O => Q_n0439_inv_pack_1
    );
  curr_state_FSM_FFd1_curr_state_FSM_FFd1_BMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => curr_state_FSM_FFd4_In1_pack_5,
      O => curr_state_FSM_FFd4_In1_1198
    );
  curr_state_FSM_FFd1 : X_FF
    generic map(
      LOC => "SLICE_X79Y110",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_curr_state_FSM_FFd1_CLK,
      I => curr_state_FSM_FFd1_In,
      O => curr_state_FSM_FFd1_1096,
      RST => rst_IBUF_1081,
      SET => GND
    );
  curr_state_FSM_FFd1_In1 : X_LUT6
    generic map(
      LOC => "SLICE_X79Y110",
      INIT => X"00C0008000C00080"
    )
    port map (
      ADR2 => curr_state_FSM_FFd4_1083,
      ADR3 => curr_state_FSM_FFd3_1088,
      ADR1 => curr_state_FSM_FFd2_1087,
      ADR0 => left_IBUF_1161,
      ADR4 => right_IBUF_1162,
      ADR5 => '1',
      O => curr_state_FSM_FFd1_In
    );
  curr_state_FSM_FFd4_In1 : X_LUT5
    generic map(
      LOC => "SLICE_X79Y110",
      INIT => X"C0C30000"
    )
    port map (
      ADR2 => curr_state_FSM_FFd4_1083,
      ADR3 => curr_state_FSM_FFd3_1088,
      ADR1 => curr_state_FSM_FFd2_1087,
      ADR0 => '1',
      ADR4 => right_IBUF_1162,
      O => curr_state_FSM_FFd4_In1_pack_5
    );
  curr_state_FSM_FFd4 : X_FF
    generic map(
      LOC => "SLICE_X79Y110",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_curr_state_FSM_FFd4_CLK,
      I => curr_state_FSM_FFd4_In,
      O => curr_state_FSM_FFd4_1083,
      RST => rst_IBUF_1081,
      SET => GND
    );
  curr_state_FSM_FFd4_In3 : X_LUT6
    generic map(
      LOC => "SLICE_X79Y110",
      INIT => X"FFCCCCCCFFFEFEFE"
    )
    port map (
      ADR5 => left_IBUF_1161,
      ADR2 => curr_state_FSM_FFd4_In2_1084,
      ADR0 => curr_state_FSM_FFd4_In1_1198,
      ADR1 => curr_state_FSM_FFd1_1096,
      ADR4 => curr_state_FSM_FFd2_1087,
      ADR3 => curr_state_FSM_FFd3_1088,
      O => curr_state_FSM_FFd4_In
    );
  curr_state_FSM_FFd4_In2 : X_LUT6
    generic map(
      LOC => "SLICE_X78Y111",
      INIT => X"2030000020300302"
    )
    port map (
      ADR1 => up_IBUF_1085,
      ADR0 => down_IBUF_1086,
      ADR4 => curr_state_FSM_FFd2_1087,
      ADR2 => curr_state_FSM_FFd4_1083,
      ADR5 => curr_state_FSM_FFd3_1088,
      ADR3 => center_IBUF_1089,
      O => curr_state_FSM_FFd4_In2_1084
    );
  edit_en_out_OBUF_edit_en_out_OBUF_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => dec_val_flag,
      O => dec_val_flag_0
    );
  Q_n0451_inv1 : X_LUT6
    generic map(
      LOC => "SLICE_X78Y109",
      INIT => X"0303000003030000"
    )
    port map (
      ADR0 => '1',
      ADR3 => '1',
      ADR4 => curr_state_FSM_FFd2_1087,
      ADR1 => curr_state_FSM_FFd1_1096,
      ADR2 => curr_state_FSM_FFd3_1088,
      ADR5 => '1',
      O => Q_n0451_inv
    );
  curr_state_n0465_3_1 : X_LUT5
    generic map(
      LOC => "SLICE_X78Y109",
      INIT => X"F0000000"
    )
    port map (
      ADR0 => '1',
      ADR3 => curr_state_FSM_FFd4_1083,
      ADR4 => curr_state_FSM_FFd2_1087,
      ADR1 => '1',
      ADR2 => curr_state_FSM_FFd3_1088,
      O => dec_val_flag
    );
  edit_en_out_397 : X_FF
    generic map(
      LOC => "SLICE_X78Y109",
      INIT => '0'
    )
    port map (
      CE => Q_n0451_inv,
      CLK => NlwBufferSignal_edit_en_out_CLK,
      I => NlwBufferSignal_edit_en_out_IN,
      O => edit_en_out_OBUF_1082,
      RST => rst_IBUF_1081,
      SET => GND
    );
  cntr_rst_OBUF_cntr_rst_OBUF_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => cntr_load_OBUF_1030,
      O => cntr_load_OBUF_0
    );
  curr_state_n0465_1_1 : X_LUT6
    generic map(
      LOC => "SLICE_X88Y113",
      INIT => X"3030000030300000"
    )
    port map (
      ADR0 => '1',
      ADR3 => '1',
      ADR2 => curr_state_FSM_FFd4_1083,
      ADR4 => curr_state_FSM_FFd3_1088,
      ADR1 => curr_state_FSM_FFd2_1087,
      ADR5 => '1',
      O => cntr_rst_OBUF_1101
    );
  curr_state_n0465_0_1 : X_LUT5
    generic map(
      LOC => "SLICE_X88Y113",
      INIT => X"00000C0C"
    )
    port map (
      ADR0 => '1',
      ADR3 => '1',
      ADR2 => curr_state_FSM_FFd4_1083,
      ADR4 => curr_state_FSM_FFd3_1088,
      ADR1 => curr_state_FSM_FFd2_1087,
      O => cntr_load_OBUF_1030
    );
  index_3 : X_FF
    generic map(
      LOC => "SLICE_X74Y114",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_3_CLK,
      I => index_31_GND_6_o_mux_102_OUT_3_Q,
      O => index(3),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_3_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y114",
      INIT => X"88F8087888F80878"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR1 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR2 => index(3),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_3_Q_70
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_3_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y114",
      INIT => X"007080F0"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR1 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR2 => index(3),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_3_mand1_68
    );
  index_2 : X_FF
    generic map(
      LOC => "SLICE_X74Y114",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_2_CLK,
      I => index_31_GND_6_o_mux_102_OUT_2_Q,
      O => index(2),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_3_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X74Y114"
    )
    port map (
      CI => '0',
      CYINIT => dec_pos_flag,
      CO(3) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_3_Q_1168,
      CO(2) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_3_CO_2_UNCONNECTED,
      CO(1) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_3_CO_1_UNCONNECTED,
      CO(0) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_3_CO_0_UNCONNECTED,
      DI(3) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_3_mand1_68,
      DI(2) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_2_Q,
      DI(1) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_1_Q,
      DI(0) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_0_Q,
      O(3) => index_31_GND_6_o_mux_102_OUT_3_Q,
      O(2) => index_31_GND_6_o_mux_102_OUT_2_Q,
      O(1) => index_31_GND_6_o_mux_102_OUT_1_Q,
      O(0) => index_31_GND_6_o_mux_102_OUT_0_Q,
      S(3) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_3_Q_70,
      S(2) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_2_Q_75,
      S(1) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_1_Q_91,
      S(0) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_0_Q_93
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_2_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y114",
      INIT => X"004C80CC004C80CC"
    )
    port map (
      ADR2 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(2),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_2_Q_75
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_A231 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y114",
      INIT => X"A0EC80CC"
    )
    port map (
      ADR2 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(2),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_2_Q
    );
  index_1 : X_FF
    generic map(
      LOC => "SLICE_X74Y114",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_1_CLK,
      I => index_31_GND_6_o_mux_102_OUT_1_Q,
      O => index(1),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_1_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y114",
      INIT => X"004C206C004C206C"
    )
    port map (
      ADR2 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(1),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_1_Q_91
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_A121 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y114",
      INIT => X"A0EC80CC"
    )
    port map (
      ADR2 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(1),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_1_Q
    );
  index_0 : X_FF
    generic map(
      LOC => "SLICE_X74Y114",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_0_CLK,
      I => index_31_GND_6_o_mux_102_OUT_0_Q,
      O => index(0),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_0_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y114",
      INIT => X"0007080F0007080F"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR1 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR2 => index(0),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_0_Q_93
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_A11 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y114",
      INIT => X"88F880F0"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR1 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR2 => index(0),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_0_Q
    );
  index_7 : X_FF
    generic map(
      LOC => "SLICE_X74Y115",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_7_CLK,
      I => index_31_GND_6_o_mux_102_OUT_7_Q,
      O => index(7),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_7_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y115",
      INIT => X"88F8087888F80878"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR1 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR2 => index(7),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_7_Q_111
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_7_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y115",
      INIT => X"007080F0"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR1 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR2 => index(7),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_7_mand1_106
    );
  index_6 : X_FF
    generic map(
      LOC => "SLICE_X74Y115",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_6_CLK,
      I => index_31_GND_6_o_mux_102_OUT_6_Q,
      O => index(6),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_7_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X74Y115"
    )
    port map (
      CI => Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_3_Q_1168,
      CYINIT => '0',
      CO(3) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_7_Q_1169,
      CO(2) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_7_CO_2_UNCONNECTED,
      CO(1) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_7_CO_1_UNCONNECTED,
      CO(0) => NLW_Mmux_index_31_GND_6_o_mux_102_OUT_rs_cy_7_CO_0_UNCONNECTED,
      DI(3) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_7_mand1_106,
      DI(2) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_6_mand1_116,
      DI(1) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_5_mand1_130,
      DI(0) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_4_mand1_126,
      O(3) => index_31_GND_6_o_mux_102_OUT_7_Q,
      O(2) => index_31_GND_6_o_mux_102_OUT_6_Q,
      O(1) => index_31_GND_6_o_mux_102_OUT_5_Q,
      O(0) => index_31_GND_6_o_mux_102_OUT_4_Q,
      S(3) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_7_Q_111,
      S(2) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_6_Q_110,
      S(1) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_5_Q_137,
      S(0) => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_4_Q_136
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_6_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y115",
      INIT => X"A0EC206CA0EC206C"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR2 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(6),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_6_Q_110
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_6_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y115",
      INIT => X"004C80CC"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR2 => curr_state_FSM_FFd1_1096,
      ADR3 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(6),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_6_mand1_116
    );
  index_5 : X_FF
    generic map(
      LOC => "SLICE_X74Y115",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_5_CLK,
      I => index_31_GND_6_o_mux_102_OUT_5_Q,
      O => index(5),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_5_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y115",
      INIT => X"AE0C260CAE0C260C"
    )
    port map (
      ADR3 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(5),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_5_Q_137
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_5_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y115",
      INIT => X"040C8C0C"
    )
    port map (
      ADR3 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(5),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_5_mand1_130
    );
  index_4 : X_FF
    generic map(
      LOC => "SLICE_X74Y115",
      INIT => '0'
    )
    port map (
      CE => curr_state_FSM_FFd1_1096,
      CLK => NlwBufferSignal_index_4_CLK,
      I => index_31_GND_6_o_mux_102_OUT_4_Q,
      O => index(4),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_4_Q : X_LUT6
    generic map(
      LOC => "SLICE_X74Y115",
      INIT => X"AE0C260CAE0C260C"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR3 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(4),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      ADR5 => '1',
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_lut_4_Q_136
    );
  Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_4_mand1 : X_LUT5
    generic map(
      LOC => "SLICE_X74Y115",
      INIT => X"040C8C0C"
    )
    port map (
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR3 => curr_state_FSM_FFd1_1096,
      ADR2 => Mcompar_GND_6_o_index_31_LessThan_96_o_cy_6_0,
      ADR1 => index(4),
      ADR4 => Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_0,
      O => Mmux_index_31_GND_6_o_mux_102_OUT_rs_A_4_mand1_126
    );
  memory_reg_4_3 : X_FF
    generic map(
      LOC => "SLICE_X77Y106",
      INIT => '0'
    )
    port map (
      CE => Q_n0362_inv_0,
      CLK => NlwBufferSignal_memory_reg_4_3_CLK,
      I => memory_reg_4_3_memory_reg_4_3_mux_91_OUT_3_Q,
      O => memory_reg_4(3),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1161 : X_LUT6
    generic map(
      LOC => "SLICE_X77Y106",
      INIT => X"FFFFFFFFF3C03300"
    )
    port map (
      ADR0 => '1',
      ADR3 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1121_1090,
      ADR1 => index_2_Decoder_32_OUT_4_Q,
      ADR2 => dec_val_flag_0,
      ADR4 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1122,
      ADR5 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1123,
      O => memory_reg_4_3_memory_reg_4_3_mux_91_OUT_3_Q
    );
  memory_reg_3_0_memory_reg_3_0_CMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Madd_index_2_GND_6_o_add_31_OUT_lut_2_Q,
      O => Madd_index_2_GND_6_o_add_31_OUT_lut_2_0
    );
  mux2_2_f7 : X_MUX2
    generic map(
      LOC => "SLICE_X77Y111"
    )
    port map (
      IA => mux2_4_934,
      IB => mux2_3_942,
      O => Madd_index_2_GND_6_o_add_31_OUT_lut_2_Q,
      SEL => index(2)
    );
  mux2_4 : X_LUT6
    generic map(
      LOC => "SLICE_X77Y111",
      INIT => X"ACACACACFFF00F00"
    )
    port map (
      ADR5 => index(1),
      ADR2 => index(0),
      ADR1 => memory_reg_2(2),
      ADR0 => memory_reg_3(2),
      ADR4 => memory_reg_1(2),
      ADR3 => memory_reg_0(2),
      O => mux2_4_934
    );
  mux2_3 : X_LUT6
    generic map(
      LOC => "SLICE_X77Y111",
      INIT => X"CCCCF0F0AAAAFF00"
    )
    port map (
      ADR5 => index(1),
      ADR4 => index(0),
      ADR2 => memory_reg_6(2),
      ADR1 => memory_reg_7(2),
      ADR0 => memory_reg_5(2),
      ADR3 => memory_reg_4(2),
      O => mux2_3_942
    );
  memory_reg_3_0 : X_FF
    generic map(
      LOC => "SLICE_X77Y111",
      INIT => '0'
    )
    port map (
      CE => Q_n0346_inv_0,
      CLK => NlwBufferSignal_memory_reg_3_0_CLK,
      I => NlwBufferSignal_memory_reg_3_0_IN,
      O => memory_reg_3(0),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Madd_index_2_GND_6_o_add_31_OUT_cy_0_Madd_index_2_GND_6_o_add_31_OUT_cy_0_CMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Madd_index_2_GND_6_o_add_31_OUT_cy_0_Q,
      O => Madd_index_2_GND_6_o_add_31_OUT_cy_0_0
    );
  mux_2_f7 : X_MUX2
    generic map(
      LOC => "SLICE_X76Y113"
    )
    port map (
      IA => mux_4_757,
      IB => mux_3_758,
      O => Madd_index_2_GND_6_o_add_31_OUT_cy_0_Q,
      SEL => index(2)
    );
  mux_4 : X_LUT6
    generic map(
      LOC => "SLICE_X76Y113",
      INIT => X"BF8FB383BC8CB080"
    )
    port map (
      ADR2 => index(1),
      ADR1 => index(0),
      ADR3 => memory_reg_2_0_0,
      ADR0 => memory_reg_3(0),
      ADR4 => memory_reg_1(0),
      ADR5 => memory_reg_0(0),
      O => mux_4_757
    );
  mux_3 : X_LUT6
    generic map(
      LOC => "SLICE_X76Y113",
      INIT => X"E2FFE2CCE233E200"
    )
    port map (
      ADR3 => index(1),
      ADR1 => index(0),
      ADR0 => memory_reg_6(0),
      ADR2 => memory_reg_7(0),
      ADR5 => memory_reg_5(0),
      ADR4 => memory_reg_4(0),
      O => mux_3_758
    );
  Madd_index_2_GND_6_o_add_31_OUT_lut_1_Madd_index_2_GND_6_o_add_31_OUT_lut_1_CMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Madd_index_2_GND_6_o_add_31_OUT_lut_1_Q,
      O => Madd_index_2_GND_6_o_add_31_OUT_lut_1_0
    );
  mux1_2_f7 : X_MUX2
    generic map(
      LOC => "SLICE_X76Y114"
    )
    port map (
      IA => mux1_4_773,
      IB => mux1_3_774,
      O => Madd_index_2_GND_6_o_add_31_OUT_lut_1_Q,
      SEL => index(2)
    );
  mux1_4 : X_LUT6
    generic map(
      LOC => "SLICE_X76Y114",
      INIT => X"FBEA7362D9C85140"
    )
    port map (
      ADR1 => index(1),
      ADR0 => index(0),
      ADR2 => memory_reg_2(1),
      ADR4 => memory_reg_3(1),
      ADR5 => memory_reg_1(1),
      ADR3 => memory_reg_0(1),
      O => mux1_4_773
    );
  mux1_3 : X_LUT6
    generic map(
      LOC => "SLICE_X76Y114",
      INIT => X"BF8FB383BC8CB080"
    )
    port map (
      ADR1 => index(1),
      ADR2 => index(0),
      ADR4 => memory_reg_6(1),
      ADR0 => memory_reg_7(1),
      ADR3 => memory_reg_5(1),
      ADR5 => memory_reg_4(1),
      O => mux1_3_774
    );
  memory_reg_5_3 : X_FF
    generic map(
      LOC => "SLICE_X77Y109",
      INIT => '0'
    )
    port map (
      CE => Q_n0378_inv,
      CLK => NlwBufferSignal_memory_reg_5_3_CLK,
      I => memory_reg_5_3_memory_reg_5_3_mux_92_OUT_3_Q,
      O => memory_reg_5(3),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1201 : X_LUT6
    generic map(
      LOC => "SLICE_X77Y109",
      INIT => X"FFFFFFFFF3C03300"
    )
    port map (
      ADR0 => '1',
      ADR3 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1121_1090,
      ADR1 => index_2_Decoder_32_OUT_5_Q,
      ADR2 => dec_val_flag_0,
      ADR4 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1122,
      ADR5 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1123,
      O => memory_reg_5_3_memory_reg_5_3_mux_92_OUT_3_Q
    );
  memory_reg_5_2 : X_FF
    generic map(
      LOC => "SLICE_X77Y109",
      INIT => '0'
    )
    port map (
      CE => Q_n0378_inv,
      CLK => NlwBufferSignal_memory_reg_5_2_CLK,
      I => memory_reg_5_3_memory_reg_5_3_mux_92_OUT_2_Q,
      O => memory_reg_5(2),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1191 : X_LUT6
    generic map(
      LOC => "SLICE_X77Y109",
      INIT => X"F50A55AAAF40FF00"
    )
    port map (
      ADR5 => Madd_index_2_GND_6_o_add_31_OUT_cy_0_0,
      ADR0 => Madd_index_2_GND_6_o_add_31_OUT_lut_1_0,
      ADR3 => Madd_index_2_GND_6_o_add_31_OUT_lut_2_0,
      ADR1 => Madd_index_2_GND_6_o_add_31_OUT_lut_3_0,
      ADR2 => dec_val_flag_0,
      ADR4 => index_2_Decoder_32_OUT_5_Q,
      O => memory_reg_5_3_memory_reg_5_3_mux_92_OUT_2_Q
    );
  memory_reg_5_1 : X_FF
    generic map(
      LOC => "SLICE_X77Y109",
      INIT => '0'
    )
    port map (
      CE => Q_n0378_inv,
      CLK => NlwBufferSignal_memory_reg_5_1_CLK,
      I => memory_reg_5_3_memory_reg_5_3_mux_92_OUT_1_Q,
      O => memory_reg_5(1),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1181 : X_LUT6
    generic map(
      LOC => "SLICE_X77Y109",
      INIT => X"FF80FF007F00FF00"
    )
    port map (
      ADR3 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1101_1163,
      ADR1 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd3_1088,
      ADR4 => curr_state_FSM_FFd2_1087,
      ADR2 => index_2_Decoder_32_OUT_5_Q,
      ADR5 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1102,
      O => memory_reg_5_3_memory_reg_5_3_mux_92_OUT_1_Q
    );
  memory_reg_5_0 : X_FF
    generic map(
      LOC => "SLICE_X77Y109",
      INIT => '0'
    )
    port map (
      CE => Q_n0378_inv,
      CLK => NlwBufferSignal_memory_reg_5_0_CLK,
      I => NlwBufferSignal_memory_reg_5_0_IN,
      O => memory_reg_5(0),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT11211 : X_LUT6
    generic map(
      LOC => "SLICE_X77Y109",
      INIT => X"00FF00FFF0000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR3 => Madd_index_2_GND_6_o_add_31_OUT_cy_0_0,
      ADR5 => Madd_index_2_GND_6_o_add_31_OUT_lut_3_0,
      ADR4 => Madd_index_2_GND_6_o_add_31_OUT_lut_1_0,
      ADR2 => Madd_index_2_GND_6_o_add_31_OUT_lut_2_0,
      O => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1121_1090
    );
  Madd_index_2_GND_6_o_add_31_OUT_lut_3_Madd_index_2_GND_6_o_add_31_OUT_lut_3_CMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Madd_index_2_GND_6_o_add_31_OUT_lut_3_Q,
      O => Madd_index_2_GND_6_o_add_31_OUT_lut_3_0
    );
  Madd_index_2_GND_6_o_add_31_OUT_lut_3_Madd_index_2_GND_6_o_add_31_OUT_lut_3_BMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_2(0),
      O => memory_reg_2_0_0
    );
  mux3_2_f7 : X_MUX2
    generic map(
      LOC => "SLICE_X76Y112"
    )
    port map (
      IA => mux3_4_735,
      IB => mux3_3_742,
      O => Madd_index_2_GND_6_o_add_31_OUT_lut_3_Q,
      SEL => index(2)
    );
  mux3_4 : X_LUT6
    generic map(
      LOC => "SLICE_X76Y112",
      INIT => X"CCFFAAF0CC00AAF0"
    )
    port map (
      ADR3 => index(1),
      ADR4 => index(0),
      ADR0 => memory_reg_2(3),
      ADR1 => memory_reg_3(3),
      ADR5 => memory_reg_1(3),
      ADR2 => memory_reg_0(3),
      O => mux3_4_735
    );
  mux3_3 : X_LUT6
    generic map(
      LOC => "SLICE_X76Y112",
      INIT => X"EE44EE44FAFA5050"
    )
    port map (
      ADR0 => index(1),
      ADR5 => index(0),
      ADR4 => memory_reg_6(3),
      ADR3 => memory_reg_7(3),
      ADR1 => memory_reg_5(3),
      ADR2 => memory_reg_4(3),
      O => mux3_3_742
    );
  memory_reg_2_0 : X_FF
    generic map(
      LOC => "SLICE_X76Y112",
      INIT => '0'
    )
    port map (
      CE => Q_n0330_inv,
      CLK => NlwBufferSignal_memory_reg_2_0_CLK,
      I => NlwBufferSignal_memory_reg_2_0_IN,
      O => memory_reg_2(0),
      RST => rst_IBUF_1081,
      SET => GND
    );
  memory_reg_3_1_memory_reg_3_1_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1102_pack_1,
      O => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1102
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT11011 : X_LUT6
    generic map(
      LOC => "SLICE_X77Y108",
      INIT => X"5555AA0A5555AA0A"
    )
    port map (
      ADR1 => '1',
      ADR0 => Madd_index_2_GND_6_o_add_31_OUT_cy_0_0,
      ADR4 => Madd_index_2_GND_6_o_add_31_OUT_lut_1_0,
      ADR3 => Madd_index_2_GND_6_o_add_31_OUT_lut_2_0,
      ADR2 => Madd_index_2_GND_6_o_add_31_OUT_lut_3_0,
      ADR5 => '1',
      O => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1101_1163
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT11021 : X_LUT5
    generic map(
      LOC => "SLICE_X77Y108",
      INIT => X"AAAA5550"
    )
    port map (
      ADR1 => '1',
      ADR0 => Madd_index_2_GND_6_o_add_31_OUT_cy_0_0,
      ADR4 => Madd_index_2_GND_6_o_add_31_OUT_lut_1_0,
      ADR3 => Madd_index_2_GND_6_o_add_31_OUT_lut_2_0,
      ADR2 => Madd_index_2_GND_6_o_add_31_OUT_lut_3_0,
      O => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1102_pack_1
    );
  memory_reg_3_1 : X_FF
    generic map(
      LOC => "SLICE_X77Y108",
      INIT => '0'
    )
    port map (
      CE => Q_n0346_inv_0,
      CLK => NlwBufferSignal_memory_reg_3_1_CLK,
      I => memory_reg_3_3_memory_reg_3_3_mux_90_OUT_1_Q,
      O => memory_reg_3(1),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1101 : X_LUT6
    generic map(
      LOC => "SLICE_X77Y108",
      INIT => X"FFFF80007FFF0000"
    )
    port map (
      ADR4 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1101_1163,
      ADR0 => curr_state_FSM_FFd4_1083,
      ADR1 => curr_state_FSM_FFd3_1088,
      ADR3 => curr_state_FSM_FFd2_1087,
      ADR2 => index_2_Decoder_32_OUT_3_Q,
      ADR5 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1102,
      O => memory_reg_3_3_memory_reg_3_3_mux_90_OUT_1_Q
    );
  memory_reg_7_3 : X_FF
    generic map(
      LOC => "SLICE_X77Y107",
      INIT => '0'
    )
    port map (
      CE => Q_n0410_inv,
      CLK => NlwBufferSignal_memory_reg_7_3_CLK,
      I => memory_reg_7_3_memory_reg_7_3_mux_94_OUT_3_Q,
      O => memory_reg_7(3),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1281 : X_LUT6
    generic map(
      LOC => "SLICE_X77Y107",
      INIT => X"FFFFFFFFCFC00F00"
    )
    port map (
      ADR0 => '1',
      ADR3 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1121_1090,
      ADR2 => index_2_Decoder_32_OUT_7_Q,
      ADR1 => dec_val_flag_0,
      ADR4 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1122,
      ADR5 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1123,
      O => memory_reg_7_3_memory_reg_7_3_mux_94_OUT_3_Q
    );
  memory_reg_7_2 : X_FF
    generic map(
      LOC => "SLICE_X77Y107",
      INIT => '0'
    )
    port map (
      CE => Q_n0410_inv,
      CLK => NlwBufferSignal_memory_reg_7_2_CLK,
      I => memory_reg_7_3_memory_reg_7_3_mux_94_OUT_2_Q,
      O => memory_reg_7(2),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1271 : X_LUT6
    generic map(
      LOC => "SLICE_X77Y107",
      INIT => X"F30CCF2033CCFF00"
    )
    port map (
      ADR4 => Madd_index_2_GND_6_o_add_31_OUT_cy_0_0,
      ADR1 => Madd_index_2_GND_6_o_add_31_OUT_lut_1_0,
      ADR3 => Madd_index_2_GND_6_o_add_31_OUT_lut_2_0,
      ADR0 => Madd_index_2_GND_6_o_add_31_OUT_lut_3_0,
      ADR2 => dec_val_flag_0,
      ADR5 => index_2_Decoder_32_OUT_7_Q,
      O => memory_reg_7_3_memory_reg_7_3_mux_94_OUT_2_Q
    );
  memory_reg_7_1 : X_FF
    generic map(
      LOC => "SLICE_X77Y107",
      INIT => '0'
    )
    port map (
      CE => Q_n0410_inv,
      CLK => NlwBufferSignal_memory_reg_7_1_CLK,
      I => memory_reg_7_3_memory_reg_7_3_mux_94_OUT_1_Q,
      O => memory_reg_7(1),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1261 : X_LUT6
    generic map(
      LOC => "SLICE_X77Y107",
      INIT => X"FFFF80007FFF0000"
    )
    port map (
      ADR4 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1101_1163,
      ADR1 => curr_state_FSM_FFd4_1083,
      ADR2 => curr_state_FSM_FFd3_1088,
      ADR0 => curr_state_FSM_FFd2_1087,
      ADR3 => index_2_Decoder_32_OUT_7_Q,
      ADR5 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1102,
      O => memory_reg_7_3_memory_reg_7_3_mux_94_OUT_1_Q
    );
  memory_reg_7_0 : X_FF
    generic map(
      LOC => "SLICE_X77Y107",
      INIT => '0'
    )
    port map (
      CE => Q_n0410_inv,
      CLK => NlwBufferSignal_memory_reg_7_0_CLK,
      I => NlwBufferSignal_memory_reg_7_0_IN,
      O => memory_reg_7(0),
      RST => rst_IBUF_1081,
      SET => GND
    );
  memory_reg_1_2_memory_reg_1_2_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => index_2_Decoder_32_OUT_0_Q,
      O => index_2_Decoder_32_OUT_0_0
    );
  index_2_Decoder_32_OUT_1_2_1 : X_LUT6
    generic map(
      LOC => "SLICE_X77Y105",
      INIT => X"00000C0C00000C0C"
    )
    port map (
      ADR0 => '1',
      ADR3 => '1',
      ADR1 => index(0),
      ADR2 => index(2),
      ADR4 => index(1),
      ADR5 => '1',
      O => index_2_Decoder_32_OUT_1_Q
    );
  index_2_Decoder_32_OUT_0_2_1 : X_LUT5
    generic map(
      LOC => "SLICE_X77Y105",
      INIT => X"00000303"
    )
    port map (
      ADR0 => '1',
      ADR3 => '1',
      ADR1 => index(0),
      ADR2 => index(2),
      ADR4 => index(1),
      O => index_2_Decoder_32_OUT_0_Q
    );
  memory_reg_1_2 : X_FF
    generic map(
      LOC => "SLICE_X77Y105",
      INIT => '0'
    )
    port map (
      CE => Q_n0314_inv,
      CLK => NlwBufferSignal_memory_reg_1_2_CLK,
      I => memory_reg_1_3_memory_reg_1_3_mux_88_OUT_2_Q,
      O => memory_reg_1(2),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT131 : X_LUT6
    generic map(
      LOC => "SLICE_X77Y105",
      INIT => X"F30C33CCCF20FF00"
    )
    port map (
      ADR1 => Madd_index_2_GND_6_o_add_31_OUT_cy_0_0,
      ADR5 => Madd_index_2_GND_6_o_add_31_OUT_lut_1_0,
      ADR3 => Madd_index_2_GND_6_o_add_31_OUT_lut_2_0,
      ADR0 => Madd_index_2_GND_6_o_add_31_OUT_lut_3_0,
      ADR2 => dec_val_flag_0,
      ADR4 => index_2_Decoder_32_OUT_1_Q,
      O => memory_reg_1_3_memory_reg_1_3_mux_88_OUT_2_Q
    );
  memory_reg_1_1 : X_FF
    generic map(
      LOC => "SLICE_X77Y105",
      INIT => '0'
    )
    port map (
      CE => Q_n0314_inv,
      CLK => NlwBufferSignal_memory_reg_1_1_CLK,
      I => memory_reg_1_3_memory_reg_1_3_mux_88_OUT_1_Q,
      O => memory_reg_1(1),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT121 : X_LUT6
    generic map(
      LOC => "SLICE_X77Y105",
      INIT => X"FFFF80007FFF0000"
    )
    port map (
      ADR4 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1101_1163,
      ADR2 => curr_state_FSM_FFd4_1083,
      ADR1 => curr_state_FSM_FFd3_1088,
      ADR3 => curr_state_FSM_FFd2_1087,
      ADR0 => index_2_Decoder_32_OUT_1_Q,
      ADR5 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1102,
      O => memory_reg_1_3_memory_reg_1_3_mux_88_OUT_1_Q
    );
  memory_reg_1_0 : X_FF
    generic map(
      LOC => "SLICE_X77Y105",
      INIT => '0'
    )
    port map (
      CE => Q_n0314_inv,
      CLK => NlwBufferSignal_memory_reg_1_0_CLK,
      I => NlwBufferSignal_memory_reg_1_0_IN,
      O => memory_reg_1(0),
      RST => rst_IBUF_1081,
      SET => GND
    );
  memory_reg_2_3 : X_FF
    generic map(
      LOC => "SLICE_X77Y110",
      INIT => '0'
    )
    port map (
      CE => Q_n0330_inv,
      CLK => NlwBufferSignal_memory_reg_2_3_CLK,
      I => memory_reg_2_3_memory_reg_2_3_mux_89_OUT_3_Q,
      O => memory_reg_2(3),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT181 : X_LUT6
    generic map(
      LOC => "SLICE_X77Y110",
      INIT => X"FFFFFFFFF333C000"
    )
    port map (
      ADR0 => '1',
      ADR4 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1121_1090,
      ADR1 => index_2_Decoder_32_OUT_2_0,
      ADR3 => dec_val_flag_0,
      ADR2 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1122,
      ADR5 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1123,
      O => memory_reg_2_3_memory_reg_2_3_mux_89_OUT_3_Q
    );
  memory_reg_2_2 : X_FF
    generic map(
      LOC => "SLICE_X77Y110",
      INIT => '0'
    )
    port map (
      CE => Q_n0330_inv,
      CLK => NlwBufferSignal_memory_reg_2_2_CLK,
      I => memory_reg_2_3_memory_reg_2_3_mux_89_OUT_2_Q,
      O => memory_reg_2(2),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT171 : X_LUT6
    generic map(
      LOC => "SLICE_X77Y110",
      INIT => X"F03CC2F03C3CF0F0"
    )
    port map (
      ADR1 => Madd_index_2_GND_6_o_add_31_OUT_cy_0_0,
      ADR4 => Madd_index_2_GND_6_o_add_31_OUT_lut_1_0,
      ADR2 => Madd_index_2_GND_6_o_add_31_OUT_lut_2_0,
      ADR0 => Madd_index_2_GND_6_o_add_31_OUT_lut_3_0,
      ADR5 => dec_val_flag_0,
      ADR3 => index_2_Decoder_32_OUT_2_0,
      O => memory_reg_2_3_memory_reg_2_3_mux_89_OUT_2_Q
    );
  memory_reg_2_1 : X_FF
    generic map(
      LOC => "SLICE_X77Y110",
      INIT => '0'
    )
    port map (
      CE => Q_n0330_inv,
      CLK => NlwBufferSignal_memory_reg_2_1_CLK,
      I => memory_reg_2_3_memory_reg_2_3_mux_89_OUT_1_Q,
      O => memory_reg_2(1),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT161 : X_LUT6
    generic map(
      LOC => "SLICE_X77Y110",
      INIT => X"FFFF7FFF80000000"
    )
    port map (
      ADR5 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1101_1163,
      ADR1 => curr_state_FSM_FFd4_1083,
      ADR0 => curr_state_FSM_FFd3_1088,
      ADR3 => curr_state_FSM_FFd2_1087,
      ADR2 => index_2_Decoder_32_OUT_2_0,
      ADR4 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1102,
      O => memory_reg_2_3_memory_reg_2_3_mux_89_OUT_1_Q
    );
  Q_n0330_inv_n0330_inv_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Q_n0346_inv,
      O => Q_n0346_inv_0
    );
  Q_n0330_inv1 : X_LUT6
    generic map(
      LOC => "SLICE_X76Y110",
      INIT => X"0400000004000000"
    )
    port map (
      ADR2 => index(2),
      ADR0 => index(0),
      ADR1 => index(1),
      ADR3 => curr_state_FSM_FFd3_1088,
      ADR4 => curr_state_FSM_FFd2_1087,
      ADR5 => '1',
      O => Q_n0330_inv
    );
  Q_n0346_inv1 : X_LUT5
    generic map(
      LOC => "SLICE_X76Y110",
      INIT => X"08000000"
    )
    port map (
      ADR2 => index(2),
      ADR0 => index(0),
      ADR1 => index(1),
      ADR3 => curr_state_FSM_FFd3_1088,
      ADR4 => curr_state_FSM_FFd2_1087,
      O => Q_n0346_inv
    );
  memory_reg_3_3_memory_reg_3_3_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1123_pack_9,
      O => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1123
    );
  memory_reg_3_3_memory_reg_3_3_BMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => index_2_Decoder_32_OUT_2_Q,
      O => index_2_Decoder_32_OUT_2_0
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT11221 : X_LUT6
    generic map(
      LOC => "SLICE_X76Y111",
      INIT => X"FA00FA05FA00FA05"
    )
    port map (
      ADR1 => '1',
      ADR3 => Madd_index_2_GND_6_o_add_31_OUT_lut_3_0,
      ADR2 => Madd_index_2_GND_6_o_add_31_OUT_lut_2_0,
      ADR0 => Madd_index_2_GND_6_o_add_31_OUT_cy_0_0,
      ADR4 => Madd_index_2_GND_6_o_add_31_OUT_lut_1_0,
      ADR5 => '1',
      O => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1122
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT11231 : X_LUT5
    generic map(
      LOC => "SLICE_X76Y111",
      INIT => X"1F20F100"
    )
    port map (
      ADR1 => dec_val_flag_0,
      ADR3 => Madd_index_2_GND_6_o_add_31_OUT_lut_3_0,
      ADR2 => Madd_index_2_GND_6_o_add_31_OUT_lut_2_0,
      ADR0 => Madd_index_2_GND_6_o_add_31_OUT_cy_0_0,
      ADR4 => Madd_index_2_GND_6_o_add_31_OUT_lut_1_0,
      O => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1123_pack_9
    );
  memory_reg_3_3 : X_FF
    generic map(
      LOC => "SLICE_X76Y111",
      INIT => '0'
    )
    port map (
      CE => Q_n0346_inv_0,
      CLK => NlwBufferSignal_memory_reg_3_3_CLK,
      I => memory_reg_3_3_memory_reg_3_3_mux_90_OUT_3_Q,
      O => memory_reg_3(3),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1121 : X_LUT6
    generic map(
      LOC => "SLICE_X76Y111",
      INIT => X"FFFFF3C0FFFF3300"
    )
    port map (
      ADR0 => '1',
      ADR3 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1121_1090,
      ADR1 => index_2_Decoder_32_OUT_3_Q,
      ADR2 => dec_val_flag_0,
      ADR5 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1122,
      ADR4 => Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1123,
      O => memory_reg_3_3_memory_reg_3_3_mux_90_OUT_3_Q
    );
  index_2_Decoder_32_OUT_3_2_1 : X_LUT6
    generic map(
      LOC => "SLICE_X76Y111",
      INIT => X"0000888800008888"
    )
    port map (
      ADR2 => '1',
      ADR3 => '1',
      ADR0 => index(0),
      ADR1 => index(1),
      ADR4 => index(2),
      ADR5 => '1',
      O => index_2_Decoder_32_OUT_3_Q
    );
  index_2_Decoder_32_OUT_2_2_1 : X_LUT5
    generic map(
      LOC => "SLICE_X76Y111",
      INIT => X"00004444"
    )
    port map (
      ADR2 => '1',
      ADR3 => '1',
      ADR0 => index(0),
      ADR1 => index(1),
      ADR4 => index(2),
      O => index_2_Decoder_32_OUT_2_Q
    );
  memory_reg_3_2 : X_FF
    generic map(
      LOC => "SLICE_X76Y111",
      INIT => '0'
    )
    port map (
      CE => Q_n0346_inv_0,
      CLK => NlwBufferSignal_memory_reg_3_2_CLK,
      I => memory_reg_3_3_memory_reg_3_3_mux_90_OUT_2_Q,
      O => memory_reg_3(2),
      RST => rst_IBUF_1081,
      SET => GND
    );
  Mmux_memory_reg_0_3_memory_reg_0_3_mux_87_OUT1111 : X_LUT6
    generic map(
      LOC => "SLICE_X76Y111",
      INIT => X"E1787878E0787878"
    )
    port map (
      ADR1 => Madd_index_2_GND_6_o_add_31_OUT_cy_0_0,
      ADR0 => Madd_index_2_GND_6_o_add_31_OUT_lut_1_0,
      ADR2 => Madd_index_2_GND_6_o_add_31_OUT_lut_2_0,
      ADR5 => Madd_index_2_GND_6_o_add_31_OUT_lut_3_0,
      ADR4 => dec_val_flag_0,
      ADR3 => index_2_Decoder_32_OUT_3_Q,
      O => memory_reg_3_3_memory_reg_3_3_mux_90_OUT_2_Q
    );
  NlwBufferBlock_index_19_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_19_CLK
    );
  NlwBufferBlock_index_18_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_18_CLK
    );
  NlwBufferBlock_index_17_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_17_CLK
    );
  NlwBufferBlock_index_16_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_16_CLK
    );
  NlwBufferBlock_index_27_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_27_CLK
    );
  NlwBufferBlock_index_26_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_26_CLK
    );
  NlwBufferBlock_index_25_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_25_CLK
    );
  NlwBufferBlock_index_24_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_24_CLK
    );
  NlwBufferBlock_index_23_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_23_CLK
    );
  NlwBufferBlock_index_22_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_22_CLK
    );
  NlwBufferBlock_index_21_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_21_CLK
    );
  NlwBufferBlock_index_20_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_20_CLK
    );
  NlwBufferBlock_index_15_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_15_CLK
    );
  NlwBufferBlock_index_14_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_14_CLK
    );
  NlwBufferBlock_index_13_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_13_CLK
    );
  NlwBufferBlock_index_12_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_12_CLK
    );
  NlwBufferBlock_index_11_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_11_CLK
    );
  NlwBufferBlock_index_10_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_10_CLK
    );
  NlwBufferBlock_index_9_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_9_CLK
    );
  NlwBufferBlock_index_8_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_8_CLK
    );
  NlwBufferBlock_data_out_10_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_2(2),
      O => NlwBufferSignal_data_out_10_OBUF_I
    );
  NlwBufferBlock_index_30_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_30_CLK
    );
  NlwBufferBlock_index_29_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_29_CLK
    );
  NlwBufferBlock_index_28_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_28_CLK
    );
  NlwBufferBlock_cntr_en_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => cntr_en_OBUF_1166,
      O => NlwBufferSignal_cntr_en_OBUF_I
    );
  NlwBufferBlock_data_out_11_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_2(3),
      O => NlwBufferSignal_data_out_11_OBUF_I
    );
  NlwBufferBlock_cntr_rst_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => cntr_rst_OBUF_1101,
      O => NlwBufferSignal_cntr_rst_OBUF_I
    );
  NlwBufferBlock_edit_en_out_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => edit_en_out_OBUF_1082,
      O => NlwBufferSignal_edit_en_out_OBUF_I
    );
  NlwBufferBlock_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_DI_2_Q : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => index(25),
      O => NlwBufferSignal_Mcompar_index_31_GND_6_o_LessThan_100_o_cy_6_DI_2_Q
    );
  NlwBufferBlock_data_out_12_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_3(0),
      O => NlwBufferSignal_data_out_12_OBUF_I
    );
  NlwBufferBlock_data_out_13_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_3(1),
      O => NlwBufferSignal_data_out_13_OBUF_I
    );
  NlwBufferBlock_data_out_20_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_5(0),
      O => NlwBufferSignal_data_out_20_OBUF_I
    );
  NlwBufferBlock_data_out_0_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_0(0),
      O => NlwBufferSignal_data_out_0_OBUF_I
    );
  NlwBufferBlock_data_out_4_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_1(0),
      O => NlwBufferSignal_data_out_4_OBUF_I
    );
  NlwBufferBlock_data_out_30_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_7(2),
      O => NlwBufferSignal_data_out_30_OBUF_I
    );
  NlwBufferBlock_data_out_2_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_0(2),
      O => NlwBufferSignal_data_out_2_OBUF_I
    );
  NlwBufferBlock_data_out_16_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_4(0),
      O => NlwBufferSignal_data_out_16_OBUF_I
    );
  NlwBufferBlock_data_out_18_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_4(2),
      O => NlwBufferSignal_data_out_18_OBUF_I
    );
  NlwBufferBlock_data_out_22_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_5(2),
      O => NlwBufferSignal_data_out_22_OBUF_I
    );
  NlwBufferBlock_data_out_15_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_3(3),
      O => NlwBufferSignal_data_out_15_OBUF_I
    );
  NlwBufferBlock_data_out_1_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_0(1),
      O => NlwBufferSignal_data_out_1_OBUF_I
    );
  NlwBufferBlock_data_out_31_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_7(3),
      O => NlwBufferSignal_data_out_31_OBUF_I
    );
  NlwBufferBlock_data_out_3_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_0(3),
      O => NlwBufferSignal_data_out_3_OBUF_I
    );
  NlwBufferBlock_data_out_25_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_6(1),
      O => NlwBufferSignal_data_out_25_OBUF_I
    );
  NlwBufferBlock_data_out_21_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_5(1),
      O => NlwBufferSignal_data_out_21_OBUF_I
    );
  NlwBufferBlock_data_out_17_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_4(1),
      O => NlwBufferSignal_data_out_17_OBUF_I
    );
  NlwBufferBlock_data_out_26_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_6(2),
      O => NlwBufferSignal_data_out_26_OBUF_I
    );
  NlwBufferBlock_data_out_6_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_1(2),
      O => NlwBufferSignal_data_out_6_OBUF_I
    );
  NlwBufferBlock_data_out_19_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_4(3),
      O => NlwBufferSignal_data_out_19_OBUF_I
    );
  NlwBufferBlock_data_out_24_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_6(0),
      O => NlwBufferSignal_data_out_24_OBUF_I
    );
  NlwBufferBlock_data_out_23_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_5(3),
      O => NlwBufferSignal_data_out_23_OBUF_I
    );
  NlwBufferBlock_data_out_14_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_3(2),
      O => NlwBufferSignal_data_out_14_OBUF_I
    );
  NlwBufferBlock_data_out_5_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_1(1),
      O => NlwBufferSignal_data_out_5_OBUF_I
    );
  NlwBufferBlock_data_out_7_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_1(3),
      O => NlwBufferSignal_data_out_7_OBUF_I
    );
  NlwBufferBlock_data_out_28_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_7(0),
      O => NlwBufferSignal_data_out_28_OBUF_I
    );
  NlwBufferBlock_data_out_27_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_6(3),
      O => NlwBufferSignal_data_out_27_OBUF_I
    );
  NlwBufferBlock_memory_reg_6_3_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_6_3_CLK
    );
  NlwBufferBlock_clk_BUFGP_BUFG_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP_IBUFG_1176,
      O => NlwBufferSignal_clk_BUFGP_BUFG_IN
    );
  NlwBufferBlock_data_out_29_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_7(1),
      O => NlwBufferSignal_data_out_29_OBUF_I
    );
  NlwBufferBlock_data_out_9_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_2(1),
      O => NlwBufferSignal_data_out_9_OBUF_I
    );
  NlwBufferBlock_cntr_load_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => cntr_load_OBUF_0,
      O => NlwBufferSignal_cntr_load_OBUF_I
    );
  NlwBufferBlock_memory_reg_4_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_4_1_CLK
    );
  NlwBufferBlock_data_out_8_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_2_0_0,
      O => NlwBufferSignal_data_out_8_OBUF_I
    );
  NlwBufferBlock_memory_reg_6_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_6_0_CLK
    );
  NlwBufferBlock_memory_reg_6_0_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_0_3_memory_reg_0_3_mux_87_OUT_0_Q,
      O => NlwBufferSignal_memory_reg_6_0_IN
    );
  NlwBufferBlock_memory_reg_1_3_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_1_3_CLK
    );
  NlwBufferBlock_memory_reg_4_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_4_2_CLK
    );
  NlwBufferBlock_memory_reg_4_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_4_0_CLK
    );
  NlwBufferBlock_memory_reg_6_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_6_2_CLK
    );
  NlwBufferBlock_memory_reg_6_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_6_1_CLK
    );
  NlwBufferBlock_memory_reg_0_3_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_0_3_CLK
    );
  NlwBufferBlock_memory_reg_0_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_0_2_CLK
    );
  NlwBufferBlock_memory_reg_0_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_0_1_CLK
    );
  NlwBufferBlock_memory_reg_0_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_0_0_CLK
    );
  NlwBufferBlock_memory_reg_0_0_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_0_3_memory_reg_0_3_mux_87_OUT_0_Q,
      O => NlwBufferSignal_memory_reg_0_0_IN
    );
  NlwBufferBlock_curr_state_FSM_FFd3_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_curr_state_FSM_FFd3_CLK
    );
  NlwBufferBlock_curr_state_FSM_FFd2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_curr_state_FSM_FFd2_CLK
    );
  NlwBufferBlock_cntr_en_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_cntr_en_CLK
    );
  NlwBufferBlock_curr_state_FSM_FFd1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_curr_state_FSM_FFd1_CLK
    );
  NlwBufferBlock_curr_state_FSM_FFd4_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_curr_state_FSM_FFd4_CLK
    );
  NlwBufferBlock_edit_en_out_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_edit_en_out_CLK
    );
  NlwBufferBlock_edit_en_out_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => curr_state_FSM_FFd4_1083,
      O => NlwBufferSignal_edit_en_out_IN
    );
  NlwBufferBlock_index_3_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_3_CLK
    );
  NlwBufferBlock_index_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_2_CLK
    );
  NlwBufferBlock_index_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_1_CLK
    );
  NlwBufferBlock_index_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_0_CLK
    );
  NlwBufferBlock_index_7_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_7_CLK
    );
  NlwBufferBlock_index_6_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_6_CLK
    );
  NlwBufferBlock_index_5_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_5_CLK
    );
  NlwBufferBlock_index_4_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_index_4_CLK
    );
  NlwBufferBlock_memory_reg_4_3_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_4_3_CLK
    );
  NlwBufferBlock_memory_reg_3_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_3_0_CLK
    );
  NlwBufferBlock_memory_reg_3_0_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_0_3_memory_reg_0_3_mux_87_OUT_0_Q,
      O => NlwBufferSignal_memory_reg_3_0_IN
    );
  NlwBufferBlock_memory_reg_5_3_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_5_3_CLK
    );
  NlwBufferBlock_memory_reg_5_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_5_2_CLK
    );
  NlwBufferBlock_memory_reg_5_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_5_1_CLK
    );
  NlwBufferBlock_memory_reg_5_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_5_0_CLK
    );
  NlwBufferBlock_memory_reg_5_0_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_0_3_memory_reg_0_3_mux_87_OUT_0_Q,
      O => NlwBufferSignal_memory_reg_5_0_IN
    );
  NlwBufferBlock_memory_reg_2_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_2_0_CLK
    );
  NlwBufferBlock_memory_reg_2_0_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_0_3_memory_reg_0_3_mux_87_OUT_0_Q,
      O => NlwBufferSignal_memory_reg_2_0_IN
    );
  NlwBufferBlock_memory_reg_3_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_3_1_CLK
    );
  NlwBufferBlock_memory_reg_7_3_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_7_3_CLK
    );
  NlwBufferBlock_memory_reg_7_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_7_2_CLK
    );
  NlwBufferBlock_memory_reg_7_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_7_1_CLK
    );
  NlwBufferBlock_memory_reg_7_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_7_0_CLK
    );
  NlwBufferBlock_memory_reg_7_0_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_0_3_memory_reg_0_3_mux_87_OUT_0_Q,
      O => NlwBufferSignal_memory_reg_7_0_IN
    );
  NlwBufferBlock_memory_reg_1_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_1_2_CLK
    );
  NlwBufferBlock_memory_reg_1_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_1_1_CLK
    );
  NlwBufferBlock_memory_reg_1_0_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_1_0_CLK
    );
  NlwBufferBlock_memory_reg_1_0_IN : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => memory_reg_0_3_memory_reg_0_3_mux_87_OUT_0_Q,
      O => NlwBufferSignal_memory_reg_1_0_IN
    );
  NlwBufferBlock_memory_reg_2_3_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_2_3_CLK
    );
  NlwBufferBlock_memory_reg_2_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_2_2_CLK
    );
  NlwBufferBlock_memory_reg_2_1_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_2_1_CLK
    );
  NlwBufferBlock_memory_reg_3_3_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_3_3_CLK
    );
  NlwBufferBlock_memory_reg_3_2_CLK : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_memory_reg_3_2_CLK
    );
  NlwBlock_key_fsm_c_GND : X_ZERO
    port map (
      O => GND
    );
  NlwBlock_key_fsm_c_VCC : X_ONE
    port map (
      O => VCC
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

