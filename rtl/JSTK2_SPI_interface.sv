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
// Description: pmod JSTK2 communication structure module (for Y values)
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
    output [10:0] y_val,
    output y_bumper
    );
    
    wire [39:0] xy_values;
    wire clk_40khz;

    logic [0:0] zero = 0;

    assign y_val = {zero, xy_values[25:24], xy_values[39:32]};    //zalezy od orientacji joysticka
    assign y_bumper = {xy_values[1]};


    SPI_Ctrl SPI_Ctrl(
    .clk(clk),
    .rst(rst),
    .ce(clk_40khz),
    .MISO(MISO),
    .SCLK(SCLK),
    .SS(SS),
    .DOUT(xy_values)
    );
    
    Clk_Div Clk_Div(
    .clk(clk),
    .rst(rst),
    .clk_div_out(clk_40khz)
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
