-------------------------------------------------------------------------------
-- Project: Data Logger with Ethernet UDP output
-- Author(s): DFC Design, s.r.o. (www.dfcdesign.cz)
-- E-Mail:  info@dfcdesign.cz
-- Created: Sept 2011   
-- Mod: Jan 2016 by Hus
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--                                                                           --
-- Copyright (C) 2011 Authors                                                --
--                                                                           --
-- This source file may be used and distributed without                      --
-- restriction provided that this copyright statement is not                 --
-- removed from the file and that any derivative work contains               --
-- the original copyright notice and the associated disclaimer.              --
--                                                                           --
-- This source file is free software; you can redistribute it                --
-- and-or modify it under the terms of the GNU Lesser General                --
-- Public License as published by the Free Software Foundation;              --
-- either version 3.0 of the License, or (at your option) any                --
-- later version.                                                            --
--                                                                           --
-- This source is distributed in the hope that it will be                    --
-- useful, but WITHOUT ANY WARRANTY; without even the implied                --
-- warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR                   --
-- PURPOSE.  See the GNU Lesser General Public License for more              --
-- details.                                                                  --
--                                                                           --
-- You should have received a copy of the GNU Lesser General                 --
-- Public License along with this source; If not, see                        --
-- <http://www.gnu.org/licenses/>                                            --
--                                                                           --
------------------------------------------------------------------------------- 


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.pkg_eth.all;

entity headerrom is

	generic 
	(
		DATA_WIDTH : natural := 8;
		ADDR_WIDTH : natural := 8
	);

	port 
	(
		clk		: in std_logic;
		addr	: in natural range 0 to 2**ADDR_WIDTH - 1;
		q		: out std_logic_vector((DATA_WIDTH -1) downto 0)
	);

end entity;

architecture rtl of headerrom is
  constant IP_CRC: std_logic_vector(15 downto 0):= crc_calc;
	subtype word_t is std_logic_vector((DATA_WIDTH-1) downto 0);
	type memory_t is array(0 to 2**ADDR_WIDTH-1) of word_t;

	signal rom : memory_t :=
	(
	-- Preamble + sof delimiter 8 B
   x"55", x"55", x"55", x"55", x"55", x"55", x"55", x"d5",
   
   -- Eth Header 14 B
   MAC_DST(5),MAC_DST(4),MAC_DST(3),MAC_DST(2),MAC_DST(1),MAC_DST(0), -- Destination MAC
   MAC_SRC(5),MAC_SRC(4),MAC_SRC(3),MAC_SRC(2),MAC_SRC(1),MAC_SRC(0), -- Src MAC
   x"08", x"00",  -- Ethertype

   -- IP Header 20 B (if changed, IP chkSum must be recalculated)
   IP_HDR(9), IP_HDR(8), IP_HDR(7), IP_HDR(6), IP_HDR(5), 
   IP_HDR(4), IP_HDR(3), IP_HDR(2), IP_HDR(1), IP_HDR(0), 
   IP_CRC(15 downto 8), IP_CRC(7 downto 0),   -- IP header checksum
   std_logic_vector(to_unsigned(IP_SRC(3),DATA_WIDTH)), -- SRC IP address
   std_logic_vector(to_unsigned(IP_SRC(2),DATA_WIDTH)),
   std_logic_vector(to_unsigned(IP_SRC(1),DATA_WIDTH)),
   std_logic_vector(to_unsigned(IP_SRC(0),DATA_WIDTH)),
   std_logic_vector(to_unsigned(IP_DST(3),DATA_WIDTH)), -- DST IP address
   std_logic_vector(to_unsigned(IP_DST(2),DATA_WIDTH)),
   std_logic_vector(to_unsigned(IP_DST(1),DATA_WIDTH)),
   std_logic_vector(to_unsigned(IP_DST(0),DATA_WIDTH)),

   -- UDP Header 8 B
   UDP_DST(15 downto 8),UDP_DST(7 downto 0),  -- DST Port
   UDP_SRC(15 downto 8),UDP_SRC(7 downto 0),  -- SRC Port
   
   x"05", x"18", -- Lenght
   x"00", x"00", -- UDP Checksum (empty)
   
   -- Our Header 16 B
   x"4d", x"4b", -- ID protocol
   x"ee", x"ee", -- Length
   x"ee", x"ee", x"ee", x"ee", -- ID Packet
   x"ee", x"ee", -- ID Board 59 60
   x"ee", x"ee", x"00", x"00", x"00", x"00", -- Flags 61:66
   
   -- padding 78 B
  x"cc", x"cc", x"cc", x"cc", x"cc", x"cc", x"cc", x"cc", 
  x"cc", x"cc", x"cc", x"cc", x"cc", x"cc", x"cc", x"cc", 
  x"cc", x"cc", x"cc", x"cc", x"cc", x"cc", x"cc", x"cc", 
  x"cc", x"cc", x"cc", x"cc", x"cc", x"cc", x"cc", x"cc",
  x"cc", x"cc", x"cc", x"cc", x"cc", x"cc", x"cc", x"cc", 
  x"cc", x"cc", x"cc", x"cc", x"cc", x"cc", x"cc", x"cc", 
  x"cc", x"cc", x"cc", x"cc", x"cc", x"cc", x"cc", x"cc", 
  x"cc", x"cc", x"cc", x"cc", x"cc", x"cc"

	);

begin

	process(clk)
	begin
	if(rising_edge(clk)) then
      q <= rom(addr);
	end if;
	end process;

end rtl;
