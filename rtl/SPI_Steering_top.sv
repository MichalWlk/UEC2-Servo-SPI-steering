`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Michal Walek
// 
// Create Date: 08/02/2024 10:16:12 PM
// Design Name: 
// Module Name: SPI_Steering_top
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: top module for the project
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SPI_Sterring_top(
    input clk,
    input rst,
    input MISO,
    output SS,
    output SCLK,
    output PWM_x,
    output PWM_y
    );

    wire [9:0] x_val, y_val;

    JSTK2_SPI_interface JSTK2_SPI_interface(
    .clk(clk),
    .rst(rst),
    .MISO(MISO),
    .SS(SS),
    .SCLK(SCLK),
    .x_val(x_val),
    .y_val(y_val)
    );

    Steering_X Steering_X(
    .clk(clk),
    .rst(rst),
    .x_val(x_val),
    .PWM_x(PWM_x)
    );

    Steering_Y Steering_Y(
    .clk(clk),
    .rst(rst),
    .y_val(y_val),
    .PWM_y(PWM_y)
    );


endmodule