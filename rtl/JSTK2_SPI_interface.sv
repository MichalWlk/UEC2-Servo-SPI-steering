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
    output SCLK,
    output [10:0] x_val,
    output [10:0] y_val
    );
    
    wire [39:0] xy_values;
    wire clk_66kHz;

    logic [0:0] zero = 0;

    assign SCLK = clk_66kHz;
    assign y_val = {zero, xy_values[25:24], xy_values[39:32]};    //zalezy od orientacji joysticka(teraz: jstk zapiety w bok; normalnie to jest os X)
    assign x_val = {zero, xy_values[9:8], xy_values[23:16]};      //potencjalny problem: wychylenie do gory moze dac 0 a do dolu 1000 => zmienic > / < w left/right ctrl


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
