`timescale 1ns / 100ps

module LED1088ASSim();
    
    reg clk = 0;
	reg reset = 0;
	wire [2:0] colNdx;
    reg [7:0] rowData = 0;
    reg [2:0] colNdx = 0;
    wire [7:0] rowPins;
    wire [7:0] colPins;

	LED1088AS led(clk, reset, rowData, colNdx, rowPins, colPins);


	initial begin
	
	end

endmodule
