`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Michal Walek
// 
// Create Date: 08/02/2024 10:03:50 PM          
// Design Name: 
// Module Name: char_ctrl
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


module char_ctrl(
    input clk,
    input rst,
    input ce,
    input logic [10:0] x_val,
    output logic [6:0] char_sel
    );
    
    parameter [6:0] D = 7'b0100001;
    parameter [6:0] N = 7'b0101011;
    parameter [6:0] R = 7'b0101111;
    parameter [6:0] RESET = 7'b1111111;
    
   always @(posedge clk) begin
    if(rst) begin
        char_sel <= RESET;
    end else if(ce == 1) begin
        if(x_val > 1520) begin
            char_sel <= D;
        end else if(x_val < 1480) begin
            char_sel <= R;
        end else begin
            char_sel <= N;
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
