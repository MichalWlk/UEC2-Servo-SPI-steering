`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2024 10:11:48 PM
// Design Name: 
// Module Name: SPI_Ctrl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
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
    output SS,
    output [39:0] DOUT
    );
    
reg SS_Ctrl;
reg [39:0] SR;
reg [39:0] SR_temp;
reg [5:0] BitCntr;
    
    always @(posedge clk)
    begin
        if(rst)
        begin
            SS_Ctrl <= 1'b1;
            SR <= 0;
            SR_temp <= 0; 
            BitCntr <= 0;         
        end
        else begin
            SS_Ctrl <= 1'b0;        //trzeba ustawic 0 przed przesunieciem SR -> maszyna stanow
            SR_temp <= {SR_temp[38:0], MISO};
            BitCntr <= BitCntr + 1;
            if(BitCntr == 6'd40)
            begin
                BitCntr <= 0;
                SR <= SR_temp;                
            end else
            begin
                SR <= SR;
            end
        end
    end
    
    
    assign DOUT = SR;
    
endmodule
