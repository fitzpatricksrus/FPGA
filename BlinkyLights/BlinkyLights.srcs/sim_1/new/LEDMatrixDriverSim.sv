`timescale 1ns / 100ps
`default_nettype none

module LEDMatrixDriverSim();
    reg clkIn;
    reg resetIn;
    
    // interface to memory
    wire[2:0] rowAddrOut;  
    reg[3:0] rowDataIn;
    
    // led output interface
    wire ledClkOut;
    wire[3:0] rowPinsOut;
    wire[7:0] colPinsOut;

	LEDMatrixDriver#(.rowSize(4), .colCnt(8)) driver(.*);
	
	reg[3:0] data[0:7];

	initial begin
		data[0] = 4'b0001;
		data[1] = 4'b1001;
		data[2] = 4'b1010;
		data[3] = 4'b0110;
		data[4] = 4'b0101;
		data[5] = 4'b1001;
		data[6] = 4'b1000;
		data[7] = 4'b0000;

		resetIn = 1;
		clkIn = 0;
		rowDataIn = 0;
			
		#1 resetIn = 0; 
		
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;

		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		#1 clkIn = 1; #1 clkIn = 0; #1 rowDataIn = data[rowAddrOut]; clkIn = 1; #1 clkIn = 0;
		
		$stop();
		
	end
	


endmodule
