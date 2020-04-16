`timescale 1ns / 1ps
`default_nettype none

module LEDMatrix8x8 #(parameter rowBits=3, colBits=3)(
    input wire [0:0] clk,
    input wire [(2**rowBits)*(2**colBits)-1:0] data,
    output reg [(2**rowBits)-1:0] rows,
    output wire [(2**colBits)-1:0] cols
    );
    
    localparam rowSize = 2**rowBits;
    localparam colSize = 2**colBits;
    
    wire maxTick;
    wire [colBits-1:0] colNdx;
    
    Counter#(.bits(3), .intervalBegin(0), .intervalEnd(7)) counter(.clk(clk), .reset(1'b0), .maxTick(maxTick), .count(colNdx));
    DeMux#(.bits(8'h03)) colDeMux(.ndx(colNdx), .out(cols));
    
    reg [rowBits-1:0] i;

    always@(cols) begin
    	for (i = 0; i < rowSize; i = i + 1) begin	
	    	rows[i] = data[rowSize*colNdx + i];
	    end
    end
        
endmodule
