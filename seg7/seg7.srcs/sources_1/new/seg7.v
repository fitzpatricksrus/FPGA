`timescale 1ns / 1ps

module seg7(
    input [3:0] sw,
    output [3:0] led,
    output [7:0] out1,
    output [7:0] out2
    );
        
    assign led = sw;
    
    Seg7Display display1(sw, out1);
    Seg7Display display2(!sw, out2);
        
endmodule
