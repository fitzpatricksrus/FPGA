`timescale 1ns / 10ps
`default_nettype none

module DeMuxSim();

	reg signal;
	reg [1:0] ndx;
	wire [3:0] out;
	DeMux#(.bits(2)) dm(.signal(signal), .ndx(ndx), .out(out));
	
	initial begin
		
		signal = 1;
		#5 ndx = 0;
		#5 ndx = 1;
		#5 ndx = 2;
		#5 ndx = 3;
		#5 $finish();
	end
endmodule
