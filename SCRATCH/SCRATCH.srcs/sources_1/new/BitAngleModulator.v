`timescale 1ns / 1ps
`default_nettype none

module BitAngleModulator#(parameter bits=4)(
    input wire clk,
    input wire reset,
    input wire[bits-1:0] value,
    output wire led
    );
    
    wire[bits-1:0] count;
   	BinaryCounter#(.bits(bits)) counter(.clk(clk), .reset(reset), .countOut(count));
    
    assign led = value > count;
    
endmodule
