`timescale 1ns / 100ps
`default_nettype none

module LEDMatrix8x8 #(parameter rowBits=3, colBits=3)(
    input wire clk,
    input wire reset,
    output wire [(2**rowBits)-1:0] rows,
    output wire [(2**colBits)-1:0] cols,
    output wire [colBits-1:0] colNdx
    );

    localparam colSize = 2**colBits;
        
	// counter cycles through the columns by index
    Counter#(.bits(colBits)) counter(.clk(clk), .reset(reset), .count(colNdx));

    // output the col demux for current column
    DeMux#(.ndxBits(colBits)) colDeMux(.ndx(colNdx), .out(cols));

	// output the row data for current column
    MatrixData#(.rowNdxBits(rowBits), .colNdxBits(colBits)) dataIn(colNdx, rows);    

endmodule