`timescale 1ns / 1ps

module Seg7Display(
    input wire [3:0] value,
    output reg [7:0] led
    );

 	//  aa
 	// f  b
 	// f  b
 	//  gg
 	// e  c
 	// e  c
 	//  dd  hh

    localparam SEG_H = 8'b00000001;
    localparam SEG_G = 8'b00000010;
    localparam SEG_F = 8'b00000100;
    localparam SEG_E = 8'b00001000;
    localparam SEG_D = 8'b00010000;
    localparam SEG_C = 8'b00100000;
    localparam SEG_B = 8'b01000000;
    localparam SEG_A = 8'b10000000;
    localparam SEG_OFF = 8'b00000000;
    
    localparam DIG_0 = SEG_A + SEG_B + SEG_C + SEG_D + SEG_E + SEG_F;
    localparam DIG_1 = SEG_B + SEG_C;
    localparam DIG_2 = SEG_A + SEG_B + SEG_D + SEG_E + SEG_G;
    localparam DIG_3 = SEG_A + SEG_B + SEG_C + SEG_D + SEG_G;
    localparam DIG_4 = SEG_F + SEG_B + SEG_G + SEG_C;
    localparam DIG_5 = SEG_A + SEG_F + SEG_G + SEG_C + SEG_D;
    localparam DIG_6 = SEG_A + SEG_B + SEG_G + SEG_E + SEG_C + SEG_D;
    localparam DIG_7 = SEG_A + SEG_B + SEG_C;
    localparam DIG_8 = SEG_A + SEG_B + SEG_C + SEG_D + SEG_E + SEG_F + SEG_G;
    localparam DIG_9 = SEG_A + SEG_B + SEG_C + SEG_F + SEG_G;
    localparam DIG_A = SEG_C + SEG_D + SEG_E + SEG_G + SEG_H;
    localparam DIG_B = SEG_C + SEG_D + SEG_E + SEG_F + SEG_G;
    localparam DIG_C = SEG_D + SEG_E + SEG_G;
    localparam DIG_D = SEG_B + SEG_G + SEG_E + SEG_C + SEG_D;
    localparam DIG_E = SEG_A + SEG_D + SEG_E + SEG_F + SEG_G;
    localparam DIG_F = SEG_A + SEG_E + SEG_F + SEG_G;    
        
    always@(*)
    begin
        casez(value)
            4'h0 : led = DIG_0;
            4'h1 : led = DIG_1;
            4'h2 : led = DIG_2;
            4'h3 : led = DIG_3;
            4'h4 : led = DIG_4;
            4'h5 : led = DIG_5;
            4'h6 : led = DIG_6;
            4'h7 : led = DIG_7;
            4'h8 : led = DIG_8;
            4'h9 : led = DIG_9;
            4'hA : led = DIG_A;
            4'hB : led = DIG_B;
            4'hC : led = DIG_C;
            4'hD : led = DIG_D;
            4'hE : led = DIG_E;
            4'hF : led = DIG_F;
            default:
                led = SEG_OFF;
        endcase
    end

endmodule
