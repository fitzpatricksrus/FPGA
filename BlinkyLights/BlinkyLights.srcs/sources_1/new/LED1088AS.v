`timescale 1ns / 100ps
`default_nettype none

module LED1088AS(
    input wire clk,
    input wire reset,
    input wire [7:0] rowData,
    input wire [2:0] colNdx,
    output reg [7:0] rowPins,
    output reg [7:0] colPins
    );
    
    wire [7:0] colData;
    DeMux#(.ndxBits(3)) dm(.ndx(colNdx), .out(colData));
    
    initial begin
    	rowPins <= 8'b00000000;
    	colPins <= 8'b00000000;
    end
    
    always@(posedge clk, posedge reset) begin
    	if (reset) begin
			rowPins <= 8'b00000000;
			colPins <= 8'b00000000;
		end else begin
			rowPins <= rowData;
			colPins <= colData;
		end
    end
endmodule
