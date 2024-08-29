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
// Description: Top module for BackTrack(TM) function
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Backtrack(
    input clk,
    input rst,
    input x_bumper,
    input y_bumper,
    input logic [10:0] x_val,
    input logic [10:0] y_val,
    output logic [10:0] x_val_out,
    output logic [10:0] y_val_out,
    output backtrack_active
    );


    wire timer_active, CE_5hz;

    wire [10:0] x_val_stored, y_val_stored, x_val_op, y_val_op;

    assign x_val_out = (timer_active) ? x_val_op : x_val;
    assign y_val_out = (timer_active) ? y_val_op : y_val;
    assign backtrack_active = timer_active;

    Timer_5s Timer_5s(
    .clk(clk),
    .rst(rst),
    .x_bumper(x_bumper),
    .y_bumper(y_bumper),
    .backtrack_active(timer_active)
    );
    
    Val_SR Val_SR(
    .clk(clk),
    .rst(rst),
    .ce(CE_5hz),
    .backtrack_active(timer_active),
    .x_val(x_val),
    .y_val(y_val),
    .x_val_out(x_val_stored),
    .y_val_out(y_val_stored)
    );

    Clk_Div_5Hz Clk_Div_5Hz(
    .clk(clk),
    .rst(rst),
    .clk_5hz(CE_5hz)
    );

    Action_Translator Action_Translator(
    .clk(clk),
    .rst(rst),
    .x_val(x_val_stored),
    .y_val(y_val_stored),
    .x_val_op(x_val_op),
    .y_val_op(y_val_op)
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
