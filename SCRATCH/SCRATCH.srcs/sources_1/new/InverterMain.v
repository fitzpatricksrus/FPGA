`timescale 1ns / 1ps
`default_nettype none

module InverterMain#(parameter clkBits=2, width=4)(
    input wire CLK12MHZ,
    input wire reset,
    output wire[width-1:0] led,	// [invDiv,div,baseClock]
    output wire led0_r,
    output wire led1_r
    );
    
    localparam depth = 64;
    localparam depthBits = $clog2(depth-1);
    
   	wire CLK1HZ;
	BinaryCounter#(.bits(clkBits),.outBits(1)) divider(.clk(CLK12MHZ), .reset(reset), .countOut(CLK1HZ));
    assign led0_r = CLK1HZ;
 
    wire[width-1:0] data;
    wire[depthBits-1:0] addr;
    wire addrClk; 
    wire[width-1:0] modData;
    wire[depthBits-1:0] modAddr;
    
	reg[depthBits-1:0] rom[depth];
	initial begin
		rom[0] = 8'b00000001;
		rom[1] = 8'b00000111;
		rom[2] = 8'b00011111;
		rom[3] = 8'b11111111;
	end

    MemoryModulator#(.width(width),.depth(depth)) mm(
    	.clk(CLK1HZ), 
    	.reset(reset), 
    	.data(data), 
    	.addr(addr), 
    	.addrClk(addrClk),
    	.modData(modData),
    	.modAddr(modAddr));
    
    assign led1_r = addrClk;
    
//    assign data = {rom[3] > addr, rom[2] > addr, rom[1] > addr, rom[0] > addr};
    genvar i;
    generate
    	for (i = 0; i < width; i = i + 1) begin
    		assign data[i] = (rom[i] > addr) ? 1 : 0;
    	end
    endgenerate
    assign led = modData;	
    
endmodule
