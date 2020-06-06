`timescale 1ns / 100ps
`default_nettype none


module ClockDivider#(parameter divisor=2, bits=4) (
    input wire clkIn,
    output wire clkOut
    );

	reg[bits-1:0] counter;
	reg clk;
	
	initial begin
		counter <= 0;
		clk <= 0;
	end
	
	always@(posedge(clkIn)) begin
		if (counter >= (divisor - 1)) begin
			counter <= 0;
			clk <= ~clk;
		end else begin	
			counter <= counter + 1;
			clk <= clk;
		end
	end
	
	assign clkOut = clk;
//	assign clkOut = (counter < divisor / 2) ? 0 : 1;
endmodule
