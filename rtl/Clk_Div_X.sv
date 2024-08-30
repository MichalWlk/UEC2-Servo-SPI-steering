`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gabriel Ptasinski
// 
// Create Date: 08/02/2024 10:16:12 PM
// Design Name: 
// Module Name: Clk_Div
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: Clock divider 100MHz -> 40kHz (Clock Enebale generator)
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Clk_Div_X(
    input clk,
    input rst,
    output clk_div_out
    );

    
    localparam [11:0] CNT_VAL = 12'd2499; //clk=40kHz

    logic [11:0] ClkCntr;
    logic ClkState = 0;

    assign clk_div_out = ClkState;

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
