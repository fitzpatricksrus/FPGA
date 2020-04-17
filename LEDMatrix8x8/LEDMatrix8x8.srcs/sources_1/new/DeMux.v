`timescale 1ns / 1ps
`default_nettype none

module DeMux #(parameter bits=4)(
	input wire signal,
    input wire [bits - 1:0] ndx,
    output wire [2^bits-1:0] out
    );
        
    assign out = signal << ndx;
endmodule
