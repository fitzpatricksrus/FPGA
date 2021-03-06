`timescale 1ns / 100ps

module MainSim();

	reg clk = 0;
	reg reset = 0;
    wire [7:0] rowPins;
    wire [7:0] colPins;
        
    Main#(.divisor(2), .divisorBits(2)) m(clk, reset, rowPins, colPins);

	initial begin
		reset = 1; #5 reset = 0; #5
		
		clk = 1; #5 clk = 0; #5
		clk = 1; #5 clk = 0; #5
		
		clk = 1; #5 clk = 0; #5
		clk = 1; #5 clk = 0; #5
		
		clk = 1; #5 clk = 0; #5
		clk = 1; #5 clk = 0; #5
		
		clk = 1; #5 clk = 0; #5
		clk = 1; #5 clk = 0; #5
		
		clk = 1; #5 clk = 0; #5
		clk = 1; #5 clk = 0; #5
		
		clk = 1; #5 clk = 0; #5
		clk = 1; #5 clk = 0; #5
		
		clk = 1; #5 clk = 0; #5
		clk = 1; #5 clk = 0; #5
		
		clk = 1; #5 clk = 0; #5
		clk = 1; #5 clk = 0; #5
	
		clk = 1; #5 clk = 0; #5
		clk = 1; #5 clk = 0; #5
	
		clk = 1; #5 clk = 0; #5
		clk = 1; #5 clk = 0; #5
	
		clk = 1; #5 clk = 0; #5
		clk = 1; #5 clk = 0; #5
	
		clk = 1; #5 clk = 0; #5
		clk = 1; #5 clk = 0; #5
	
		clk = 1; #5 clk = 0; #5
		clk = 1; #5 clk = 0; #5
	
		clk = 1; #5 clk = 0; #5
		clk = 1; #5 clk = 0; #5
	
		clk = 1; #5 clk = 0; #5
		clk = 1; #5 clk = 0; #5
	
		clk = 1; #5 clk = 0; #5
		clk = 1; #5 clk = 0; #5
	
		clk = 1; #5 clk = 0; #5
		clk = 1; #5 clk = 0; #5
	
		clk = 1; #5 clk = 0; #5
		clk = 1; #5 clk = 0; #5
	
		$stop();
	end

endmodule
