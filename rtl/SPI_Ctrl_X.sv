`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gabriel Ptasinski
// 
// Create Date: 08/02/2024 10:11:48 PM
// Design Name: 
// Module Name: SPI_Ctrl
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: Receives 5 bytes of data and holds that value at DOUT until next data package is received.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SPI_Ctrl_X(
    input clk,
    input rst,
    input ce,
    input MISO,
    output SCLK,
    output logic SS,
    output [39:0] DOUT
    );
    

    parameter   Init = 2'b00,
                Receive = 2'b01,
                Done = 2'b11;
    
    logic [39:0] SR;
    logic [39:0] SR_temp;
    logic [5:0] BitCntr;
    logic [1:0] State = Init;

    assign SCLK = (SS == 1'b0) ? ce : 1'b0;
    assign DOUT = SR;


    always @(negedge clk)
    begin
        if(rst) begin
            SS <= 1'b1;
            SR <= 0;
            SR_temp <= 0; 
            BitCntr <= 0;
            State <= Init;
        end
        else if(ce == 1) begin
            case (State)
                Init: begin
                    SS <= 0;
                    SR <= SR;
                    State <= Receive;
                end

                Receive: begin
                    SR_temp <= {SR_temp[38:0], MISO};
                    BitCntr <= BitCntr + 1;
                    SR <= SR;
                    if(BitCntr == 6'd39) begin
                        SS <= 1'b1;
                        State <= Done;               
                    end 
                    else begin
                        SS <= 1'b0;
                        State <= Receive;
                    end
                end
                
                Done: begin
                    SR <= SR_temp;
                    BitCntr <= 0;
                    State <= Init;
                end
            endcase
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

