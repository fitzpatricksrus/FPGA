`timescale 1ns / 1ps
`default_nettype none

module StepDownCounter #(parameter value = 1000000, bits=20) (
	input wire clk,
	input wire reset,
	output wire tick
    );
    
    reg[bits-1:0] count;
    reg tickReg;
    
    initial begin
    	count <= 0;
    	tickReg = 0;
    end
    
    assign tick = tickReg;
    
    always@(posedge clk, posedge reset) begin
    	if (reset) begin
			count <= 0;
			tickReg = 0;
		end else if (count == value - 1) begin
    		count <= 0;
    		tickReg = 1;
    	end else begin
    		count <= count + 1;
    		tickReg = 0;
    	end
    end
endmodule
