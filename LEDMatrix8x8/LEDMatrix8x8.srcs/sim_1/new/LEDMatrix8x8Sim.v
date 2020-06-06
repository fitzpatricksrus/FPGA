`timescale 1ns / 100ps

module LEDMatrix8x8Sim();

	localparam rowBits = 3;
	localparam colBits = 3;
	reg clk;
    reg reset;
    
    wire [(2**rowBits)-1:0] rows;
    wire [(2**colBits)-1:0] cols;
    wire [colBits-1:0] colNdx;
    
    reg[4:0] i;
    
    LEDMatrix8x8#(.rowCnt(2**rowBits), .colCnt(2**colBits), .rowBits(rowBits),.colBits(colBits)) m(
    	.clk(clk), 
    	.reset(reset), 
    	.rows(rows), 
    	.cols(cols),
    	.colNdx(colNdx));
    
    initial begin
	
		clk = 0;
		reset = 1;
		
		#5 reset = 0;
		
		for (i = 0; i < 20; i = i + 1) begin
			#5 clk = 1; #5 clk = 0;		
		end

		$finish();
		
    end

endmodule
