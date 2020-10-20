`timescale 1ns / 1ps
`default_nettype none

module LED_Fader#(parameter width=4) (
    input wire clk,
    input wire reset,
    
    input wire[width-1:0] targetValue,
    input wire[width-1:0] step,
    output wire[width-1:0] newValue,
    output wire isStable
    );
    
    reg[width-1:0] currentValue;
    
    assign newValue = currentValue;
    assign isStable = currentValue == targetValue;

    
    always_ff @(posedge clk) begin
    	if (reset) begin
    		currentValue <= targetValue;
    	end else begin
			if (currentValue < targetValue) begin
				currentValue <= (targetValue - currentValue > step) ? currentValue + step : targetValue;
			end else if (currentValue > targetValue) begin
				currentValue <= (currentValue - targetValue > step) ? currentValue - step : targetValue;
			end else begin
				currentValue <= currentValue;
			end
    	end
    end
    
endmodule
