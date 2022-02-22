################################################################################
##   ____  ____
##  /   /\/   /
## /___/  \  /    Vendor: Xilinx
## \   \   \/     Version : 1.05
##  \   \         Application : VIO v1.05_a Core
##  /   /         Filename : pa_rdi_implement.tcl
## /___/   /\     
## \   \  /  \
##  \___\/\___\
##
##
## pa_rdi_implement.tcl script 
## Generated by Xilinx VIO v1.05_a Core
##
#-----------------------------------------------------------------------------
# Script to synthesize and implement the RTL provided for the ICON core
#-----------------------------------------------------------------------------
add_files -norecurse {../example_design/example_vio_1.vhd}
set_property target_constrs_file {../example_design/example_vio_1.xdc} [current_fileset -constrset]
import_ip -file {chipscope_icon.xco} -name chipscope_icon
generate_target { all } [get_ips chipscope_icon]
set_property top example_vio_1 [get_filesets sources_1]
set_property flow {RDS 13} [get_runs synth_1]
set_property flow {RDI 13} [get_runs impl_1]
set_property used_in_synthesis false [get_files chipscope_icon.xdc]
synth_design
place_design
route_design
write_bitstream -force example_design.bit
