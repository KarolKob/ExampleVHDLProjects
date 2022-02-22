HOW TO BUILD EXAMPLE DESIGN:

Example design module is placed in example_design directory during core generation.To implement the example design, follow any of the below methods. 


Method 1 : If Core is generated from CoreGen, to run implementation on the example design through ISE:
	  
           Step 1: Launch a ISE Design Suite Command Line
	   Step 2: Change directory to the implement folder
           Step 3: ./ise_implement.sh or ise_implement.bat

Method 2 : If Core is generated from PlanAhead gui, to run implementation on example design through ISE using PlanAhead:
           Execute the below commands in the PlanAhead tcl console:

           Step 1: change directory to the implement folder
           Step 2: source pa_ise_implement.tcl

Method 3 : If Core is generated from vivado gui, to run implementation on example design through RDI using vivado:
           Execute the below commands in the vivado tcl console:

           Step 1: change directory to the implement folder
           Step 2: source v_rdi_implement.tcl

