`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Michal Walek
// 
// Create Date: 08/02/2024 10:16:12 PM
// Design Name: 
// Module Name: Clk_Div_5Hz
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: Clock divider 100MHz -> 5Hz (Clock Enable generator)
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Clk_Div_5Hz(
    input clk,
    input rst,
    output clk_5hz
    );


    localparam [24:0] CNT_VAL = 25'd19999999; //clk=5Hz

    logic [24:0] ClkCntr = 0;
    logic ClkState = 0;

    assign clk_5hz = ClkState;


    always @(posedge clk) begin
        if(rst) begin
            ClkCntr <= 0;
            ClkState <= 0;
        end 
        else begin
            if(ClkState == 1) begin
                ClkState <= 0;
            end 
            else if(ClkCntr == CNT_VAL) begin
                ClkCntr <= 0;
                ClkState <= 1;
            end 
            else begin
                ClkCntr <= ClkCntr + 1;
            end
        end
    end


endmodule

//
//                 __
//                / _)
//       _.----._/ /
//      /         /
//   __/ (  | (  |
//  /__.-'|_|--|_|
//
