`timescale 1ns / 1ps
`default_nettype none

// counter from [intervalBegin, intervaleEnd)
module Counter #( parameter bits = 4, intervalBegin = 0, intervalEnd = 10 )(
    input wire clk,
    input wire reset,
    output wire maxTick,
    output wire [bits-1:0] count
    );
    
    reg [bits-1:0] rCount;
    wire [bits-1:0] rNext;
    
    always @(posedge clk, posedge reset)
    begin
    	if (reset) begin
    		rCount <= intervalBegin;
    	end else begin
    		rCount = rNext;
    	end
    end
    
    assign maxTick = (rCount == (intervalEnd - 1)) ? 1 : 0; 
    assign rNext = (rCount == (intervalEnd - 1)) ? intervalBegin : rCount + 1; 
    assign count = rCount;
endmodule
