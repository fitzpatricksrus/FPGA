`timescale 1ns / 100ps
`default_nettype none

module CounterDemuxSim();

	reg clk;
	reg reset;
	wire maxTick;
	wire [1:0] colNdx;
	wire [3:0] cols;
	
    Counter#(.bits(2)) counter(.clk(clk), .reset(reset), .maxTick(maxTick), .count(colNdx));
    DeMux#(.bits(2)) colDeMux(.signal(1), .ndx(colNdx), .out(cols));

	initial begin
		clk = 0; reset = 1; #5 reset = 0;
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
