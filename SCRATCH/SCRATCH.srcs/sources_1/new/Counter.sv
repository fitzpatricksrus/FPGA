`timescale 1ns / 1ps
`default_nettype none


module Counter#(parameter bits=2)(
    input wire clk,
    input wire reset,
    output wire [bits-1:0] count
    );
    
    reg[bits-1:0] cnt;
    
    initial begin
    	cnt = 0;
    end
    
	always@(posedge clk, posedge reset) begin
		if (reset) begin
			cnt <= 0;
		end else begin
			cnt <= cnt + 1;
		end
	end

	assign count = cnt;
    
endmodule
