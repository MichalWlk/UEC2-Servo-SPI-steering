`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Michal Walek
// 
// Create Date: 08/02/2024 10:16:12 PM
// Design Name: 
// Module Name: Val_SR
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: FILO Shift Register that stores xy values (ranging 5sec back sampled 5Hz)
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Val_SR(
    input clk,
    input rst,
    input ce,
    input backtrack_active,
    input logic [10:0] x_val,
    input logic [10:0] y_val,
    output logic [10:0] x_val_out,
    output logic [10:0] y_val_out
    );


    logic [549:0] xy_reg = 0;


    always @(posedge clk or posedge rst) begin
        if(rst) begin
            x_val_out <= 0;
            y_val_out <= 0;
            xy_reg <= 0;
        end 
        else if(ce == 1) begin
            if(backtrack_active) begin
                xy_reg <= {xy_reg[21:0], xy_reg[549:22]};
                x_val_out <= {xy_reg[21:11]};
                y_val_out <= {xy_reg[10:0]};
            end 
            else begin
                xy_reg <= {xy_reg[527:0], x_val, y_val};
                x_val_out <= 1500;
                y_val_out <= 1200;
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
