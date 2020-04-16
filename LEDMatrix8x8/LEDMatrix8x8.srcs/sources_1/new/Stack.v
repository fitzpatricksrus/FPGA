`timescale 1ns / 1ps
`default_nettype none

module Stack #(parameter dataSize=8, ndxSize=4) (
	input wire clk,
	input wire reset,
    input wire push,
    input wire pop,
    input wire [dataSize-1:0] wData,
    output wire [ndxSize-1:0] size,
    output reg [dataSize-1:0] tos,
    output wire empty,
    output wire full
    );
    
    localparam maxIndex = 2**ndxSize;
    reg[dataSize-1:0] stackData[maxIndex-1:0];
    reg[ndxSize-1:0] stackNdx;

	assign size = stackNdx;
	assign empty = stackNdx == 0;
	assign full = stackNdx == maxIndex;
    
    always@(posedge clk, posedge reset) begin
    	if (reset) begin
    		stackNdx <= 0;
    		stackData[0] <= 0;
			tos = 0;
    	end
    	else if (pop == 1 && push == 0) begin
    		if (!empty) begin
	    		stackNdx <= stackNdx - 1;
	    		if (size > 1) begin
	    			tos <= stackData[stackNdx - 2];
	    		end
	    		else begin
	    			tos = 0;
	    		end
    		end
		end
		else if (pop == 0 && push == 1) begin
			if (!full) begin
	    		stackData[stackNdx] <= wData;
    			stackNdx <= stackNdx + 1;
    			tos <= wData;
    		end
    	end
    	else if (push == 1 && pop == 1) begin
    		if (!empty) begin 
	    		stackData[stackNdx] = wData;
    			tos <= wData;
    		end
    	end
    end
    
endmodule
