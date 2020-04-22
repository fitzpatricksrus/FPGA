`timescale 1ns / 100ps
`default_nettype none

module DeMux #(parameter ndxBits=4)(
    input wire [ndxBits - 1:0] ndx,
    output wire [2**ndxBits-1:0] out
    );
        
    assign out = 1'b1 << ndx;
endmodule
