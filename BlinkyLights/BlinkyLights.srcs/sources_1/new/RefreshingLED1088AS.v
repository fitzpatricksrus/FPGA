`timescale 1ns / 1ps
`default_nettype none

/*
	LED1088AS LED matrix that pulls data from an 8x8 memory and uses that
	to refresh the LEDs. On rising clk, the colAddr is output. On falling
	edge, rowData is latched and rowPins/colPins are output.
*/
module RefreshingLED1088AS(
    input wire clkIn,
    input wire resetIn,
    input wire[7:0] rowDataIn,
    output wire[2:0] colAddrOut,
    output wire[7:0] rowPinsOut,
    output wire[7:0] colPinsOut
    );
    
    wire clkDiv2;
    Counter#(1) clkDivider(
    	.clk(clkIn),
    	.reset(resetIn),
    	.count(clkDiv2));
    
    // counter from 0 - 7 for column index/address
    Counter#(3) counter(
    	.clk(clkDiv2), 
    	.reset(resetIn),
    	.count(colAddrOut));

	// out of phase clock to facilitate latching after memory is stable
    wire clk2;
    assign clk2 = ~clkDiv2;
    
    // LED matrix driven by out of phase clock	
    LED1088AS led(
    	.clk(clk2), 
    	.reset(resetIn), 
    	.rowData(rowDataIn), 
    	.colNdx(colAddrOut), 
    	.rowPins(rowPinsOut), 
    	.colPins(colPinsOut));

endmodule
