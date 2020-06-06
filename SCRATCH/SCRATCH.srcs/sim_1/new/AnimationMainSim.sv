`timescale 1ns / 1ps
`default_nettype none

module AnimationMainSim();
    reg clk;
    reg reset;
    wire ledClk;
    wire memClk;
    wire[3:0] led;
    
    AnimationMain#(.clkBits(1)) im(
    	.CLK12MHZ(clk), 
    	.reset(reset),
    	.led0_r(ledClk),
    	.led1_r(memClk),
    	.led);
    
    initial begin
    	integer i;
    	
    	reset = 0; clk = 0;
    	#4 reset = 1; clk = 1; #4 clk = 0;
    	#4 reset = 0; clk = 1; #4 clk = 0;
    	clk = 0;
    	for (i = 0; i < 100; i = i + 1) begin
    		#4 clk = 1;
    		#4 clk = 0;
    	end

    	$finish();
    end
endmodule
