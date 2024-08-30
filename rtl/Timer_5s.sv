`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Michal Walek
// 
// Create Date: 08/02/2024 10:16:12 PM
// Design Name: 
// Module Name: Timer_5s
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: Timer. Checkes if both bumpers are being pressed to starts counting 5s during which it sets 1 at its output.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Timer_5s(
    input clk,
    input rst,
    input x_bumper,
    input y_bumper,
    output logic backtrack_active
    );


    localparam [26:0] CNT_VAL_1s = 27'd100000000; //counts 1s
    
    logic [2:0] Cntr_5s = 0;
    logic [26:0] Counter = 0;
    logic TimerState = 0;

    assign backtrack_active = TimerState;


    always @(posedge clk) begin
        if(rst) begin
            Counter <= 0;
            Cntr_5s <= 0;
            TimerState <= 0;
        end 
        else begin
            if(TimerState) begin
                if(Counter == CNT_VAL_1s) begin
                    Counter <= 0;
                    Cntr_5s <= Cntr_5s + 1;
                end 
                else begin
                    Counter <= Counter + 1;
                end
                if(Cntr_5s == 5) begin
                    Cntr_5s <= 0;
                    TimerState <= 0;
                end
            end 
            else begin
                if(x_bumper && y_bumper == 1) begin
                    Counter <= 0;
                    Cntr_5s <= 0;
                    TimerState <= 1;
                end 
                else begin
                    TimerState <= 0;
                end
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
