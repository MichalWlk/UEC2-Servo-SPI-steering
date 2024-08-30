`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Michal Walek
// 
// Create Date: 08/02/2024 10:16:12 PM
// Design Name: 
// Module Name: Led_Ctrl
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: Structural module for LED control
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Led_Ctrl(
    input clk,
    input rst,
    input logic [10:0] velocity,
    output logic [15:0] led_out
    );


    wire [15:0] led_on_wire;

    
    Led_Comp Led_Comp(
    .clk(clk),
    .rst(rst),
    .velocity(velocity),
    .led_on(led_on_wire)
    );

    Led_PWM Led_PWM(
    .clk(clk),
    .rst(rst),
    .led_on(led_on_wire),
    .led_pwm(led_out)
    );


endmodule
