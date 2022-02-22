-------------------------------------------------------------------------------
  -- Project: Data Logger with Ethernet UDP output
  -- Author(s): DFC Design, s.r.o. (www.dfcdesign.cz)
  -- E-Mail:  info@dfcdesign.cz
  -- Created: Sept 2011   
  --
  -- Mod: Oct 2016 by HusTakocem
  --
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
  --
  -- Description: 
  -- Purpose of this design is to log changes (events) on a group of
  -- inputs (probes) and send data
  -- to PC using a UDP based protocol. 
  --
  -- Main features:
  --
  -- Number of probes: adjustable using "probes_no" generic; 
  --
  -- Sample rate: x MSamples/s
  --
  -- The communication protocol is based on broadcast UDP packets.
  -- Device can transmitt data only, there is no communication
  -- channel in the oposit direction. 
  -- 
  -- Packet structure and format:
  -- Source MAC address of device: MAC_SRC const (M:K:?:1:2:3)
  -- - ? can be set by user (board_id port of udp_pkt_gen_inst)
  -- source IP address: IP_SRC const (192.168.0.1)
  -- 
  -- UDP src and dst port: UDP_SRC, UDP_DST (8200)
  -- 
  -- Format of UDP payload:
  -- Length of data is always 1296 Bytes.
  -- Logger protocol header : 16 Bytes
  -- Logger protocol data length: 1280 Bytes
  -- 
  -- Header:
  -- Protocol ID          16 bits        always 0x4d4b (can be adjusted in 
  --                                     headerrom.vhd)
  -- Valid data length    16 bits        number of bytes of valid 
  --                                     data ( from 0 to Logger 
  --                                     protocol data length)
  -- Packet number        32 bits        number of packet that can 
  --                                     be used to detect lost packets
  -- Board ID             16 bits        borad ID obtained from board_id 
  --                                     signal of udp_pkt_gen_inst                                   
  -- Reserved             48 bits        Reserved for future use and 
  --                                     debugging purposes
  -- Data:
  -- Event record len:   probes_no
  -- Max number of events per packet : 1280/ Event record len
  -- Event records can not be divided between two packets.
  --
  -- Event record:
  --   - standard event record
  --   - consists of "probes_no" bit data 
  --     obtained after change on probes_clk
  -- 
  -- Packet is send if any of these conditions is fulfilled:
  -- - there is max number of events per packed ready to be send
  -- - there is less than max number of events ready, but ext_start is forced 
  -- 
  -- Capturing packets:
  -- To capture packets use UDP_broadcast_receiver_PC
  -- 
  -------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.pkg_eth.all;
use work.pkg_s3_ip.all;

library UNISIM;
use UNISIM.Vcomponents.ALL; 

Entity udp_transmiter_v9 Is
    generic (NO_OF_PROBES: natural := NO_OF_PROBES);
    Port (
     -- CLocks form PLL oscilator
     test_mode : in  std_logic;
     mii_clk_tx  : In  std_logic; -- 
     probes_clk : In std_logic;
     probes_change: In std_logic;
     usr_hdr : in std_logic_vector(63 downto 0);
     event_empty : out std_logic;
     event_almost_empty : out std_logic;
     event_full : out std_logic;
     ext_start : In std_logic;
     sys_rst : In std_logic;
     -- PHY control - reset
     rstn      : Out std_logic;
     -- PHY Tx side
     --tx_clk	   : Out std_logic;
     tx_en		: Out std_logic;
     tx_er		: Out std_logic;
     tx_data	: Out std_logic_vector(7 downto 0);
     -- Input Probes
     inProbes  : In std_logic_vector(NO_OF_PROBES-1 downto 0)
   );
End udp_transmiter_v9;

