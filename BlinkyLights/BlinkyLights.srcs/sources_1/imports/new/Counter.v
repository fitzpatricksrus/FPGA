`timescale 1ns / 1ps
`default_nettype none

// counter from [intervalBegin, intervaleEnd)
module Counter #(parameter bits = 4)(
    input wire clk,
    input wire reset,
    output wire [bits-1:0] count
    );
    
    reg [bits-1:0] rCount;
    wire [bits-1:0] rNext;
    
    initial begin
    	rCount <= 0;
    end
    
    always @(posedge clk, posedge reset)
    begin
    	if (reset) begin
    		rCount <= 0;
    	end else begin
    		rCount <= rNext;
    	end
    end
    
    assign rNext = rCount + 1; 
    assign count = rCount;
endmodule
