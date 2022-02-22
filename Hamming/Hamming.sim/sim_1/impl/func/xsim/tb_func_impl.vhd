-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
-- Date        : Wed Jan 26 14:36:55 2022
-- Host        : DESKTOP-V200J10 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/Karol/Desktop/ISATC/Hamming/Hamming.sim/sim_1/impl/func/xsim/tb_func_impl.vhd
-- Design      : top
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7s100fgga676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top is
  port (
    s : in STD_LOGIC_VECTOR ( 3 downto 0 );
    d : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of top : entity is true;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of top : entity is "72542ddd";
end top;

architecture STRUCTURE of top is
  signal d_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
\d_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => d_OBUF(0),
      O => d(0)
    );
\d_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => d_OBUF(1),
      O => d(1)
    );
\d_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => d_OBUF(2),
      O => d(2)
    );
\d_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => d_OBUF(3),
      O => d(3)
    );
\s_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => s(0),
      O => d_OBUF(0)
    );
\s_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => s(1),
      O => d_OBUF(1)
    );
\s_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => s(2),
      O => d_OBUF(2)
    );
\s_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => s(3),
      O => d_OBUF(3)
    );
end STRUCTURE;