Architecture arch Of udp_transmiter_v9 Is 
   constant EVENT_NUMBER_WIDTH : positive := 11; -- fifo depth
   constant PROG_FULL_THRESHOLD : std_logic_vector(EVENT_NUMBER_WIDTH-1 downto 0)
      := std_logic_vector(to_unsigned(TRANS_FIFO_FULL,EVENT_NUMBER_WIDTH));
   constant ALMOST_EMPTY_THRESHOLD : std_logic_vector(EVENT_NUMBER_WIDTH-1 downto 0)
      := std_logic_vector(to_unsigned(EVENT_PP,EVENT_NUMBER_WIDTH));

   -- Reset signals
   signal rst         : std_logic;
   signal rst1        : std_logic;
   signal probes_rst  : std_logic;
	 signal rst_tx      : std_logic;
   signal rst_tx_d    : std_logic;
   signal rst_tx_dd   : std_logic;
   signal ext_rst     : std_logic;
   -- Internal signals
	 signal tx_en_i     : std_logic;
   signal tx_en_ii    : std_logic;
	 signal tx_er_i     : std_logic;
	 signal tx_data_i   : std_logic_vector(7 downto 0) := (others => '0');
   signal tx_data_ii  : std_logic_vector(7 downto 0)  := (others => '0');
   signal tx_ready_i  : std_logic;
	
	 signal outs_i	    :std_logic_vector(9 downto 0);
	 signal outs_o, outs_o2	    :std_logic_vector(9 downto 0);
	
	 signal fifo_rdreq  : std_logic;
   signal fifo_data_in: std_logic_vector(7 downto 0);
   signal fifo_rdempty: std_logic;
   signal fifo_data   : std_logic_vector(7 downto 0);
   signal fifo_wrreq  : std_logic;

   -- Event fifo signals
   signal event_fifo_data_in  : std_logic_vector(NO_OF_PROBES-1 downto 0); -- no of probes
   signal event_fifo_data_out : std_logic_vector(NO_OF_PROBES-1 downto 0);
   signal event_fifo_wrreq    : std_logic;
   signal event_fifo_wrfull   : std_logic;
   signal event_fifo_rdreq    : std_logic;
   signal event_fifo_rdempty  : std_logic;
   signal event_fifo_error    : std_logic;
   signal event_fifo_progfull : std_logic;
   signal event_fifo_progfull_1d : std_logic;
   signal event_fifo_rdusedw  : std_logic_vector(EVENT_NUMBER_WIDTH-1 downto 0);
   
   -- Signal triggering event collection
   signal event_trg           : std_logic;
   signal start_pkt_info : std_logic;

   -- Signal triggering the new packet
   signal ext_start_xd      : std_logic := '0';
   signal ext_start_1d      : std_logic := '0';
   signal ext_start_2d      : std_logic := '0';
   signal ext_start_ce      : std_logic := '0';
	 signal pkt_start         : std_logic := '0';
   -- Packet handling signals
   signal pkt_ready         : std_logic := '0';
   signal pkt_data_len      : std_logic_vector(10 downto 0);
   signal pkt_cntr_slv      : std_logic_vector(31 downto 0):=(others=>'0');

Begin

probes_rst <= sys_rst;


-- Resample rst to tx domain
Resample_rst_process: Process(mii_clk_tx)
   Begin
      If mii_clk_tx'Event And mii_clk_tx = '1' Then
         rst_tx_d <= sys_rst;
         rst_tx_dd <= rst_tx_d;
         rst_tx <= rst_tx_dd;
      End If;
   End Process;

event_trg <= probes_change; 

probes2fifo_inst : probes2fifo_noTS
   Generic Map(
      probes_number   => NO_OF_PROBES
              )
   Port Map(
      clk         => probes_clk,
      rst         => probes_rst,
      DataTrg     => event_trg,
      DataIn      => inProbes,
      fifo_data   => event_fifo_data_in,
      fifo_wrreq  => event_fifo_wrreq,
      fifo_wrfull => event_fifo_progfull_1d,--event_fifo_wrfull,
      fifo_err    => event_fifo_error
           );

-- FIFO for events
fifo_gen1: if NO_OF_PROBES=32 generate
  event_fifo32_inst : event_fifo_32_2k
  	Port Map	(
      rst         => probes_rst,
  		din		      => event_fifo_data_in,
  		rd_clk	      => mii_clk_tx,
  		rd_en		      => event_fifo_rdreq,
  		wr_clk	      => probes_clk,
  		wr_en		      => event_fifo_wrreq,
      prog_full_thresh => PROG_FULL_THRESHOLD,
  		dout	         => event_fifo_data_out,
  		empty	         => event_fifo_rdempty,
  		full	         => event_fifo_wrfull,
      prog_full      => event_fifo_progfull, --o
      rd_data_count  => event_fifo_rdusedw --(9 downto 0)
  	  );
end generate;

fifo_gen2: if NO_OF_PROBES=16 generate
  event_fifo16_inst : event_fifo_16_2k
    Port Map  (
      rst         => probes_rst,
      din         => event_fifo_data_in,
      rd_clk        => mii_clk_tx,
      rd_en         => event_fifo_rdreq,
      wr_clk        => probes_clk,
      wr_en         => event_fifo_wrreq,
      prog_full_thresh => PROG_FULL_THRESHOLD,
      dout           => event_fifo_data_out,
      empty          => event_fifo_rdempty,
      full           => event_fifo_wrfull,
      prog_full      => event_fifo_progfull, --o
      rd_data_count  => event_fifo_rdusedw --(9 downto 0)
      );
end generate;

fifo_gen3: if NO_OF_PROBES=8 generate
  event_fifo8_inst : event_fifo_8_2k
    Port Map  (
      rst         => probes_rst,
      din         => event_fifo_data_in,
      rd_clk        => mii_clk_tx,
      rd_en         => event_fifo_rdreq,
      wr_clk        => probes_clk,
      wr_en         => event_fifo_wrreq,
      prog_full_thresh => PROG_FULL_THRESHOLD,
      dout           => event_fifo_data_out,
      empty          => event_fifo_rdempty,
      full           => event_fifo_wrfull,
      prog_full      => event_fifo_progfull, --o
      rd_data_count  => event_fifo_rdusedw --(9 downto 0)
      );
