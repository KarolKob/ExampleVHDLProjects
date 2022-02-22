
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name ISE_PUR_Lab3 -dir "C:/Users/IEUser/Desktop/PUR_Lab_3/ISE_PUR_Lab3/planAhead_run_1" -part xc7a100tcsg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/IEUser/Desktop/PUR_Lab_3/ISE_PUR_Lab3/top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/IEUser/Desktop/PUR_Lab_3/ISE_PUR_Lab3} {ipcore_dir} }
add_files [list {ipcore_dir/icon_1.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ila_1.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/vio_1.ncf}] -fileset [get_property constrset [current_run]]
set_param project.pinAheadLayout  yes
set_property target_constrs_file "top.ucf" [current_fileset -constrset]
add_files [list {top.ucf}] -fileset [get_property constrset [current_run]]
link_design
