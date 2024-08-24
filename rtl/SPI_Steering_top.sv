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
    input btnC,
    input JSTK2_MISO,
    output JSTK2_SS,
    output JSTK2_SCLK,
    output PWM_x_left,
    output PWM_x_right,
    output PWM_y,
    input [0:0] sw,
    output [3:0] an,
    output [6:0] seg
    );

    wire [10:0] x_val, y_val, x_val_servo, y_val_servo; //pewnie jeszcze to samo dla Y, tzn assign +1000

    assign x_val_servo = x_val + 11'd1000;
    assign y_val_servo = y_val + 11'd1000;

    wire [10:0] posData;

    assign posData = (sw[0] == 1'b1) ? {x_val_servo[10:0]} : {y_val_servo[10:0]}; //DEBUG

    JSTK2_SPI_interface JSTK2_SPI_interface(
    .clk(clk),
    .rst(btnC),
    .MISO(JSTK2_MISO),
    .SS(JSTK2_SS),
    .SCLK(JSTK2_SCLK),
    .x_val(x_val),
    .y_val(y_val)
    );

    Steering_X Steering_X(
    .clk(clk),
    .rst(btnC),
    .x_val(x_val_servo),
    .PWM_left(PWM_x_left),
    .PWM_right(PWM_x_right)
    );

    Steering_Y Steering_Y(
    .clk(clk),
    .rst(btnC),
    .y_val(y_val_servo),
    .PWM_y(PWM_y)
    );

    DEBUG_ssd_ctrl DEBUG_ssd_ctrl(
    .CLK(clk),
    .RST(btnC),
    .DIN(posData),
    .AN(an),
    .SEG(seg)
    );



endmodule

//
//                 __
//                / _)
//       _.----._/ /
//      /         /
//   __/ (  | (  |
//  /__.-'|_|--|_|
//
