vsim -voptargs=+acc -debugDB work.testbench(logic)
add wave *
add wave uut1.adc_out
run -all
wave zoom full