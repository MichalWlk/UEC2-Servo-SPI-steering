`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Michal Walek
// 
// Create Date: 08/02/2024 10:16:12 PM
// Design Name: 
// Module Name: Counter_X
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: Adds 1 to variable value every 100 clock cycles. 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Counter_X(
    input clk,
    input rst,
    output logic [11:0] cntd_val
    );

    reg [11:0] value;
    reg [6:0] count100;

    assign cntd_val = value;

    always @(posedge clk) begin
        if(rst) begin
            value <= 0;
            count100 <= 0;
        end else begin
            if(value == 3000) begin
                value <= 0;
                count100 <= 0;
            end else begin
                if(count100 == 100) begin
                    value <= value + 1;
                    count100 <= 0;
                end else begin
                    count100 <= count100 + 1;
                end
            end
        end
    end


endmodule
