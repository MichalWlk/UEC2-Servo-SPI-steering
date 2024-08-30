`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Michal Walek
// 
// Create Date: 08/02/2024 10:16:12 PM
// Design Name: 
// Module Name: Led_Comp
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: Checks which LEDs should be lit based on the value of JSTK x axis. Visualizes the velocity by the length of the led strip.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Led_Comp(
    input clk,
    input rst,
    input logic [10:0] velocity,
    output logic [15:0] led_on
    );


    always @(posedge clk) begin
        if(rst) begin
            led_on <= 0;
        end 
        else begin
            if((velocity > 479) && (velocity < 521)) begin
                led_on <= 16'b0000000000000000;
            end
            if(velocity > 520) begin
                led_on <= 16'b0000000010000000;
            end
            if(velocity > 580) begin
                led_on <= 16'b0000000011000000;
            end
            if(velocity > 640) begin
                led_on <= 16'b0000000011100000;
            end
            if(velocity > 700) begin
                led_on <= 16'b0000000011110000;
            end
            if(velocity > 760) begin
                led_on <= 16'b0000000011111000;
            end
            if(velocity > 820) begin
                led_on <= 16'b0000000011111100;
            end
            if(velocity > 880) begin
                led_on <= 16'b0000000011111110;
            end
            if(velocity > 940) begin
                led_on <= 16'b0000000011111111;
            end
            
            if(velocity < 480) begin
                led_on <= 16'b0000000100000000;
            end
            if(velocity < 420) begin
                led_on <= 16'b0000001100000000;
            end
            if(velocity < 360) begin
                led_on <= 16'b0000011100000000;
            end
            if(velocity < 300) begin
                led_on <= 16'b0000111100000000;
            end
            if(velocity < 240) begin
                led_on <= 16'b0001111100000000;
            end
            if(velocity < 180) begin
                led_on <= 16'b0011111100000000;
            end
            if(velocity < 120) begin
                led_on <= 16'b0111111100000000;
            end
            if(velocity < 60) begin
                led_on <= 16'b1111111100000000;
            end
        end
    end


endmodule
