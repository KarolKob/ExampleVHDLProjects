-------------------------------------------------------------------------------
-- Project: UDP Data Logger
-- Author(s): HusTakocem
-- Created: Jan 2018
-------------------------------------------------------------------------------
-- DAQ UDP components pkg
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.math_real.all;

Package pkg_eth Is

type mac_type is array (5 downto 0) of std_logic_vector(7 downto 0);
type ip_type is array (3 downto 0) of natural range 0 to 255;
type ip_top  is array (9 downto 0) of std_logic_vector(7 downto 0);
subtype udp_port is std_logic_vector(15 downto 0);
function crc_calc return std_logic_vector;

constant NO_OF_PROBES: positive := 8; -- 8, 16, 32
constant FS_MHZ: positive range 1 to 128 := 50; -- sampling frequency in MHz
constant FS_DIV: natural range 1 to 1024 := 50; -- fs divider

constant TS: real:= (1.0/real(FS_MHZ * 1e6));
constant RESET_HW: real:= 1.0e-3;  -- ~1 ms
constant RESET_SW: real:= 1.0e-0;  -- ~1 sec
constant CYCLE_HW: natural:= natural(RESET_HW/TS);
constant CYCLE_SW: natural:= natural(RESET_SW/TS);

-- TX config
constant BYTES_PE: positive:= (NO_OF_PROBES/8); -- bytes per event
constant EVENT_PP: positive:= 1280/BYTES_PE; -- events per packet
constant TRANS_FIFO_FULL : positive := 1920;
constant IGAP_LEN : integer := 20;   -- 12 is minimul allowed by standard 

constant STAMP_ERR: std_logic_vector(NO_OF_PROBES-1 downto 0):=(others=>'1');
constant STAMP_RST: std_logic_vector(NO_OF_PROBES-1 downto 0):=(others=>'0');

constant PROTOCOL_ID: std_logic_vector(15 downto 0):=x"4d_4b"; -- user protocol
constant BOARD_ID: std_logic_vector(15 downto 0):=x"00_01"; -- user board
constant USER_FLAGS: std_logic_vector(63 downto 0):= x"01_02_03_04_05"
          & std_logic_vector(to_unsigned(NO_OF_PROBES,8))
          & std_logic_vector(to_unsigned(FS_DIV,8))
          & std_logic_vector(to_unsigned(FS_MHZ,8))  ; -- user data
constant MAC_SRC: mac_type:= (x"00", x"0a", x"35", x"c0", BOARD_ID(15 downto 8), BOARD_ID(7 downto 0));
constant MAC_DST: mac_type:= (x"ff", x"ff", x"ff", x"ff", x"ff", x"ff");
constant IP_SRC: ip_type:= (192,168,  1,190);
constant IP_DST: ip_type:= (192,168,  1,100);
constant UDP_SRC: udp_port:= std_logic_vector(to_unsigned(8100,16));
constant UDP_DST: udp_port:= std_logic_vector(to_unsigned(8100,16));

constant IP_HDR: ip_top:=(x"45", x"00", x"05", x"2c", x"61", x"d2", x"00", x"00", x"80", x"11");

-- RX config

