`timescale 1ns / 1ps
`default_nettype none

module LED_Fader_Sim(
    );
    
    localparam width = 4;
    localparam step = 1;
    
    reg clk;
    reg reset;
    reg[width-1:0] desired_value;
    wire[width-1:0] new_value;
    wire isStable;
    
    LED_Fader#(.width(width)) fade(
    	.clk(clk), 
    	.reset(reset),
    	.targetValue(desired_value),
    	.step(step),
    	.newValue(new_value),
    	.isStable(isStable)
    	);
    	
    initial begin
    	desired_value = 0;
    	reset = 1; clk = 1;
    	#2 reset = 0; clk = 0;
    	
    	desired_value = 4'b1111;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;

		desired_value = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;

		$finish();		    	
    end
endmodule