end generate;

event_empty <= event_fifo_rdempty; 
event_full <= event_fifo_progfull;
event_almost_empty <= '1' when event_fifo_rdusedw < ALMOST_EMPTY_THRESHOLD
                          else '0';

--event_fifo_rdusedw(10) <= '0';
d1_proc: Process(probes_clk) Begin
  if rising_edge(probes_clk) then
    event_fifo_progfull_1d <= event_fifo_progfull;
  end if;
end Process;

   -- Serialize data form event fifo (NO_OF_PROBES-bit)
   -- to input data fifo(8bit)
   -- Add padding to 64 bit
events2data_inst : events2data
   Generic Map(
         events_width   => NO_OF_PROBES,
         data_width     => 8
              )
   Port Map (
      clk            => mii_clk_tx,--int_clk,
      rst            => rst_tx,--rst,
      events_data    => event_fifo_data_out,
      events_rdreq   => event_fifo_rdreq, --out
      events_rdempty => event_fifo_rdempty,
      data_rdreq     => fifo_rdreq, --in from udp
      data_rdempty   => fifo_rdempty, --out
      data_data      => fifo_data --out
            );
	
pkt_trigger_inst  :  pkt_trigger_noTS
   Generic Map(
      full_pkt                => EVENT_PP, -- events per packet
      event_number_width      => EVENT_NUMBER_WIDTH,
      pkt_len_width           => 11,
      bytes_per_event         => BYTES_PE
              )
   Port Map(
      clk         => mii_clk_tx,
      rst         => rst_tx,
      events_no   => event_fifo_rdusedw,
      events_empty => fifo_rdempty, -- Indicates there are data in event fifo, or events2data
      ext_start   => ext_start_xd,
      pkt_len     => pkt_data_len,
      pkt_send    => pkt_start,
      pkt_ready   => pkt_ready
           );

   -- UDP/Ethernet core
udp_pkt_gen_inst : udp_pkt_gen_v9
   Generic Map(
      IGAP_LEN          => IGAP_LEN,     -- 12 is minimul allowed by standard	
      DATA_LEN          => 1280,   -- no of Events @ 64B/Event 
      HEADER_LEN        => 66,     -- 8B Preambule + 14B Eth + 20B IP + 8B UDP + 16B OurHeader = 66B 
      LENGTH_OFF        => 53,       -- Where to place length of data in bytes
      PACKET_ID_OFF     => 55,       -- Where to place number of packet
      PROTOCOL_ID_OFF   => 51,       -- Where to place protocol id
      USR_FLG_OFF       => 59        -- Where to place user flags
	 )
	 Port Map(
		CLK				=> mii_clk_tx,
		RST				=> rst_tx,
    test_mode => test_mode,
		-- Control inouts
		START			=> pkt_start,
    READY     => pkt_ready,
		USR_FLAGS	=> usr_hdr,-- 8x8b, 
		LENGTH		=> pkt_data_len,
    start_o => start_pkt_info,
		-- Conection to packet data FIFO
		FIFO_RDREQ	=> fifo_rdreq,
		FIFO_RDEMPTY=> fifo_rdempty,
		FIFO_DATA		=> fifo_data,
		-- Connection to ethernet PHY
		PHY_EN 		  => tx_en_ii,
		PHY_ER	 	  => tx_er_i,
		PHY_TX   	  => tx_data_ii,
    PHY_READY   => tx_ready_i
    );

  ext_trig_process: Process(mii_clk_tx)
    Begin
      if rising_edge(mii_clk_tx) Then
        ext_start_1d <= ext_start;
        ext_start_2d <= ext_start_1d;
        if ext_start_ce='1' then
          ext_start_xd <= '1';
        elsif pkt_ready='1' then
          ext_start_xd <= '0';
        else 
          ext_start_xd <= ext_start_xd;
        end if;
      end if;
    End Process;
    ext_start_ce <= not ext_start_2d and ext_start_1d;

  -- Output flip-flops
  
  outs_i(0) <= tx_en_i;
  outs_i(1) <= tx_er_i;
  outs_i(9 downto 2) <= tx_data_i;

  tx_data <= outs_o(9 downto 2);
  tx_en   <= outs_o(0);
  tx_er   <= outs_o(1);
  
  tx_data_i <= tx_data_ii;
  tx_en_i <= tx_en_ii;
  tx_ready_i <= '1';

  eth_out_process : Process (mii_clk_tx)
   Begin
      If mii_clk_tx'Event And mii_clk_tx = '1' Then
        outs_o2 <= outs_i;
        outs_o <= outs_o2; -- 2 stage pipe
      End If;
   End Process;

End arch;
