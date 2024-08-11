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
    output PWM_x_left,
    output PWM_x_right,
    output PWM_y
    );

    wire [9:0] x_val, y_val, x_val_servo; //pewnie jeszcze to samo dla Y, tzn assign +1000

    assign x_val_servo = x_val + 1000;

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
    .x_val(x_val_servo),
    .PWM_left(PWM_x_left),
    .PWM_right(PWM_x_right)
    );

    Steering_Y Steering_Y(
    .clk(clk),
    .rst(rst),
    .y_val(y_val),
    .PWM_y(PWM_y)
    );


endmodule