-------------------------------------------------------------------------------
-- Project: ---
-- Author(s): HusTakocem
-- Created: Dec 2015 
-------------------------------------------------------------------------------
-- 
--

library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;

Package pkg_symuli Is

-- synthesis translate off
----             _____hpulse______
-- ____offset___/                 \___period-hpulse_____/
---
procedure clk_gen (signal s: out std_ulogic; offset,hpulse,period: delay_length );

----_____hpulse______
-- /                 \_____lpulse______/  x number
---
procedure pulse_gen (signal s: out std_ulogic; number: natural; hpulse,lpulse: delay_length);

type eth_type is array (1 to 1350) of std_logic_vector(7 downto 0);
constant ETH_PCKT : eth_type := (
x"55",x"55",x"55",x"55",x"55",x"55",x"55",x"5d",
x"ff",x"ff",x"ff",x"ff",x"ff",x"ff",x"00",x"a0",x"b0",x"c0",x"00",x"01",x"08",x"00",x"45",x"00",
x"05",x"2c",x"61",x"d2",x"00",x"00",x"80",x"11",x"4f",x"7c",x"c0",x"a8",x"01",x"be",x"c0",x"a8",
x"01",x"64",x"20",x"08",x"20",x"08",x"05",x"18",x"00",x"00",x"4b",x"4d",x"00",x"05",x"4a",x"b8",
x"95",x"00",x"14",x"02",x"08",x"05",x"04",x"03",x"02",x"01",x"01",x"03",x"05",x"07",x"09",x"0b",
x"0d",x"0f",x"11",x"13",x"15",x"17",x"19",x"1b",x"1d",x"1f",x"21",x"23",x"25",x"27",x"29",x"2b",
x"2d",x"2f",x"31",x"33",x"35",x"37",x"39",x"3b",x"3d",x"3f",x"41",x"43",x"45",x"47",x"49",x"4b",
x"4d",x"4f",x"51",x"53",x"55",x"57",x"59",x"5b",x"5d",x"5f",x"61",x"63",x"65",x"67",x"69",x"6b",
x"6d",x"6f",x"71",x"73",x"75",x"77",x"79",x"7b",x"7d",x"7f",x"81",x"83",x"85",x"87",x"89",x"8b",
x"8d",x"8f",x"91",x"93",x"95",x"97",x"99",x"9b",x"9d",x"9f",x"a1",x"a3",x"a5",x"a7",x"a9",x"ab",
x"ad",x"af",x"b1",x"b3",x"b5",x"b7",x"b9",x"bb",x"bd",x"bf",x"c1",x"c3",x"c5",x"c7",x"c9",x"cb",
x"cd",x"cf",x"d1",x"d3",x"d5",x"d7",x"d9",x"db",x"dd",x"df",x"e1",x"e3",x"e5",x"e7",x"e9",x"eb",
x"ed",x"ef",x"f1",x"f3",x"f5",x"f7",x"f9",x"fb",x"fd",x"ff",x"01",x"03",x"05",x"07",x"09",x"0b",
x"0d",x"0f",x"11",x"13",x"15",x"17",x"19",x"1b",x"1d",x"1f",x"21",x"23",x"25",x"27",x"29",x"2b",
x"2d",x"2f",x"31",x"33",x"35",x"37",x"39",x"3b",x"3d",x"3f",x"41",x"43",x"45",x"47",x"49",x"4b",
x"4d",x"4f",x"51",x"53",x"55",x"57",x"59",x"5b",x"5d",x"5f",x"61",x"63",x"65",x"67",x"69",x"6b",
x"6d",x"6f",x"71",x"73",x"75",x"77",x"79",x"7b",x"7d",x"7f",x"81",x"83",x"85",x"87",x"89",x"8b",
x"8d",x"8f",x"91",x"93",x"95",x"97",x"99",x"9b",x"9d",x"9f",x"a1",x"a3",x"a5",x"a7",x"a9",x"ab",
x"ad",x"af",x"b1",x"b3",x"b5",x"b7",x"b9",x"bb",x"bd",x"bf",x"c1",x"c3",x"c5",x"c7",x"c9",x"cb",
x"cd",x"cf",x"d1",x"d3",x"d5",x"d7",x"d9",x"db",x"dd",x"df",x"e1",x"e3",x"e5",x"e7",x"e9",x"eb",
x"ed",x"ef",x"f1",x"f3",x"f5",x"f7",x"f9",x"fb",x"fd",x"ff",x"01",x"03",x"05",x"07",x"09",x"0b",
x"0d",x"0f",x"11",x"13",x"15",x"17",x"19",x"1b",x"1d",x"1f",x"21",x"23",x"25",x"27",x"29",x"2b",
x"2d",x"2f",x"31",x"33",x"35",x"37",x"39",x"3b",x"3d",x"3f",x"41",x"43",x"45",x"47",x"49",x"4b",
x"4d",x"4f",x"51",x"53",x"55",x"57",x"59",x"5b",x"5d",x"5f",x"61",x"63",x"65",x"67",x"69",x"6b",
x"6d",x"6f",x"71",x"73",x"75",x"77",x"79",x"7b",x"7d",x"7f",x"81",x"83",x"85",x"87",x"89",x"8b",
x"8d",x"8f",x"91",x"93",x"95",x"97",x"99",x"9b",x"9d",x"9f",x"a1",x"a3",x"a5",x"a7",x"a9",x"ab",
x"ad",x"af",x"b1",x"b3",x"b5",x"b7",x"b9",x"bb",x"bd",x"bf",x"c1",x"c3",x"c5",x"c7",x"c9",x"cb",
x"cd",x"cf",x"d1",x"d3",x"d5",x"d7",x"d9",x"db",x"dd",x"df",x"e1",x"e3",x"e5",x"e7",x"e9",x"eb",
x"ed",x"ef",x"f1",x"f3",x"f5",x"f7",x"f9",x"fb",x"fd",x"ff",x"01",x"03",x"05",x"07",x"09",x"0b",
x"0d",x"0f",x"11",x"13",x"15",x"17",x"19",x"1b",x"1d",x"1f",x"21",x"23",x"25",x"27",x"29",x"2b",
x"2d",x"2f",x"31",x"33",x"35",x"37",x"39",x"3b",x"3d",x"3f",x"41",x"43",x"45",x"47",x"49",x"4b",
x"4d",x"4f",x"51",x"53",x"55",x"57",x"59",x"5b",x"5d",x"5f",x"61",x"63",x"65",x"67",x"69",x"6b",
x"6d",x"6f",x"71",x"73",x"75",x"77",x"79",x"7b",x"7d",x"7f",x"81",x"83",x"85",x"87",x"89",x"8b",
x"8d",x"8f",x"91",x"93",x"95",x"97",x"99",x"9b",x"9d",x"9f",x"a1",x"a3",x"a5",x"a7",x"a9",x"ab",
x"ad",x"af",x"b1",x"b3",x"b5",x"b7",x"b9",x"bb",x"bd",x"bf",x"c1",x"c3",x"c5",x"c7",x"c9",x"cb",
x"cd",x"cf",x"d1",x"d3",x"d5",x"d7",x"d9",x"db",x"dd",x"df",x"e1",x"e3",x"e5",x"e7",x"e9",x"eb",
x"ed",x"ef",x"f1",x"f3",x"f5",x"f7",x"f9",x"fb",x"fd",x"ff",x"01",x"03",x"05",x"07",x"09",x"0b",
x"0d",x"0f",x"11",x"13",x"15",x"17",x"19",x"1b",x"1d",x"1f",x"21",x"23",x"25",x"27",x"29",x"2b",
x"2d",x"2f",x"31",x"33",x"35",x"37",x"39",x"3b",x"3d",x"3f",x"41",x"43",x"45",x"47",x"49",x"4b",
x"4d",x"4f",x"51",x"53",x"55",x"57",x"59",x"5b",x"5d",x"5f",x"61",x"63",x"65",x"67",x"69",x"6b",
x"6d",x"6f",x"71",x"73",x"75",x"77",x"79",x"7b",x"7d",x"7f",x"81",x"83",x"85",x"87",x"89",x"8b",
x"8d",x"8f",x"91",x"93",x"95",x"97",x"99",x"9b",x"9d",x"9f",x"a1",x"a3",x"a5",x"a7",x"a9",x"ab",
x"ad",x"af",x"b1",x"b3",x"b5",x"b7",x"b9",x"bb",x"bd",x"bf",x"c1",x"c3",x"c5",x"c7",x"c9",x"cb",
x"cd",x"cf",x"d1",x"d3",x"d5",x"d7",x"d9",x"db",x"dd",x"df",x"e1",x"e3",x"e5",x"e7",x"e9",x"eb",
x"ed",x"ef",x"f1",x"f3",x"f5",x"f7",x"f9",x"fb",x"fd",x"ff",x"01",x"03",x"05",x"07",x"09",x"0b",
x"0d",x"0f",x"11",x"13",x"15",x"17",x"19",x"1b",x"1d",x"1f",x"21",x"23",x"25",x"27",x"29",x"2b",
x"2d",x"2f",x"31",x"33",x"35",x"37",x"39",x"3b",x"3d",x"3f",x"41",x"43",x"45",x"47",x"49",x"4b",
x"4d",x"4f",x"51",x"53",x"55",x"57",x"59",x"5b",x"5d",x"5f",x"61",x"63",x"65",x"67",x"69",x"6b",
x"6d",x"6f",x"71",x"73",x"75",x"77",x"79",x"7b",x"7d",x"7f",x"81",x"83",x"85",x"87",x"89",x"8b",
x"8d",x"8f",x"91",x"93",x"95",x"97",x"99",x"9b",x"9d",x"9f",x"a1",x"a3",x"a5",x"a7",x"a9",x"ab",
x"ad",x"af",x"b1",x"b3",x"b5",x"b7",x"b9",x"bb",x"bd",x"bf",x"c1",x"c3",x"c5",x"c7",x"c9",x"cb",
x"cd",x"cf",x"d1",x"d3",x"d5",x"d7",x"d9",x"db",x"dd",x"df",x"e1",x"e3",x"e5",x"e7",x"e9",x"eb",
x"ed",x"ef",x"f1",x"f3",x"f5",x"f7",x"f9",x"fb",x"fd",x"ff",x"01",x"03",x"05",x"07",x"09",x"0b",
x"0d",x"0f",x"11",x"13",x"15",x"17",x"19",x"1b",x"1d",x"1f",x"21",x"23",x"25",x"27",x"29",x"2b",
x"2d",x"2f",x"31",x"33",x"35",x"37",x"39",x"3b",x"3d",x"3f",x"41",x"43",x"45",x"47",x"49",x"4b",
x"4d",x"4f",x"51",x"53",x"55",x"57",x"59",x"5b",x"5d",x"5f",x"61",x"63",x"65",x"67",x"69",x"6b",
x"6d",x"6f",x"71",x"73",x"75",x"77",x"79",x"7b",x"7d",x"7f",x"81",x"83",x"85",x"87",x"89",x"8b",
x"8d",x"8f",x"91",x"93",x"95",x"97",x"99",x"9b",x"9d",x"9f",x"a1",x"a3",x"a5",x"a7",x"a9",x"ab",
x"ad",x"af",x"b1",x"b3",x"b5",x"b7",x"b9",x"bb",x"bd",x"bf",x"c1",x"c3",x"c5",x"c7",x"c9",x"cb",
x"cd",x"cf",x"d1",x"d3",x"d5",x"d7",x"d9",x"db",x"dd",x"df",x"e1",x"e3",x"e5",x"e7",x"e9",x"eb",
x"ed",x"ef",x"f1",x"f3",x"f5",x"f7",x"f9",x"fb",x"fd",x"ff",x"01",x"03",x"05",x"07",x"09",x"0b",
x"0d",x"0f",x"11",x"13",x"15",x"17",x"19",x"1b",x"1d",x"1f",x"21",x"23",x"25",x"27",x"29",x"2b",
x"2d",x"2f",x"31",x"33",x"35",x"37",x"39",x"3b",x"3d",x"3f",x"41",x"43",x"45",x"47",x"49",x"4b",
x"4d",x"4f",x"51",x"53",x"55",x"57",x"59",x"5b",x"5d",x"5f",x"61",x"63",x"65",x"67",x"69",x"6b",
x"6d",x"6f",x"71",x"73",x"75",x"77",x"79",x"7b",x"7d",x"7f",x"81",x"83",x"85",x"87",x"89",x"8b",
x"8d",x"8f",x"91",x"93",x"95",x"97",x"99",x"9b",x"9d",x"9f",x"a1",x"a3",x"a5",x"a7",x"a9",x"ab",
x"ad",x"af",x"b1",x"b3",x"b5",x"b7",x"b9",x"bb",x"bd",x"bf",x"c1",x"c3",x"c5",x"c7",x"c9",x"cb",
x"cd",x"cf",x"d1",x"d3",x"d5",x"d7",x"d9",x"db",x"dd",x"df",x"e1",x"e3",x"e5",x"e7",x"e9",x"eb",
x"ed",x"ef",x"f1",x"f3",x"f5",x"f7",x"f9",x"fb",x"fd",x"ff",x"01",x"03",x"05",x"07",x"09",x"0b",
x"0d",x"0f",x"11",x"13",x"15",x"17",x"19",x"1b",x"1d",x"1f",x"21",x"23",x"25",x"27",x"29",x"2b",
x"2d",x"2f",x"31",x"33",x"35",x"37",x"39",x"3b",x"3d",x"3f",x"41",x"43",x"45",x"47",x"49",x"4b",
x"4d",x"4f",x"51",x"53",x"55",x"57",x"59",x"5b",x"5d",x"5f",x"61",x"63",x"65",x"67",x"69",x"6b",
x"6d",x"6f",x"71",x"73",x"75",x"77",x"79",x"7b",x"7d",x"7f",x"81",x"83",x"85",x"87",x"89",x"8b",
x"8d",x"8f",x"91",x"93",x"95",x"97",x"99",x"9b",x"9d",x"9f",x"a1",x"a3",x"a5",x"a7",x"a9",x"ab",
x"ad",x"af",x"b1",x"b3",x"b5",x"b7",x"b9",x"bb",x"bd",x"bf",x"c1",x"c3",x"c5",x"c7",x"c9",x"cb",
x"cd",x"cf",x"d1",x"d3",x"d5",x"d7",x"d9",x"db",x"dd",x"df",x"e1",x"e3",x"e5",x"e7",x"e9",x"eb",
x"ed",x"ef",x"f1",x"f3",x"f5",x"f7",x"f9",x"fb",x"fd",x"ff",x"01",x"03",x"05",x"07",x"09",x"0b",
x"0d",x"0f",x"11",x"13",x"15",x"17",x"19",x"1b",x"1d",x"1f",x"21",x"23",x"25",x"27",x"29",x"2b",
x"2d",x"2f",x"31",x"33",x"35",x"37",x"39",x"3b",x"3d",x"3f",x"41",x"43",x"45",x"47",x"49",x"4b",
x"4d",x"4f",x"51",x"53",x"55",x"57",x"59",x"5b",x"5d",x"5f",x"61",x"63",x"65",x"67",x"69",x"6b",
x"6d",x"6f",x"71",x"73",x"75",x"77",x"79",x"7b",x"7d",x"7f",x"81",x"83",x"85",x"87",x"89",x"8b",
x"8d",x"8f",x"91",x"93",x"95",x"97",x"99",x"9b",x"9d",x"9f",x"a1",x"a3",x"a5",x"a7",x"a9",x"ab",
x"ad",x"af",x"b1",x"b3",x"b5",x"b7",x"b9",x"bb",x"bd",x"bf",x"c1",x"c3",x"c5",x"c7",x"c9",x"cb",
x"cd",x"cf",x"d1",x"d3",x"d5",x"d7",x"d9",x"db",x"dd",x"df",x"e1",x"e3",x"e5",x"e7",x"e9",x"eb",
x"ed",x"ef",x"f1",x"f3",x"f5",x"f7",x"f9",x"fb",x"fd",x"ff",
x"0a",x"0a",x"0a",x"0a");

-- synthesis translate on

End Package pkg_symuli;


PACKAGE BODY pkg_symuli IS
-- synthesis translate off
----             _____hpulse______
-- ____offset___/                 \___period-hpulse_____/
---
procedure clk_gen (signal s: out std_ulogic; offset,hpulse,period: delay_length ) is
    begin
      wait for offset;
        loop
            s <= '1', '0' after hpulse;
            wait for period;
        end loop;
    end procedure;

----_____hpulse______
-- /                 \_____lpulse______/  x number
---
procedure pulse_gen (signal s: out std_ulogic; number: natural; hpulse,lpulse: delay_length) is
begin
    for i in 1 to number loop
        s <= '1', '0' after hpulse;
        wait for hpulse + lpulse;
    end loop;
end procedure;    
-- synthesis translate on
end package body pkg_symuli;
---------------------------------------------------------------------------