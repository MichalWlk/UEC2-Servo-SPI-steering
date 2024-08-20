`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Michal Walek
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


module SPI_Ctrl(
    input clk,
    input rst,
    input MISO,
    output logic SS,
    output [39:0] DOUT
    );
    
reg SS_Ctrl; //WAZNE: zakladam, ze podanie ponownie 0 na SS (active low) rozpoczyna przesylanie paczki 5 bajtow od poczatku (a nie SCLK - jesli tak to konieczna modyfikacja)
reg [39:0] SR;
reg [39:0] SR_temp;
reg [5:0] BitCntr;
reg [1:0] State;
    
parameter   Init = 2'b00,
            Receive = 2'b01,
            Done = 2'b11;


    always @(posedge clk)
    begin
        if(rst)
        begin
            SS <= 1'b1;
            SR <= 0;
            SR_temp <= 0; 
            BitCntr <= 0;
            State <= Init;
        end
        else begin
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
                    if(BitCntr == 6'd40) begin
                        SS <= 1;
                        State <= Done;               
                    end else begin
                        SS <= 0;
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
    
    
    assign DOUT = SR;

    //assign SS = SS_Ctrl;
    
endmodule

//
//                 __
//                / _)
//       _.----._/ /
//      /         /
//   __/ (  | (  |
//  /__.-'|_|--|_|
//

