`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Michal Walek
// 
// Create Date: 08/02/2024 10:16:12 PM
// Design Name: 
// Module Name: Turn_Ctrl
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: Generates PWM signal by cheking if x value (from SPI +1000) is higher or lower than counted value (counts 1000 in 1ms; T = 20ms (50Hz))
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Turn_Ctrl(
    input clk,
    input rst,
    input logic [11:0] cntr_val,
    input logic [9:0] y_val,
    output pwm_turn
    );

    logic pwm_state;

    assign pwm_turn = pwm_state;

    always @(posedge clk) begin
        if(rst) begin
            pwm_state <= 0;
        end else begin
            if(cntr_val < y_val) begin  //bedzie dzialac tylko jesli wychelnie jstk w prawo daje 1000 a w lewo 0
                pwm_state <= 1'b1;
            end else begin
                pwm_state <= 1'b0;
            end
        end
    end


endmodule
