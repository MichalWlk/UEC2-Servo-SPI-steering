`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Michal Walek
// 
// Create Date: 08/02/2024 10:16:12 PM
// Design Name: 
// Module Name: Steering_X
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: Module that coverts value provided by JSTK2 into PWM signal that drives rear wheels.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Steering_X(
    input clk,
    input rst,
    input logic [10:0] x_val,
    output PWM_right,
    output PWM_left
    );

    wire [11:0] cntr_out;   /*niewiadomo czy sterowanie dziala bo w specyfikacji nie ma info jaki ma byc okres podawanego sygnalu (tutaj T=3ms bo symetrzycznie) */

    Left_Ctrl Left_Ctrl(
    .clk(clk),
    .rst(rst),
    .cntr_val(cntr_out),
    .x_val(x_val),
    .pwm_left(PWM_left)
    );

    Right_Ctrl Right_Ctrl(
    .clk(clk),
    .rst(rst),
    .cntr_val(cntr_out),
    .x_val(x_val),
    .pwm_right(PWM_right)
    );

    Counter_X Counter_X(
    .clk(clk),
    .rst(rst),
    .cntd_val(cntr_out)
    );

endmodule