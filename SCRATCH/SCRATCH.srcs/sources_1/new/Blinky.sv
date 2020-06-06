`timescale 1ns / 1ps
`default_nettype none

module Blinky#(parameter bits=25)(
    input wire CLK12MHZ,
    output wire[3:0] led,	// [invDiv,div,baseClock]
    output wire led0_r,
    output wire led1_r
    );
    
    reg[bits-1:0] count;
    
    initial begin
    	count = 0;
    end
    
    always@(posedge CLK12MHZ) begin
    	count <= count + 1;
    end
    
    assign led = count[bits-1:bits-4];
endmodule
