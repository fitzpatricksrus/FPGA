`timescale 1ns / 1ps

module MemoryModulatorSim();

	localparam width = 4;
	localparam depth = 6;
	localparam depthBits = $clog2(depth);

    reg clk;
    reg reset;
    
    reg[width-1:0] data;
    wire[depthBits-1:0] addr;
    wire addrClk;
    
    wire[width-1:0] modData;
    wire[depthBits-1:0] modAddr;
    
    MemoryModulator#(.width(width), .depth(depth)) mm(.*);
    
    reg[width-1:0] rom[depth];
	integer i;

	initial begin
		rom[0] = 4'b0001;
		rom[1] = 4'b0010;
		rom[2] = 4'b0100;
		rom[3] = 4'b1000;
		rom[4] = 4'b0100;
		rom[5] = 4'b0010;
	
		clk = 0;
		reset = 1;
		#1
		clk = 1;
		#1
		reset = 0;
		
		for (i = 0; i < 40; i = i + 1) begin
			if (addrClk) begin
				data = rom[addr];
			end
			#1 clk = 1; #1 clk = 0;
		end
		
		#1 $finish();
	end

endmodule
