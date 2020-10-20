`timescale 1ns / 1ps
`default_nettype none

module LED_Matrix_Stepper_Sim();
    
    localparam rowWidth = 3;
    localparam cols = 4;
    localparam colBits = 2;
    
    reg clk;
    reg reset;
    reg[rowWidth-1:0] data[cols];
    wire [rowWidth-1:0] row;
    wire first;
    wire last;

    LED_Matrix_Stepper#(.rowWidth(rowWidth), .cols(cols), .colBits(colBits)) stepper(
        .clk(clk),
        .reset(reset),
        .data(data),
        .row(row),
        .first(first),
        .last(last)
    );
    
    initial begin
    	reset = 1; clk = 1;
    	#2 reset = 0; clk = 0;
    	
    	data[0] = 3'b001;
    	data[1] = 3'b011;
    	data[2] = 3'b110;
    	data[3] = 3'b100;
    	
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	#2 clk = 1; #2 clk = 0;
    	
    	$finish();
    end
endmodule
