`timescale 1ns / 100ps
`default_nettype none


module ClockDivider #(parameter divisor=2, bits=2) (
    input wire clkIn,
    input wire reset,
    output wire clkOut
    );

	reg[bits-1:0] counter = 0;
	
	always @(posedge clkIn, posedge reset) begin
		if (reset) begin
			counter <= 0;
		end else begin
			counter <= counter + 1;
			if (counter >= (divisor - 1)) begin
				counter <= 0;
			end
		end
	end
	
	assign clkOut = (counter < divisor / 2) ? 0 : 1;
endmodule
