`timescale 1ns / 1ps

module demux #(parameter bits=4)(
    input val,
    input [bits - 1:0] ndx,
    output [2^bits-1:0] out
    );
    
    assign out = val * (1 << ndx);
endmodule