--constant IP_CRC: std_logic_vector(15 downto 0):= crc_calc;

    -- pkt settings
    Component pkt_trigger_noTS Is
        Generic(
         full_pkt                : positive;
         event_number_width      : positive;
         pkt_len_width           : positive;
         bytes_per_event         : positive
            );
        Port(
         clk          : in  std_logic;
         rst          : in  std_logic;

         events_no    : in  std_logic_vector(event_number_width - 1 downto 0);
         events_empty : in  std_logic;
         ext_start    : in  std_logic;

         pkt_len      : out std_logic_vector(pkt_len_width - 1 downto 0);
         pkt_send     : out std_logic;
         pkt_ready    : in  std_logic
          );
    End Component;    

    -- frame settings
    component headerrom is
        generic (
        DATA_WIDTH : natural;
        ADDR_WIDTH : natural 
        );  
        port    (
        clk     : in std_logic;
        addr     : in natural range 0 to 2**ADDR_WIDTH - 1;
        q       : out std_logic_vector((DATA_WIDTH -1) downto 0)
        );
    end component;

   component udp_pkt_gen_v9 is
    generic(
        IGAP_LEN          : integer := 12;       -- 12 is minimul allowed by standard 
        DATA_LEN          : integer := 1280;     -- 160 Events @ 64bits/Event
        HEADER_LEN        : integer := 66;       -- 8B Preambule + 14B Eth + 20B IP + 8B UDP + 16B OurHeader = 66B 
        LENGTH_OFF        : integer := 53;       -- Where to place length of data in bytes
        PACKET_ID_OFF     : integer := 55;       -- Where to place number of packet
        PROTOCOL_ID_OFF   : integer := 51;       -- Where to place protocol id
        USR_FLG_OFF       : integer := 59  -- 8B
    );
    port(
      CLK       : In Std_logic;
      RST       : In Std_logic;
      test_mode      : in std_logic;
      -- Control inouts
      START     : In  Std_logic; -- Starts sending packets
        READY       : Out Std_logic; -- Indicates readiness to accept start
      USR_FLAGS : In  Std_logic_vector(63 downto 0); -- added to header on positive edge of START
        LENGTH      : In  Std_logic_vector(10 downto 0); -- 11bit for short packet
        start_o : out std_logic; -- status indicator
      
      -- Conection to packet data FIFO
      FIFO_RDREQ    : Out Std_logic;
      FIFO_RDEMPTY  : In  Std_logic;
      FIFO_DATA   : In  Std_logic_vector(7 downto 0);
      
      -- Connection to ethernet PHY
      PHY_EN    : Out Std_logic;
      PHY_ER    : Out Std_logic;
      PHY_TX    : Out Std_logic_vector(7 downto 0);
        PHY_READY   : in  Std_logic -- If 1 PHY is ready to capture data on rising edge
    );
    end component;


    Component events2data Is
      Generic(
         events_width   : positive := NO_OF_PROBES;
         data_width     : positive := 8
            );
      Port(
         clk            : in  std_logic;
         rst            : in  std_logic;
   
         events_data    : in  std_logic_vector(events_width - 1 downto 0);
         events_rdreq   : out std_logic;
         events_rdempty : in  std_logic;
   
      -- Interface to packetizer
      data_rdreq    : in  std_logic;
      data_rdempty  : out std_logic;
      data_data     : out std_logic_vector(data_width - 1 downto 0)
          );
    End Component;

    -- mod to LSR
    Component shift_reg_ld Is
        Generic(
         word_width  : positive;
         stages_num  : positive
        );
        Port(
         clk         : In  std_logic;
         rst         : In  std_logic;

         ld          : In  std_logic;  -- load data
         oe          : In  std_logic;  -- shift data out
      
         datain      : In  std_logic_vector(word_width * stages_num - 1 downto 0);
         dataout     : Out std_logic_vector(word_width -1 downto 0)
          );
    End Component;

    -- fixed shift register
    component FSR_X is
        generic (
         BUS_WIDTH : natural := 16;
         DEPTH     : natural := 512
        );
        port(
         CLK  : in  std_logic;
         SI   : in  std_logic_vector(BUS_WIDTH-1 downto 0);
         CE   : in  std_logic;
         DO   : out std_logic_vector(DEPTH*BUS_WIDTH-1 downto 0)
        );
    end component;

    -- dynamic shift register 1
    component DSR_1 is
        generic (
         DEPTH     : integer := 512;
         SEL_WIDTH : integer := 9
        );
        port(
         CLK  : in  std_logic;
         SI   : in  std_logic;
         CE   : in  std_logic;
         A    : in  std_logic_vector(SEL_WIDTH-1 downto 0);
         DO   : out std_logic
        );
    end component;

    -- verilog IP core from OpenCores project
    component CRC_gen is
        port(
        Reset       : In std_logic;
        Clk         : In std_logic;
        Init        : In std_logic;
        Frame_data  : In std_logic_vector(7 downto 0);
        Data_en     : In std_logic;
        CRC_rd      : In std_logic;
        CRC_rd_en   : In std_logic;
        CRC_end     : Out std_logic;
        CRC_out     : Out std_logic_vector(7 downto 0)
        );
    end component;
   
    -- reset squ gen
    Component rst_gen is
        Generic(
        rst_cycles : positive; 
        rst1_cycles : positive
          );
        Port(
        clk      : In  std_logic;
        ext_rst  : In  std_logic;
        rst      : Out std_logic;
        rst1     : Out std_logic
        );
    End Component;

    -- 
    Component probes2fifo_noTS Is
        Generic(
        probes_number   : positive := NO_OF_PROBES
          );
        Port(
        clk         : in  std_logic;
        rst         : in  std_logic;

        DataTrg     : in  std_logic;
        DataIn      : in  std_logic_vector(probes_number - 1 downto 0);
        
        fifo_data   : out std_logic_vector(probes_number - 1 downto 0);
        fifo_wrreq  : out std_logic;
        fifo_wrfull : in  std_logic;
        fifo_err  : out std_logic
        );
    End Component;

    -- probes trigger
    Component trigger Is
        Port(
        clk           :  In  Std_logic;
        rst           :  In  Std_logic;
        InData        :  In  Std_logic_vector (NO_OF_PROBES - 1 downto 0);
        OutData       :  Out Std_logic_vector (NO_OF_PROBES - 1 downto 0);
        daq_enable    :  Out Std_logic
        );
    End Component;

  -- udp transmitter, fifo 2k with rst, prog threshold
  component udp_transmiter_v9 Is
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
       --tx_clk    : Out std_logic;
       tx_en    : Out std_logic;
       tx_er    : Out std_logic;
       tx_data  : Out std_logic_vector(7 downto 0);
       -- Input Probes
       inProbes  : In std_logic_vector(NO_OF_PROBES-1 downto 0)
     );
  End component;

  -- udp data aqu
  component udp_daq is
  port
    (
     -- board ctrl
     eth_clk    : in std_logic; -- net clk : mii_clk_tx
     ext_rst    : in std_logic; -- external reset
     ext_start  : in std_logic; -- net test
     daq_enable : in std_logic; -- active high
     -- 
     -- PHY control - reset is active low
     rstn     : Out std_logic;
     -- PHY Tx side
     --tx_clk   : Out std_logic; -- gtx clock
     tx_en    : Out std_logic;
     tx_er    : Out std_logic;
     tx_data  : Out std_logic_vector(7 downto 0);
     
     -- adc inputs
     data_clk : In std_logic; 
     inData   : In std_logic_vector(NO_OF_PROBES-1 downto 0)
    );
  end component;

  -- shift reg only
  component resynch_20M is
        generic(t: time := 100 ps;
                N: integer := 16);
        port(synch_out: out std_logic_vector(N-1 downto 0);
            bus_in: in std_logic_vector(N-1 downto 0);
            --asynch_in: in std_logic;
            clk_sys : in std_logic);
  end component;

  component eth_receiver_v0 Is
     Port (
       ext_rst : In std_logic;
     -- PHY Rx side
       rx_clk   : In  std_logic;
       rx_dv    : In  std_logic;
       rx_er    : In  std_logic;
       rx_data  : In  std_logic_vector(3 downto 0);

       err_o : out std_logic; -- error rx
       erl_o : out std_logic; -- error low
       en_o: out std_logic; -- data enable out
       stat: out std_logic_vector(15 downto 0);
       data_o : out std_logic_vector(7 downto 0)
     );
  End component;

  Component hdr_receiver_v0 Is
   generic (BUF_SIZE: natural:= 4); -- in k words (2=2k, 4=4k)
    Port (
     ext_rst : In std_logic;
   -- ETH Rx side
     rx_clk   : In  std_logic;
     rx_dv    : in std_logic;
     rx_data  : In  std_logic_vector(7 downto 0);
     rx_en    : in   std_logic;
     err : in std_logic; -- error rx
     erl : in std_logic; -- error low
   -- User data side
     rdy_o: out std_logic; -- hdr ready
     rd_clk: in std_logic;
     rd_en: in std_logic;
     pay_empty: out std_logic;
     pay_data_count: out std_logic_vector(10 downto 0);
     pay_size: out std_logic_vector(15 downto 0);
     pay_data : out std_logic_vector(7 downto 0)
   );
  End Component;

  Component udp_receiver_v0 Is
   generic (BUF_SIZE: natural:= 4); -- in k words (2=2k, 4=4k)
    Port (
     ext_rst : In std_logic;
   -- ETH Rx side
     rx_clk   : In  std_logic;
     rx_dv    : in std_logic;
     rx_data  : In  std_logic_vector(7 downto 0);
     rx_en    : in   std_logic;
     err : in std_logic; -- error rx
     erl : in std_logic; -- error low
   -- User data side
     rdy_o: out std_logic; -- hdr ready
     ip_dst: in std_logic_vector(31 downto 0);
     udp_dst: in std_logic_vector(15 downto 0);
     rd_clk: in std_logic;
     rd_en: in std_logic;
     pay_empty: out std_logic;
     pay_data_count: out std_logic_vector(10 downto 0);
     pay_size: out std_logic_vector(15 downto 0);
     pay_data : out std_logic_vector(7 downto 0)
   );
  End Component;


