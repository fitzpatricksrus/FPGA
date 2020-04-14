`timescale 1ns / 1ps

module DeMux #(parameter bits=4)(
    input [bits - 1:0] ndx,
    output [2^bits-1:0] out
    );
    
    assign out = (1 << ndx);
endmodule
