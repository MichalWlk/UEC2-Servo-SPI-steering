# Copyright (C) 2023  AGH University of Science and Technology
# MTM UEC2
# Author: Piotr Kaczmarczyk
#
# Description:
# Project detiles required for generate_bitstream.tcl
# Make sure that project_name, top_module and target are correct.
# Provide paths to all the files required for synthesis and implementation.
# Depending on the file type, it should be added in the corresponding section.
# If the project does not use files of some type, leave the corresponding section commented out.

#-----------------------------------------------------#
#                   Project details                   #
#-----------------------------------------------------#
# Project name                                  -- EDIT
set project_name SPI_Steering

# Top module name                               -- EDIT
set top_module SPI_Steering_top.sv

# FPGA device
set target xc7a35tcpg236-1

#-----------------------------------------------------#
#                    Design sources                   #
#-----------------------------------------------------#
# Specify .xdc files location                   -- EDIT
set xdc_files {
    constraints/top_vga_basys3.xdc
}

# Specify SystemVerilog design files location   -- EDIT
set sv_files {
../rtl/Clk_Div.sv \
        ../rtl/Counter_X.sv \
        ../rtl/Counter_Y.sv \
        ../rtl/JSTK2_SPI_interface.sv \
        ../rtl/Left_Ctrl.sv \
        ../rtl/Right_Ctrl.sv \
        ../rtl/SPI_Ctrl.sv \
        ../rtl/SPI_Steering_top.sv \
        ../rtl/Steering_X.sv \
        ../rtl/Steering_Y.sv \
        ../rtl/Turn_Ctrl.sv \
        ../rtl/y_val_limiter.sv \
        ../rtl/DEBUG_Bin_to_BCD.sv \
        ../rtl/DEBUG_ssd_ctrl.sv \
        ../rtl/JSTK_SPI_if_X.sv \
        ../rtl/Clk_Div_X.sv \
        ../rtl/SPI_Ctrl_X.sv \
        ../rtl/Sensor_Ctrl.sv \
        ../rtl/Led_Ctrl.sv \
        ../rtl/Led_Comp.sv \
        ../rtl/Led_PWM.sv \
        ../rtl/Timer_5s.sv \
        ../rtl/Clk_Div_5Hz.sv \
        ../rtl/Backtrack.sv \
        ../rtl/Action_Translator.sv \
        ../rtl/Val_SR.sv

}

# Specify Verilog design files location         -- EDIT
set verilog_files {
        rtl/clk_wiz_0_clk_wiz.v
 }

#Specify VHDL design files location            -- EDIT



# Specify files for a memory initialization     -- EDIT
# set mem_files {
#    path/to/file.data
# }
