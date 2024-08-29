`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Michal Walek
// 
// Create Date: 08/02/2024 10:03:50 PM          
// Design Name: 
// Module Name: sseg_out
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: Structural module for 7-segment display
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sseg_out(
    input clk,
    input rst,
    input backtrack_active,
    input logic [3:0] an_sel,
    input logic [6:0] char_sel,
    output logic [3:0] an_out,
    output logic [6:0] char_out
    );
    
    parameter [6:0] T = 7'b0000111;
    parameter [6:0] D = 7'b0100001;
    parameter [6:0] N = 7'b0101011;
    parameter [6:0] R = 7'b0101111;
    parameter [6:0] NO_CHAR = 7'b1111111;
    
    always @(posedge clk) begin
        if(rst) begin
            an_out <= 0;
            char_out <= 0;
        end else begin
            if(backtrack_active == 1) begin
                char_out <= T;
                an_out <= 4'b0111;
            end else if((char_sel == D) && (an_sel == 4'b1011)) begin
                char_out <= char_sel;
                an_out <= an_sel;
            end else if((char_sel == N) && (an_sel == 4'b1101)) begin
                char_out <= char_sel;
                an_out <= an_sel;
            end else if((char_sel == R) && (an_sel == 4'b1110)) begin
                char_out <= char_sel;
                an_out <= an_sel;
            end else begin
                char_out <= NO_CHAR;
                an_out <= an_sel;
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