End Package pkg_eth;
--------------------------------------------------------------------------
package body pkg_eth is

function crc_calc return std_logic_vector is
variable sum: std_logic_vector(19 downto 0):=(others=>'0');
variable o: std_logic_vector(15 downto 0);
begin
  sum:=x"0_0000" + (IP_HDR(9) & IP_HDR(8));
  sum:=sum+ (IP_HDR(7) & IP_HDR(6)) + (IP_HDR(5) & IP_HDR(4));
  sum:=sum+ (IP_HDR(3) & IP_HDR(2)) + (IP_HDR(1) & IP_HDR(0));
  sum:=sum+ (std_logic_vector(to_unsigned(IP_SRC(3),8)) & std_logic_vector(to_unsigned(IP_SRC(2),8)));
  sum:=sum+ (std_logic_vector(to_unsigned(IP_SRC(1),8)) & std_logic_vector(to_unsigned(IP_SRC(0),8)));
  sum:=sum+ (std_logic_vector(to_unsigned(IP_DST(3),8)) & std_logic_vector(to_unsigned(IP_DST(2),8)));
  sum:=sum+ (std_logic_vector(to_unsigned(IP_DST(1),8)) & std_logic_vector(to_unsigned(IP_DST(0),8)));
  o := sum(15 downto 0) + sum(19 downto 16);
  o := not o;
  return o;
end function;

end package body pkg_eth;
