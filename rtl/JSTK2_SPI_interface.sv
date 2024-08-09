`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Michal Walek
// 
// Create Date: 08/02/2024 10:03:50 PM          
// Design Name: 
// Module Name: JSTK2_SPI_interface
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: pmod JSTK2 communication top module
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module JSTK2_SPI_interface(
    input clk,
    input rst,
    input MISO,
    output SS,
    output SCLK
    );
    
    wire [39:0] xy_values;
    wire clk_66kHz;

    SPI_Ctrl SPI_Ctrl(
    .clk(clk_66kHz),
    .rst(rst),
    .MISO(MISO),
    .SS(SS),
    .DOUT(xy_values)
    );
    
    Clk_Div Clk_Div(
    .clk(clk),
    .rst(rst),
    .clk_div_out(clk_66kHz)
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
