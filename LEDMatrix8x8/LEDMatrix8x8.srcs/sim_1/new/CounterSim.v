`timescale 1ns / 1ps
`default_nettype none

module CounterSim();

    reg clk;
    reg reset;
    wire maxTick;
    wire [2:0] count;
    
    Counter#(.bits(3)) counter(.clk(clk), .reset(reset), .maxTick(maxTick), .count(count));
    
    initial begin
    	#5 reset = 1; 
    	#5 reset = 0; clk = 0;
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
