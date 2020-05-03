`timescale 1ns / 100ps
`default_nettype none


module ClockDividerSim();

	reg clock_in;
	wire clock_out;
	ClockDivider#(.divisor(4)) cd (.clkIn(clock_in), .clkOut(clock_out));
	initial begin
		// Initialize Inputs
		clock_in = 0;
		// create input clock 50MHz
		forever #10 clock_in = ~clock_in;
	end
	
endmodule
