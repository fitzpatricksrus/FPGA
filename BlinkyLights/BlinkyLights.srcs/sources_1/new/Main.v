`timescale 1ns / 100ps

module Main(
	input wire CLK100MHZ,
    input wire reset,
    input wire [7:0] rowPins,
    input wire [7:0] colPins
    );
    
    wire [2:0] colNdx;
    reg [7:0] rowData = 0;
    
    Counter#(3) counter(CLK100MHZ, reset, colNdx);
    LED1088AS ldx(CLK100MHZ, reset, rowData, colNdx, rowPins, colPins);
	reg[7:0] data[0:7];
	    
	initial begin
		data[3'b000] = 8'b10000001;
		data[3'b001] = 8'b01000010;
		data[3'b010] = 8'b00100100;
		data[3'b011] = 8'b00011000;
		data[3'b100] = 8'b00011000;
		data[3'b101] = 8'b00100100;
		data[3'b110] = 8'b01000010;
		data[3'b111] = 8'b10000001;
	end
	
    always@(posedge reset) begin
    	rowData <= 0;
    end
    
    always@(colNdx) begin
//    	rowData <= 8'b11111111 << colNdx;
    	rowData <= data[colNdx];
		$display("colNdx=%d rowData=%d", colNdx, data[colNdx]);
    end
    
endmodule
