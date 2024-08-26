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
// Description: Checks which LEDs should be lit based on the value of JSTK x axis. Visualizes the velocity by the lenght of led strip.
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
        end else begin
            case(velocity)

                (velocity > 940)    :   led_on <= 16'b0000000011111111;
                (velocity > 880)    :   led_on <= 16'b0000000011111110;
                (velocity > 820)    :   led_on <= 16'b0000000011111100;
                (velocity > 760)    :   led_on <= 16'b0000000011111000;
                (velocity > 700)    :   led_on <= 16'b0000000011110000;
                (velocity > 640)    :   led_on <= 16'b0000000011100000;
                (velocity > 580)    :   led_on <= 16'b0000000011000000;
                (velocity > 520)    :   led_on <= 16'b0000000010000000;

                (velocity < 60)     :   led_on <= 16'b1111111100000000;
                (velocity < 120)    :   led_on <= 16'b0111111100000000;
                (velocity < 180)    :   led_on <= 16'b0011111100000000;
                (velocity < 240)    :   led_on <= 16'b0001111100000000;
                (velocity < 300)    :   led_on <= 16'b0000111100000000;
                (velocity < 360)    :   led_on <= 16'b0000011100000000;
                (velocity < 420)    :   led_on <= 16'b0000001100000000;
                (velocity < 480)    :   led_on <= 16'b0000000100000000;

                default    :   led_on <= 16'b0000000000000000;
            endcase
        end
    end


endmodule
