`timescale 1ns / 1ps

module seg7(
    input [3:0] sw,
    output [3:0] led,
    output [7:0] out
    );
        
    assign led = sw;

    Seg7Display display(sw, out);
        
endmodule
