
?
Command: %s
1870*	planAhead2?
?read_checkpoint -auto_incremental -incremental C:/Users/Karol/Desktop/ISATC/Parity/Parity/Parity.srcs/utils_1/imports/synth_1/top.dcp2default:defaultZ12-2866h px? 
?
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2j
VC:/Users/Karol/Desktop/ISATC/Parity/Parity/Parity.srcs/utils_1/imports/synth_1/top.dcp2default:defaultZ12-5825h px? 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px? 
q
Command: %s
53*	vivadotcl2@
,synth_design -top top -part xc7s100fgga676-22default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7s1002default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7s1002default:defaultZ17-349h px? 
?
[Reference run did not run incremental synthesis because %s; reverting to default synthesis
2138*designutils2+
the design is too small2default:defaultZ20-4072h px? 
?
?Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px? 
?
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px? 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px? 
_
#Helper process launched with PID %s4824*oasys2
92242default:defaultZ8-7075h px? 
?
%s*synth2?
rStarting Synthesize : Time (s): cpu = 00:00:03 ; elapsed = 00:00:03 . Memory (MB): peak = 1250.055 ; gain = 0.000
2default:defaulth px? 
?
synthesizing module '%s'638*oasys2
top2default:default2b
LC:/Users/Karol/Desktop/ISATC/Parity/Parity/Parity.srcs/sources_1/new/top.vhd2default:default2
132default:default8@Z8-638h px? 
?
synthesizing module '%s'638*oasys2
p_coder2default:default2f
PC:/Users/Karol/Desktop/ISATC/Parity/Parity/Parity.srcs/sources_1/new/p_coder.vhd2default:default2
212default:default8@Z8-638h px? 
?
default block is never used226*oasys2f
PC:/Users/Karol/Desktop/ISATC/Parity/Parity/Parity.srcs/sources_1/new/p_coder.vhd2default:default2
562default:default8@Z8-226h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
p_coder2default:default2
12default:default2
12default:default2f
PC:/Users/Karol/Desktop/ISATC/Parity/Parity/Parity.srcs/sources_1/new/p_coder.vhd2default:default2
212default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
	p_decoder2default:default2h
RC:/Users/Karol/Desktop/ISATC/Parity/Parity/Parity.srcs/sources_1/new/p_decoder.vhd2default:default2
132default:default8@Z8-638h px? 
?
default block is never used226*oasys2h
RC:/Users/Karol/Desktop/ISATC/Parity/Parity/Parity.srcs/sources_1/new/p_decoder.vhd2default:default2
402default:default8@Z8-226h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
	p_decoder2default:default2
22default:default2
12default:default2h
RC:/Users/Karol/Desktop/ISATC/Parity/Parity/Parity.srcs/sources_1/new/p_decoder.vhd2default:default2
132default:default8@Z8-256h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
top2default:default2
32default:default2
12default:default2b
LC:/Users/Karol/Desktop/ISATC/Parity/Parity/Parity.srcs/sources_1/new/top.vhd2default:default2
132default:default8@Z8-256h px? 
?
%s*synth2?
rFinished Synthesize : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 1250.055 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
}Finished Constraint Validation : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 1250.055 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Loading part: xc7s100fgga676-2
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 1250.055 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
Loading part %s157*device2$
xc7s100fgga676-22default:defaultZ21-403h px? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2
c_state_reg2default:default2
p_coder2default:defaultZ8-802h px? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2
c_state_reg2default:default2
top2default:defaultZ8-802h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                 waiting |                               00 |                               00
2default:defaulth p
x
? 
?
%s
*synth2s
_                 count_p |                               01 |                               01
2default:defaulth p
x
? 
?
%s
*synth2s
_                 count_q |                               10 |                               10
2default:defaulth p
x
? 
?
%s
*synth2s
_                    send |                               11 |                               11
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
c_state_reg2default:default2

