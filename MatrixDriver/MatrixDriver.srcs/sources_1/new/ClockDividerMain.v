`timescale 1ns / 1ps

module ClockDividerMain#(parameter divisor = 10000000, divisorBits = 20)(
	input wire CLK,
    output wire led0,
    output wire led1
    );
    
	reg led0_reg;
	reg led1_reg;

    ClockDivider#(divisor, divisorBits) clkDiv(.clkIn(CLK), .clkOut(led0_reg));

	initial begin
		led1_reg = 0;
		led0_reg = 0;
	end
	
	always@(CLK) 
		led1_reg <= CLK;
		 
	assign led0 = led0_reg;
	assign led1 = led1_reg;
endmodule
