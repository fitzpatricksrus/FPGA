`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2020 11:13:38 AM
// Design Name: 
// Module Name: seg7
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


module seg7(
    input [3:0] sw,
    output [3:0] led,
    output reg [7:0] out
    );
    
    localparam SEG_A = 8'b00000001;
    localparam SEG_B = 8'b00000010;
    localparam SEG_C = 8'b00000100;
    localparam SEG_D = 8'b00001000;
    localparam SEG_E = 8'b00010000;
    localparam SEG_F = 8'b00100000;
    localparam SEG_G = 8'b01000000;
    localparam SEG_H = 8'b10000000;
    localparam SEG_OFF = 8'b00000000;
    
    assign led = sw;
    
    always@(*)
    begin
        casez(sw)
            4'h0 : out = SEG_A;
            4'h1 : out = SEG_B;
            4'h2 : out = SEG_C;
            4'h3 : out = SEG_D;
            4'h4 : out = SEG_E;
            4'h5 : out = SEG_F;
            4'h6 : out = SEG_G;
            4'h7 : out = SEG_H;
            4'h8 : out = SEG_OFF;
            4'h9 : out = SEG_OFF;
            4'hA : out = SEG_OFF;
            4'hB : out = SEG_OFF;
            4'hC : out = SEG_OFF;
            4'hD : out = SEG_OFF;
            4'hE : out = SEG_OFF;
            4'hF : out = SEG_OFF;
            default:
                out = SEG_OFF;
        endcase
    end
    
endmodule
