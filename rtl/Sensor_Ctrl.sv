`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Michal Walek
// 
// Create Date: 08/02/2024 10:11:48 PM
// Design Name: 
// Module Name: Sensor_Ctrl
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: Checkes whether or not promixmity sensors detected an obsticle, and stops platform accordingly
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Sensor_Ctrl(
    input clk,
    input rst,
    input prox_FR,  //front right
    input prox_FL,  //front left
    input prox_RR,  //rear right
    input prox_RL,  //rear left
    input logic [10:0] x_val,
    output logic [10:0] x_val_checked
    );


    always @(posedge clk) begin
        if(rst) begin
            x_val_checked <= 0;
        end else begin
            if((prox_FR && prox_FL) == 1) begin
                if(x_val > 1500) begin
                    x_val_checked <= 1500;
                end else begin
                    x_val_checked <= x_val;
                end
            end else begin
                if((prox_RR && prox_RL) == 1) begin
                    if(x_val < 1500) begin
                        x_val_checked <= 1500;
                    end else begin
                        x_val_checked <= x_val;
                    end
                end else begin
                    x_val_checked <= x_val;
                end
            end
        end
    end

/*
//rear obsticle
    always @(posedge clk) begin
        if(rst) begin
            x_val_checked <= 0;
        end else begin
            if((prox_RR && prox_RL) == 1) begin
                if(x_val < 1500) begin
                    x_val_checked <= 1500;
                end else begin
                    x_val_checked <= x_val;
                end
            end else begin
                x_val_checked <= x_val;
            end
        end
    end
*/

endmodule

//
//                 __
//                / _)
//       _.----._/ /
//      /         /
//   __/ (  | (  |
//  /__.-'|_|--|_|
//

