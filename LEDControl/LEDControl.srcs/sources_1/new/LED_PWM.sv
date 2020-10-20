`timescale 1ns / 1ps
`default_nettype none

module LED_PWM #(parameter LED_DEPTH=16, LED_WIDTH=4) (
    input wire clk,
    input wire reset,
    
    input wire [LED_WIDTH-1:0] ledValues[LED_DEPTH-1:0],
    output wire [LED_DEPTH-1:0] ledOut,
    
    output wire firstStep,
    output wire lastStep
    );
    
    localparam MAX_VALUE = (1 << LED_WIDTH)- 2;
    
    reg[LED_DEPTH-1:0] ledOutDriver;
    reg firstDriver;
    reg lastDriver;
    reg[LED_WIDTH-1:0] ledStep;
    
    always_ff @(posedge clk) begin
    	if (reset) begin
    		ledOutDriver <= 0;
    		ledStep <= 0;
    	end else begin
    		integer i;

    		firstDriver <= ledStep == 0;
    		lastDriver <= ledStep == MAX_VALUE;
    		for (i = 0; i < LED_DEPTH; i = i + 1) begin
    			ledOutDriver[i] <= (ledValues[i] > ledStep);
    		end
			if (ledStep == MAX_VALUE) begin
				ledStep <= 0;
			end else begin
				ledStep <= ledStep + 1;
			end
		end
    end
    
	assign ledOut = ledOutDriver;
	assign firstStep = firstDriver;
	assign lastStep = lastDriver;
endmodule
