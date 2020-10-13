`timescale 1ns / 1ps

module LEDSeek #(parameter ledCount=4, ledDepth=8, step=1) (
    input clk,
    input reset,

    input wire[ledDepth-1:0] ledValue[ledCount-1:0],
    output wire[ledDepth-1:0] ledOut[ledCount-1:0] 
    );
    
    reg[ledDepth-1:0] ledDriver[ledCount-1:0];
    
    always @(posedge clk) begin
    	integer i;
    	if (reset) begin
    		for (i = 0; i < ledCount; i = i + 1) begin
    			ledDriver[i] <= 0;
    		end    		
    	end else begin
    		for (i = 0; i < ledCount; i = i + 1) begin
    			if (ledDriver[i] < ledValue[i]) begin
	    			ledDriver[i] <= ledDriver[i] + step;
	    		end else if (ledDriver[i] > ledValue[i]) begin
	    			ledDriver[i] <= ledDriver[i] - step;
	    		end
    		end
    	end
    end
    
    genvar j;
    for (j = 0; j < ledCount - 1; j = j + 1) begin
    	assign ledOut[j] = ledDriver[j];
    end
endmodule
