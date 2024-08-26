`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Michal Walek
// 
// Create Date: 08/02/2024 10:16:12 PM
// Design Name: 
// Module Name: Led_PWM
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: Generates PWM signal (500Hz) based on which LEDs should be lit.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Led_PWM(
    input clk,
    input rst,
    input logic [15:0] led_on,
    output logic [15:0] led_pwm
    );

    logic [16:0] pwm_cntr = 0;
    logic clk_en = 1;
    parameter [16:0] CLK_VAL = 100000;

    always @(posedge clk) begin
        if(rst) begin
            pwm_cntr <= 0;
            clk_en <= 0;
        end else begin
            pwm_cntr <= pwm_cntr + 1;
            if(pwm_cntr == CLK_VAL) begin
                pwm_cntr <= 0;
                clk_en <= ~clk_en;
            end
        end
    end

    always @(posedge clk) begin
        if(rst) begin
            led_pwm <= 0;
        end else begin
            if(clk_en) begin
                led_pwm <= led_on;
            end else begin
                led_pwm <= 16'b0;
            end
        end
    end


endmodule
