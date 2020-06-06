`timescale 1ns / 1ps

module seg7(
	input wire CLK100MHZ,
    input wire [3:0] sw,
    output wire [3:0] led,
    output wire [7:0] out1,
    output wire [7:0] out2
    );
    
    wire divClk;
    reg reset = 0;
    
    assign led[0] = sw[0];
    assign led[1] = sw[1];
    assign led[2] = sw[2];
    assign led[3] = sw[3] && divClk;
    
    ClockDivider div(.clkIn(CLK100MHZ), .reset(reset), .clkOut(divClk));
    
    Seg7Display display1(sw, out1);
    Seg7Display display2(~sw, out2);
        
endmodule
