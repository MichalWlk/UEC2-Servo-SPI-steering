`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Michal Walek
// 
// Create Date: 08/02/2024 10:16:12 PM
// Design Name: 
// Module Name: Steering_Y
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: Module for generating PWM singal to turn front wheels
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Steering_Y(
    input clk,
    input rst,
    input logic [10:0] y_val,
    output PWM_y
    );

    wire [14:0] cntr_out;
    wire [10:0] y_val_limited;

    y_val_limiter y_val_limiter(
        .clk(clk),
        .rst(rst),
        .y_val(y_val),
        .y_val_lim(y_val_limited)
    );

    Turn_Ctrl Turn_Ctrl(
    .clk(clk),
    .rst(rst),
    .cntr_val(cntr_out),
    .y_val(y_val_limited),
    .pwm_turn(PWM_y)
    );

    Counter_Y Counter_Y(
    .clk(clk),
    .rst(rst),
    .cntd_val(cntr_out)
    );


endmodule
