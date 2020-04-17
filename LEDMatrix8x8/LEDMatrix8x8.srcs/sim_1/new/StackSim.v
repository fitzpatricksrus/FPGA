`timescale 1ns / 1ps
`default_nettype none

module StackSim();

	reg clk;
	reg reset;
	reg push;
	reg pop;
	reg [7:0] wData;
	wire [3:0] size;
	wire [7:0] tos;
	wire empty;
	wire full;
	
	Stack stack(
		.clk(clk), 
		.reset(reset), 
		.push(push), 
		.pop(pop), 
		.wData(wData), 
		.size(size), 
		.tos(tos), 
		.empty(empty), 
		.full(full)
		);

	initial begin
		clk = 0;
		reset = 0;
		push = 0;
		pop = 0;
		wData = 0;
		
		#5 reset = 1; #5 reset = 0;
		#5 wData = 5; pop = 0; push = 1; #5 clk = 1; #5 clk = 0;
		#5 wData = 13; pop = 0; push = 1; #5 clk = 1; #5 clk = 0;
		#5 wData = 4; pop = 1; push = 1; #5 clk = 1; #5 clk = 0;
		#5 pop = 1; push = 0; #5 clk = 1; #5 clk = 0;
		#5 pop = 1; push = 0; #5 clk = 1; #5 clk = 0;
	
		#5 $finish();
	end	
endmodule
