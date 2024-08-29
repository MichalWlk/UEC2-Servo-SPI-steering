`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Michal Walek
// 
// Create Date: 08/02/2024 10:03:50 PM          
// Design Name: 
// Module Name: sseg_ctrl
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


module sseg_ctrl(
    input clk,
    input rst,
    input logic [10:0] x_val,
    input backtrack_active,
    output logic [3:0] sseg_an,
    output logic [6:0] sseg_char
    );
    
    wire [3:0] an_sel;
    wire [6:0] char_sel;
    wire CE, backtrack_active;

    clk_div_1k clk_dic_1k(
    .clk(clk),
    .rst(rst),
    .clk_1khz(CE)
    );

   anode_ctrl anode_ctrl(
    .clk(clk),
    .rst(rst),
    .ce(CE),
    .an_sel(an_sel)
   );

    char_ctrl char_ctrl(
    .clk(clk),
    .rst(rst),
    .ce(CE),
    .x_val(x_val),
    .char_sel(char_sel)
    );

    sseg_out sseg_out(
    .clk(clk),
    .rst(rst),
    .ce(CE),
    .backtrack_active(backtrack_active),
    .an_sel(an_sel),
    .char_sel(char_sel),
    .an_out(sseg_an),
    .char_out(sseg_char)
    );


endmodule

//
//                 __
//                / _)
//       _.----._/ /
//      /         /
//   __/ (  | (  |
//  /__.-'|_|--|_|
//
