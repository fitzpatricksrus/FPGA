`timescale 1ns / 1ps


module BinaryCounterSim();

	reg clk;
	wire [2:0] count;
	
	BinaryCounter#(.bits(3)) bc(.clkIn(clk), .countOut(count));
	
	initial begin
		clk = 0;
		
		#5 clk = 1; #5 clk = 0;
		#5 clk = 1; #5 clk = 0;
		#5 clk = 1; #5 clk = 0;
		#5 clk = 1; #5 clk = 0;
		#5 clk = 1; #5 clk = 0;
		#5 clk = 1; #5 clk = 0;
		#5 clk = 1; #5 clk = 0;
		#5 clk = 1; #5 clk = 0;
		#5 clk = 1; #5 clk = 0;
		#5 clk = 1; #5 clk = 0;
		#5 clk = 1; #5 clk = 0;
		#5 clk = 1; #5 clk = 0;
		#5 clk = 1; #5 clk = 0;
		$finish();
	end
	
endmodule
