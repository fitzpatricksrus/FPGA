`timescale 1ns / 100ps
`default_nettype none


module ClockDividerSim();
	reg clk;
	wire led0;
	wire led1;

	ClockDividerMain#(.divisor(2)) cd(.CLK(clk), .led0(led0), .led1(led1));

	initial begin
		#1 clk = 0; #1 clk = 1;
		#1 clk = 0; #1 clk = 1;
		#1 clk = 0; #1 clk = 1;
		#1 clk = 0; #1 clk = 1;
		#1 clk = 0; #1 clk = 1;
		#1 clk = 0; #1 clk = 1;
		#1 clk = 0; #1 clk = 1;
		#1 clk = 0; #1 clk = 1;
		#1 clk = 0; #1 clk = 1;
		#1 clk = 0; #1 clk = 1;
		#1 clk = 0; #1 clk = 1;
		$finish();
	end
	
endmodule
