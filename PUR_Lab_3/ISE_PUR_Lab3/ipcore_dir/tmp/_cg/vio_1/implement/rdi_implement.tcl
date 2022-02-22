################################################################################
##   ____  ____
##  /   /\/   /
## /___/  \  /    Vendor: Xilinx
## \   \   \/     Version : 1.05
##  \   \         Application : VIO v1.05_a Core
##  /   /         Filename : rdi_implement.tcl
## /___/   /\     
## \   \  /  \
##  \___\/\___\
##
##
## rdi_implement.tcl script 
## Generated by Xilinx VIO v1.05_a Core
##
#-----------------------------------------------------------------------------
# Script to synthesize and implement the RTL provided for the ICON core in RDI flow
#-----------------------------------------------------------------------------
create_project -force project_1 {project_1} -part xc7a100tcsg324-3
add_files -norecurse -scan_for_includes {../../vio_1.ngc}
add_files -norecurse {../example_design/example_vio_1.vhd}
set_property top example_vio_1 [current_fileset]
import_ip -file {chipscope_icon.xco} -name chipscope_icon
generate_target { all } [get_ips chipscope_icon]
set_property target_constrs_file {../example_design/example_vio_1.xdc} [current_fileset -constrset]
read_xdc -cell VIO_inst ../../vio_1.constraints/vio_1.xdc
synth_design
place_design
route_design
write_bitstream -bitgen_options -w example_design.bit
