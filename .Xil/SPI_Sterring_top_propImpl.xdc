set_property SRC_FILE_INFO {cfile:/home/student/mwalek/Vivado/UEC2_spi_servo/fpga/constraints/top_vga_basys3.xdc rfile:../fpga/constraints/top_vga_basys3.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk]] 0.100
