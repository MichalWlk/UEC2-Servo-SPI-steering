`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Michal Walek
// 
// Create Date: 08/02/2024 10:16:12 PM
// Design Name: 
// Module Name: Left_Ctrl
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: Generates PWM signal by cheking if x value (from SPI +1000) is higher or lower than counted value (counts 1000 in 1ms => T=3ms)
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Left_Ctrl(
    input clk,
    input rst,
    input logic [11:0] cntr_val,
    input logic [9:0] x_val,
    output pwm_left
    );

    logic pwm_state;

    assign pwm_left = pwm_state;

    always @(posedge clk) begin
        if(rst) begin
            pwm_state <= 0;
        end else begin
            if(cntr_val < x_val) begin
                pwm_state <= 1'b1;
            end else begin
                pwm_state <= 1'b0;
            end
        end
    end


endmodule
