################################################################################
##   ____  ____
##  /   /\/   /
## /___/  \  /    Vendor: Xilinx
## \   \   \/     Version : 1.06
##  \   \         Application : ICON v1.06_a Core
##  /   /         Filename : pa_ise_implement.tcl
## /___/   /\     
## \   \  /  \
##  \___\/\___\
##
##
## pa_ise_implement.tcl script 
## Generated by Xilinx ICON v1.06_a Core
##
#-----------------------------------------------------------------------------
# Script to synthesize and implement the RTL provided for the ICON core
#-----------------------------------------------------------------------------
add_files -norecurse {../example_design/example_icon_1.vhd}
import_ip -file {chipscope_vio.xco} -name chipscope_vio
generate_target { all } [get_ips chipscope_vio]
set_property top example_icon_1 [get_filesets sources_1]
#add_files -norecurse {../example_design/example_icon_1.ucf}
set_property target_constrs_file {../example_design/example_icon_1.ucf} [current_fileset -constrset]
set_property flow {XST 13} [get_runs synth_1]
set_property strategy {XST Defaults} [get_runs synth_1]
set_property flow {ISE 13} [get_runs impl_1]
reset_run -run synth_1
launch_runs synth_1