`timescale 1ns / 100ps
`default_nettype none

module RefreshingLED1088ASMain#(parameter divisor = 10000000, divisorBits = 20) (
	input wire clk,  // CLK100MHZ
    input wire reset,
    output wire[7:0] rowPins,
    output wire[7:0] colPins
    );
    
	reg[7:0] data[0:7];	// constant data to be displayed
	wire[2:0] colNdx;	// column number/memory to be displayed.
    wire[7:0] rowData;	// data for column specified by colNdx
    wire clk2;			// clock divided by divisor param
        
    ClockDivider#(divisor, divisorBits) clkDiv(clk, reset, clk2);
	RefreshingLED1088AS led(
		.clkIn(clk2),
		.resetIn(reset),
		.rowDataIn(rowData),
		.colAddrOut(colNdx),
		.rowPinsOut(rowPins),
		.colPinsOut(colPins));
		
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
	
	assign rowData = (reset) ? 8'd0 : data[colNdx];
        
endmodule
