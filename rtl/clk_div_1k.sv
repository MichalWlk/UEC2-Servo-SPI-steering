`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Michal Walek
// 
// Create Date: 08/02/2024 10:16:12 PM
// Design Name: 
// Module Name: Clk_Div_1k
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: Clock divider 100MHz -> 1kHz (Clock Enable generator)
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_div_1k(
    input clk,
    input rst,
    output clk_1khz
    );


    localparam [16:0] CNT_VAL = 17'd99999; //clk=1kHz

    logic [16:0] ClkCntr = 0;
    logic ClkState = 0;

    assign clk_1khz = ClkState;


    always @(posedge clk) begin
        if(rst) begin
            ClkCntr <= 0;
            ClkState <= 0;
        end 
        else begin
            if(ClkState == 1) begin
                ClkState <= 0;
            end 
            else if(ClkCntr == CNT_VAL) begin
                ClkCntr <= 0;
                ClkState <= 1;
            end 
            else begin
                ClkCntr <= ClkCntr + 1;
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
