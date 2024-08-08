`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Michal Walek
// 
// Create Date: 08/02/2024 10:16:12 PM
// Design Name: 
// Module Name: Clk_Div
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: Simple divider 100MHz -> 66,67KHz
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Clk_Div(
    input clk,
    input rst,
    output clk_div_out
    );


    reg CntVal = 10'd750; //1:15u=66667; 100M:66667=1500; 1500:2=750 (bo rising oraz falling edge w takcie zegara) _|-|_|-| <--2 okresy, 4 zmiany poziomow
    reg ClkCntr;
    reg ClkState = 0;

    assign clk_div_out = ClkState;

    always @(posedge clk) begin
        if(rst) begin
            ClkCntr <= 0;
            ClkState <= 0;
        end else begin
            if(ClkCntr == CntVal) begin
                ClkCntr <= 0;
                ClkState <= ~ClkState;
            end else begin
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

//⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⠖⠒⠢⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⠀⠀⡴⠃⠀⠀⠀⠀⠀⠙⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⠀⣰⠁⠀⠀⠀⠀⠀⠀⠀⠈⠳⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⡰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⣠⠞⠁⠀⠀⠀⠀⠀⠀⠀⠂⠀⠤⠤⡀⠈⠳⣄⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⣠⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⢄⠀⠀⠀⠀⠀⠀
//⢠⠞⠁⠀⣀⣠⣤⠤⠤⠤⠤⢤⣤⠤⠤⠤⠤⣤⣀⣀⡀⠀⠀⠀⠑⢤⠀⠀⠀⠀
//⣣⠔⠚⠻⣄⣡⣞⣄⣠⣆⠀⢼⣼⣄⣀⣀⣠⣆⠜⡘⡻⠟⠙⣲⠦⣈⢳⡀⠀⠀
//⡇⠒⢲⡤⡜⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠙⠛⠤⣖⠬⠓⠂⠉⣿⠇⠀⠀
//⠙⠲⠦⠬⣧⡀⠀⠀⠀⠀⠀⣠⣿⣿⣷⡄⠀⠀⠀⠀⠀⣞⠀⢀⣲⠖⠋⠀⠀⠀
//⠀⠀⠀⠀⠘⣟⢢⠃⠀⠀⠀⠉⠙⠻⠛⠁⠀⠀⠀⢀⡜⠒⢋⡝⠁⢀⣀⣤⠂⠀
//⠀⠀⠀⠀⠀⡇⠷⠆⠶⠖⠀⠀⠀⠀⠀⠀⠀⠀⣠⠮⠤⠟⠉⠀⢰⠱⡾⣧⠀⠀
//⠀⠀⠀⠀⠀⠹⢄⣀⣀⠀⠀⠀⠀⠀⠀⣀⡤⠚⠁⠀⢠⣤⡀⣼⢾⠀⠀⡟⠀⠀
//⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛⠛⠒⡏⠀⡡⠣⢖⣯⠶⢄⣀⣿⡾⠋⢸⢀⡶⠿⠲⡀
//⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⣹⠃⣀⣤⠞⠋⠀⠉⠢⣿⣿⡄⠀⣿⠏⠀⠀⠐⢣
//⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⢱⢡⡾⠋⠀⠀⢀⡐⣦⣀⠈⠻⣇⢸⢁⣤⡙⡆⠈⡏
//⠀⠀⠀⠀⠀⠀⣠⠎⢁⠔⡳⡟⠀⠐⠒⠒⠋⠀⠠⡯⠙⢧⡈⠻⣮⠯⣥⠧⠞⠁
//⠀⠀⠀⣀⠴⠋⠀⢶⠋⢸⡝⠀⠀⠀⠀⠀⠀⠀⠀⣸⢦⠀⠙⡆⠘⠦⢄⡀⠀⠀
//⠀⠀⣸⠅⢀⡤⢺⢸⠀⢸⡃⠤⠀⠀⠀⠀⣀⡤⢚⣋⣿⢄⡀⢇⡀⠀⠀⣝⡶⠀
//⠀⠀⢿⠀⡏⠀⠘⠞⠀⢸⡵⣦⠤⠤⠖⣿⠥⠞⠉⠀⢸⠖⠁⠀⠙⠢⣑⠶⣽⢂
//⠀⠀⠸⠤⠃⠀⠀⠀⠀⠀⠉⢳⠂⠈⡽⠁⠀⠀⠀⢀⡼⠒⠓⢤⠀⠀⠀⠙⠚⠛
//⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠓⡎⠀⠀⠀⠀⢠⠎⣠⠀⠀⠈⢳⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⢸⡶⠗⠋⣱⠄⠀⠀⠀⣧⠀⠀⠀⢀
//⠀⠀⠀⠀⠀⠀⠀⣀⠴⠒⠒⠦⣤⣷⠂⢀⡸⠁⠀⡼⠁⠀⠀⠀⠈⢺⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⢠⠋⢀⣀⡀⠀⠀⠀⠀⠀⠈⡇⠀⠀⠙⠢⠤⠤⣄⡤⠼⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⠑⢦⣄⣉⣑⠢⠄⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠙⠓⠒⠒⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
