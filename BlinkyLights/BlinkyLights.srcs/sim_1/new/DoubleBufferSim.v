`timescale 1ns / 100ps
`default_nettype none

module DoubleBufferSim();

	reg clk;
	reg reset;
	reg bufferSelect;
	reg writeEnable;
	reg[1:0] writeAddress;
	reg[2:0] writeData;
	reg[1:0] readAddress;
	wire [2:0] readData;
	reg[2:0] ndx;

	DoubleBuffer#(.addrBits(2), .dataBits(3)) buff(clk, reset, bufferSelect, writeEnable, writeAddress, writeData, readAddress, readData);
		
	initial begin
		clk = 0;
		bufferSelect = 0;
		readAddress = 0;
		writeAddress = 0;
		reset = 1; #1 reset = 0; #1
		
		// verify memory clear after reset
		for (ndx = 0; ndx < 3'd4; ndx = ndx + 1) begin
			readAddress = ndx[1:0]; #1
			bufferSelect = 0; #1
			if (readData != 0) begin
				$display("data[%d] did not clear on reset", ndx);
			end
			bufferSelect = 1; #1
			if (readData != 0) begin
				$display("data[%d] did not clear on reset", ndx);
			end
		end
		
		// fill both banks with different values
		writeEnable = 1;
		for (ndx = 0; ndx < 3'd4; ndx = ndx + 1) begin
			writeAddress = ndx[1:0];

			bufferSelect = 0;
			writeData = ndx;
			clk = 1; #1 clk = 0; #1
			
			bufferSelect = 1;
			writeData = 3'd3 - ndx;
			clk = 1; #1 clk = 0; #1 clk=0;
		end

		// verify contents of both banks
		for (ndx = 0; ndx < 3'd4; ndx = ndx + 1) begin
			readAddress = ndx[1:0];
			
			bufferSelect = 1; #1
			if (readData != ndx) begin
				$display("read/write[%d] from wrong memory bank[%d]", ndx, bufferSelect);
			end
			
			bufferSelect = 0; #1
			if (readData != 3'd3 - ndx) begin
				$display("read/write[%d] from wrong memory bank[%d]", ndx, bufferSelect);
			end
		end
	
		$finish();
	end
endmodule
