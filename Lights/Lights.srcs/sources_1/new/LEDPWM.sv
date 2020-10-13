`timescale 1ns / 1ps

module LEDPWM #(parameter ledCount=4, ledDepth=8) (
    input wire clk,
    input wire reset,
    input wire[ledDepth-1:0] ledValue[ledCount-1:0],
    output wire[ledCount-1:0] ledOut
    );
    
    reg[ledCount-1:0] ledDriver;
    reg[ledDepth-1:0] phase;
    
    always @(posedge clk) begin
    	if (reset) begin
    		ledDriver <= 0;
    		phase <=0;
    	end else begin
		    integer i;
    		for (i = 0; i < ledCount; i = i + 1) begin
    			ledDriver[i] <= (ledValue[i] > 0) && (ledValue[i] >= phase);
    		end
    		phase <= phase + 1;
    	end
    end
    
    genvar j;
    for (j = 0; j < ledCount; j = j + 1) begin
    	assign ledOut[j] = ledDriver[j];
    end
endmodule
