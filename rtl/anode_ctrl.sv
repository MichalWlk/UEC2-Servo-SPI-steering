`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Michal Walek
// 
// Create Date: 08/02/2024 10:03:50 PM          
// Design Name: 
// Module Name: anode_ctrl
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: Ring counter that swithces between 4 different anodes
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module anode_ctrl(
    input clk,
    input rst,
    input ce,
    output logic [3:0] an_sel
    );
    

    logic [3:0] selected = 4'b1110;

    assign an_sel = selected;


    always @(posedge clk) begin
        if(rst) begin
            selected <= 4'b1110;
        end 
        else if(ce == 1) begin
            selected <= {selected[2:0], selected[3]};
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
