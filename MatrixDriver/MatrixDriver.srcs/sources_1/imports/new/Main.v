`timescale 1ns / 100ps
`default_nettype none

module Main#(parameter divisor = 10000000, divisorBits = 20) (
	input wire CLK100MHZ,
    input wire resetSwitch,
    input wire[3:0] sw,
    output wire[3:0] rowPins,
    output wire[7:0] colPins,
    output wire[3:0] led
    );
    
    reg[3:0] data[0:7];
    wire[2:0] rowAddrOut;  
    wire[3:0] rowDataIn;
    wire ledClkOut;			// not used since we're driving pins directly and not latching them.    
    wire slowClock;			// clock divided by divisor param
    
	assign rowDataIn = (resetSwitch) ? 8'd0 : data[rowAddrOut];

    assign led[0] = sw[0] && sw[1 && !resetSwitch];
    assign led[1] = sw[1] && sw[2] && CLK100MHZ;
    assign led[2] = sw[2] && sw[3];
    assign led[3] = ledClkOut;
        
    ClockDivider#(divisor, divisorBits) clkDiv(.clkIn(CLK100MHZ), .clkOut(slowClock));
    
	LEDMatrixDriver#(.rowSize(4), .colCnt(8)) ledDriver(
		.clkIn(slowClock),
		.resetIn(resetSwitch),
		.rowAddrOut(rowAddrOut),
		.rowDataIn(rowDataIn),
		.ledClkOut(ledClkOut),
		.rowPinsOut(rowPins),
		.colPinsOut(colPins));
		
	initial begin
		data[0] = 4'b0001;
		data[1] = 4'b1001;
		data[2] = 4'b1010;
		data[3] = 4'b0110;
		data[4] = 4'b0101;
		data[5] = 4'b1001;
		data[6] = 4'b1000;
		data[7] = 4'b0000;
	end
	        
endmodule
