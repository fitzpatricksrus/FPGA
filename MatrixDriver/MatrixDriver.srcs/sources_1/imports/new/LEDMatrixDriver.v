`timescale 1ns / 1ps
`default_nettype none

/*
	LED1088AS LED matrix that pulls data from an 8x8 memory and uses that
	to refresh the LEDs. On rising clk, the colAddr is output. On falling
	edge, rowData is latched and rowPins/colPins are output.
*/
module LEDMatrixDriver#(parameter rowSize = 8, colCnt = 8, rowAddrBits = $clog2(colCnt))(
    input wire clkIn,
    input wire resetIn,
    
    // interface to memory
    output reg[rowAddrBits-1:0] rowAddrOut,    
    input wire[rowSize-1:0] rowDataIn,
    
    // led output interface
    output wire ledClkOut,
    output reg[rowSize-1:0] rowPinsOut,
    output reg[colCnt-1:0] colPinsOut
    );
    
    typedef enum { fetchMemory, driveLED } State;
    
    State state;
    reg[rowAddrBits-1:0] rowAddr;
    
    assign ledClkOut = (state == fetchMemory);
    
    initial begin
		rowAddr <= 0;
		rowPinsOut <= 0;
		colPinsOut <= 0;
		state <= fetchMemory;
	end
    
    always@(posedge clkIn, posedge resetIn) begin
    	if (resetIn) begin
    		rowAddr <= 0;
    		rowPinsOut <= 0;
    		colPinsOut <= 0;
    		state <= fetchMemory;
    	end else begin
    		if (state == fetchMemory) begin
				rowAddrOut <= rowAddr;
				rowAddr <= rowAddr + 1;
				state <= driveLED;
			end else begin
				rowPinsOut <= rowDataIn;
				colPinsOut <= 1 << rowAddr;
				state <= fetchMemory;
			end
		end
    end
    
endmodule

