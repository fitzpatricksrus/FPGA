`timescale 1ns / 1ps
`default_nettype none

module BinaryCounter#(parameter bits=4, outBits=bits) (
    input wire clk,
    input wire reset,
    output wire[outBits-1:0] countOut
    );
    
    reg[bits-1:0] count = 0;
    
    always_ff@(posedge clk, posedge reset) begin
    	if (reset) begin
    		count <= 0;
    	end else begin
			count <= count + 1;
	    end
    end
    
    assign countOut = count[bits-1:bits-outBits];
    
endmodule
