`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gabriel Ptasinski
// 
// Create Date: 08/02/2024 10:03:50 PM          
// Design Name: 
// Module Name: JSTK2_SPI_interface
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: pmod JSTK2 communication structure module (for X values)
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module JSTK_SPI_if_X(
    input clk,
    input rst,
    input MISO,
    output SS,
    output SCLK,
    output [10:0] x_val,
    output x_bumper
    );
    
    wire [39:0] xy_values;
    wire clk_40kHz;

    logic [0:0] zero = 0;

    assign x_val = {zero, xy_values[9:8], xy_values[23:16]};
    assign x_bumper = {xy_values[1]};


    SPI_Ctrl_X SPI_Ctrl_X(
    .clk(clk),
    .rst(rst),
    .ce(clk_40kHz),
    .MISO(MISO),
    .SCLK(SCLK),
    .SS(SS),
    .DOUT(xy_values)
    );
    
    Clk_Div_X Clk_Div_X(
    .clk(clk),
    .rst(rst),
    .clk_div_out(clk_40kHz)
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
