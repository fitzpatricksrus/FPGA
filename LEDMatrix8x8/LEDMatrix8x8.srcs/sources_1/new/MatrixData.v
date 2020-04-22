`timescale 1ns / 1ps
`default_nettype none

module MatrixData#(parameter rowNdxBits=3, colNdxBits=3)(
    input wire [colNdxBits-1:0] col,
    output wire [2**rowNdxBits-1:0] rowData
    );
    
    localparam [colNdxBits-1:0] maxColBit = 2**colNdxBits - 1;
    localparam [rowNdxBits-1:0] maxRowBit = 2**rowNdxBits - 1;
    
    reg [maxRowBit:0] data[maxColBit:0];
    initial begin
    	data[0] <= 8'b00000011;
    	data[1] <= 8'b00000110;
    	data[2] <= 8'b00001100;
    	data[3] <= 8'b00011000;
    	data[4] <= 8'b00110000;
    	data[5] <= 8'b01100000;
    	data[6] <= 8'b11000000;
    	data[7] <= 8'b10000001;
    end

    assign rowData = data[col];
endmodule
