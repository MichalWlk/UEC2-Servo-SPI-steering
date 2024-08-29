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


module SPI_Steering_top(
    input clk,
    input btnC,

    input JSTK2_MISO,
    output JSTK2_SS,
    output JSTK2_SCLK,

    input JSTK2_MISO_X,
    output JSTK2_SS_X,
    output JSTK2_SCLK_X,

    input PROX_FL,
    input PROX_FR,
    input PROX_RL,
    input PROX_RR,

    output [15:0] led,

    output PWM_x_left,
    output PWM_x_right,
    output PWM_y,

    //input [0:0] sw,
    output [3:0] an,
    output [6:0] seg
    );

    wire [10:0] x_val, y_val, x_val_servo, y_val_servo, x_val_servo_checked, x_backtrack_out, y_backtrack_out;

    assign x_val_servo = x_val + 11'd1000;
    assign y_val_servo = y_val + 1000;

    //wire [10:0] posData;
    wire x_bumper, y_bumper;

    //assign posData = (sw[0] == 1'b1) ? {x_val_servo[10:0]} : {y_val_servo[10:0]}; //DEBUG

    JSTK2_SPI_interface JSTK2_SPI_interface(
    .clk(clk),
    .rst(btnC),
    .MISO(JSTK2_MISO),
    .SS(JSTK2_SS),
    .SCLK(JSTK2_SCLK),
    .y_val(y_val),
    .y_bumper(y_bumper)
    );

    JSTK_SPI_if_X JSTK_SPI_if_X(
    .clk(clk),
    .rst(btnC),
    .MISO(JSTK2_MISO_X),
    .SS(JSTK2_SS_X),
    .SCLK(JSTK2_SCLK_X),
    .x_val(x_val),
    .x_bumper(x_bumper)
    );

    Sensor_Ctrl Sensor_Ctrl(
    .clk(clk),
    .rst(btnC),
    .prox_FR(PROX_FR),
    .prox_FL(PROX_FL), 
    .prox_RR(PROX_RR), 
    .prox_RL(PROX_RL), 
    .x_val(x_backtrack_out),
    .x_val_checked(x_val_servo_checked)
    );

    Led_Ctrl Led_Ctrl(
    .clk(clk),
    .rst(btnC),
    .velocity(x_val),
    .led_out(led)
    );

    Backtrack Backtrack(
    .clk(clk),
    .rst(btnC),
    .x_bumper(x_bumper),
    .y_bumper(y_bumper),
    .x_val(x_val_servo),
    .y_val(y_val_servo),
    .x_val_out(x_backtrack_out),
    .y_val_out(y_backtrack_out)
    );

    Steering_X Steering_X(
    .clk(clk),
    .rst(btnC),
    .x_val(x_val_servo_checked),
    .PWM_left(PWM_x_left),
    .PWM_right(PWM_x_right)
    );

    Steering_Y Steering_Y(
    .clk(clk),
    .rst(btnC),
    .y_val(y_backtrack_out),
    .PWM_y(PWM_y)
    );

    sseg_ctrl sseg_ctrl(
    .clk(clk),
    .rst(btnC),
    .x_val(x_val_servo),
    .sseg_an(an),
    .sseg_char(seg)
    );

/*
    DEBUG_ssd_ctrl DEBUG_ssd_ctrl(
    .CLK(clk),
    .RST(btnC),
    .DIN(posData),
    .AN(an),
    .SEG(seg)
    );
*/


endmodule

//
//                 __
//                / _)
//       _.----._/ /
//      /         /
//   __/ (  | (  |
//  /__.-'|_|--|_|
//
