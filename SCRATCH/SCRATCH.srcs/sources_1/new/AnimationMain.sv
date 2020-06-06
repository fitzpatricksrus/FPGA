`timescale 1ns / 1ps
`default_nettype none

module AnimationMain#(parameter clkBits=22)(
    input wire CLK12MHZ,
    input wire reset,
    output wire[3:0] led,	// [invDiv,div,baseClock]
    output wire led0_r,
    output wire led1_r
    );
    
    localparam width = 4;
    localparam depth = 6;
    localparam depthBits = $clog2(depth);
    
   	wire CLK1HZ;
	BinaryCounter#(.bits(clkBits),.outBits(1)) divider(.clk(CLK12MHZ), .reset(reset), .countOut(CLK1HZ));
    assign led0_r = CLK1HZ;
 
    wire[width-1:0] data;
    wire[depthBits-1:0] addr;
    wire addrClk; 
    wire[width-1:0] modData;
    wire[depthBits-1:0] modAddr;
    
	reg[3:0] rom[6];
	initial begin
		rom[0] = 4'b0001;
		rom[1] = 4'b0010;
		rom[2] = 4'b0100;
		rom[3] = 4'b1000;
		rom[4] = 4'b0100;
		rom[5] = 4'b0010;
	end

    MemoryModulator#(.width(4),.depth(depth)) mm(
    	.clk(CLK1HZ), 
    	.reset(reset), 
    	.data(data), 
    	.addr(addr), 
    	.addrClk(addrClk),
    	.modData(modData),
    	.modAddr(modAddr));
    
    assign led1_r = addrClk;
    assign data = rom[addr];
    assign led = modData;
	
    
endmodule