sequential2default:default2
p_coder2default:defaultZ8-3354h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_             write_coder |                             0001 |                               00
2default:defaulth p
x
? 
?
%s
*synth2s
_                    send |                             0010 |                               01
2default:defaulth p
x
? 
?
%s
*synth2s
_                 display |                             0100 |                               10
2default:defaulth p
x
? 
?
%s
*synth2s
_                  iSTATE |                             1000 |                               11
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
c_state_reg2default:default2
one-hot2default:default2
top2default:defaultZ8-3354h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:05 ; elapsed = 00:00:05 . Memory (MB): peak = 1250.055 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   32 Bit       Adders := 30    
2default:defaulth p
x
? 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   7 Input      1 Bit         XORs := 5     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               64 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               49 Bit    Registers := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               32 Bit    Registers := 5     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                7 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 14    
2default:defaulth p
x
? 
?
%s
*synth2'
+---Multipliers : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	               4x32  Multipliers := 4     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input   64 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   64 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input   49 Bit        Muxes := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   49 Bit        Muxes := 4     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   32 Bit        Muxes := 10    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input   32 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    8 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    8 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    7 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input    4 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    4 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    2 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    1 Bit        Muxes := 20    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 20    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2k
WPart Resources:
DSPs: 160 (col length:80)
BRAMs: 240 (col length: RAMB18 80 RAMB36 40)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2-
FSM_onehot_c_state_reg[3]2default:default2
top2default:defaultZ8-3332h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:14 ; elapsed = 00:00:14 . Memory (MB): peak = 1250.055 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
{Finished Timing Optimization : Time (s): cpu = 00:00:14 ; elapsed = 00:00:14 . Memory (MB): peak = 1250.055 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
zFinished Technology Mapping : Time (s): cpu = 00:00:14 ; elapsed = 00:00:14 . Memory (MB): peak = 1250.055 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
tFinished IO Insertion : Time (s): cpu = 00:00:17 ; elapsed = 00:00:17 . Memory (MB): peak = 1250.055 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:00:17 ; elapsed = 00:00:17 . Memory (MB): peak = 1250.055 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:17 ; elapsed = 00:00:17 . Memory (MB): peak = 1250.055 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:00:17 ; elapsed = 00:00:17 . Memory (MB): peak = 1250.055 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:17 ; elapsed = 00:00:17 . Memory (MB): peak = 1250.055 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
Finished Renaming Generated Nets : Time (s): cpu = 00:00:17 ; elapsed = 00:00:17 . Memory (MB): peak = 1250.055 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|1     |BUFG   |     1|
2default:defaulth px? 
D
%s*synth2,
|2     |CARRY4 |   156|
2default:defaulth px? 
D
%s*synth2,
|3     |LUT1   |   120|
2default:defaulth px? 
D
%s*synth2,
|4     |LUT2   |   329|
2default:defaulth px? 
D
%s*synth2,
|5     |LUT3   |   159|
2default:defaulth px? 
D
%s*synth2,
|6     |LUT4   |    84|
2default:defaulth px? 
D
%s*synth2,
|7     |LUT5   |   110|
2default:defaulth px? 
D
%s*synth2,
|8     |LUT6   |   559|
2default:defaulth px? 
D
%s*synth2,
|9     |MUXF7  |    61|
2default:defaulth px? 
D
%s*synth2,
|10    |MUXF8  |     9|
2default:defaulth px? 
D
%s*synth2,
|11    |FDRE   |   451|
2default:defaulth px? 
D
%s*synth2,
|12    |FDSE   |     2|
2default:defaulth px? 
D
%s*synth2,
|13    |IBUF   |     9|
2default:defaulth px? 
D
%s*synth2,
|14    |OBUF   |     7|
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
E
%s
*synth2-

Report Instance Areas: 
2default:defaulth p
x
? 
Q
%s
*synth29
%+------+---------+----------+------+
2default:defaulth p
x
? 
Q
%s
*synth29
%|      |Instance |Module    |Cells |
2default:defaulth p
x
? 
Q
%s
*synth29
%+------+---------+----------+------+
2default:defaulth p
x
? 
Q
%s
*synth29
%|1     |top      |          |  2057|
2default:defaulth p
x
? 
Q
%s
*synth29
%|2     |  top1   |p_coder   |   493|
2default:defaulth p
x
? 
Q
%s
*synth29
%|3     |  top2   |p_decoder |  1006|
2default:defaulth p
x
? 
Q
%s
*synth29
%+------+---------+----------+------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:00:17 ; elapsed = 00:00:17 . Memory (MB): peak = 1250.055 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 2 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
}Synthesis Optimization Runtime : Time (s): cpu = 00:00:17 ; elapsed = 00:00:17 . Memory (MB): peak = 1250.055 ; gain = 0.000
2default:defaulth p
x
? 
?
%s
*synth2?
~Synthesis Optimization Complete : Time (s): cpu = 00:00:17 ; elapsed = 00:00:17 . Memory (MB): peak = 1250.055 ; gain = 0.000
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0152default:default2
1250.0552default:default2
0.0002default:defaultZ17-268h px? 
g
-Analyzing %s Unisim elements for replacement
17*netlist2
2262default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1250.0552default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
g
$Synth Design complete, checksum: %s
562*	vivadotcl2
843b6ac12default:defaultZ4-1430h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
272default:default2
32default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:182default:default2
00:00:182default:default2
1250.0552default:default2
0.0002default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2Z
FC:/Users/Karol/Desktop/ISATC/Parity/Parity/Parity.runs/synth_1/top.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2p
\Executing : report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Thu Dec 16 23:04:14 20212default:defaultZ17-206h px? 


End Record