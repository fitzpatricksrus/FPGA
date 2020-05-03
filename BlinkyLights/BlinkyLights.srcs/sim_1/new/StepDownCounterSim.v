`timescale 1ns / 100ps
`default_nettype none

module StepDownCounterSim();
	
	reg clk;
	reg reset;
	wire tick;
	wire tick2;
	wire tick1;
		
	StepDownCounter#(.value(4),.bits(3)) cnt(clk, reset, tick);
	StepDownCounter#(.value(2),.bits(4)) cnt0(clk, reset, tick2);
	StepDownCounter#(.value(1),.bits(4)) cnt1(clk, reset, tick1);

	initial begin
		reset = 1;
		clk = 0;
		#1
		reset = 0;
		#1
	
		clk = 1; #1 clk = 0; #1
		clk = 1; #1 clk = 0; #1
		clk = 1; #1 clk = 0; #1
		clk = 1; #1 clk = 0; #1
		
		clk = 1; #1 clk = 0; #1
		clk = 1; #1 clk = 0; #1
		clk = 1; #1 clk = 0; #1
		clk = 1; #1 clk = 0; #1
		
		clk = 1; #1 clk = 0; #1
		clk = 1; #1 clk = 0; #1
		reset = 1; #1 reset = 0; #1
		clk = 1; #1 clk = 0; #1
		clk = 1; #1 clk = 0; #1
		clk = 1; #1 clk = 0; #1
		clk = 1; #1 clk = 0; #1
		clk = 1; #1 clk = 0; #1
		clk = 1; #1 clk = 0; #1
		clk = 1; #1 clk = 0; #1
		clk = 1; #1 clk = 0; #1
		clk = 1; #1 clk = 0; #1
		clk = 1; #1 clk = 0; #1
		
		$finish();
	end

endmodule
