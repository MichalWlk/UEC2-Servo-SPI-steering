`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Michal Walek
// 
// Create Date: 08/02/2024 10:16:12 PM
// Design Name: 
// Module Name: Turn_y_val_limiter
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: Limits maximum turn angle to ~45 degrees (instead of 90, to prevent mechanical failure)
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module y_val_limiter(
    input clk,
    input rst,
    input logic [10:0] y_val,
    output logic [10:0] y_val_lim
    );

    assign y_val_lim = y_val - 300;

/*
    always @(posedge clk) begin
        if(rst) begin
            y_val_lim <= 0;
        end else begin
            if(y_val > 1500) begin
                y_val_lim <= 1500;
            end else begin
                if(y_val < 500) begin
                    y_val_lim <= 500;
                end else begin
                    y_val_lim <= y_val;
                end
            end
        end
    end
*/

/*
    always @(posedge clk) begin
        if(rst) begin
            y_val_lim <= 0;
        end else begin
            if((y_val%2) == 1) begin
                if(y_val > 1500) begin
                    y_val_lim <= (1500 + ((y_val-1501)/2));
                end else begin
                    y_val_lim <= (1500 - ((500 - (y_val - 1001)) / 2));
                end
            end else begin
                if(y_val > 1500) begin
                    y_val_lim <= (1500 + ((y_val-1500)/2));
                end else begin
                    y_val_lim <= (1500 - ((500 - (y_val - 1000)) / 2));
                end
            end
        end
    end
*/


endmodule
