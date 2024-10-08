`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Michal Walek
// 
// Create Date: 08/02/2024 10:16:12 PM
// Design Name: 
// Module Name: Action_Translator
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: Translates x_val into opposite movement
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Action_Translator(
    input clk,
    input rst,
    input logic [10:0] x_val,
    input logic [10:0] y_val,
    output logic [10:0] x_val_op,
    output logic [10:0] y_val_op
    );


    always @(posedge clk) begin
        if(rst) begin
            x_val_op <= 0;
            y_val_op <= 0;
        end 
        else begin
            y_val_op <= y_val;  //no change required
            if(x_val > 1500) begin
                x_val_op <= (1000 + (2000 - x_val));
            end 
            else begin
                x_val_op <= (1500 + (1500 - x_val));
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
