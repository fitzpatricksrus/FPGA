`timescale 1ns / 100ps

module MainSim();

	reg clk = 0;
	reg resetSwitch;
	reg[3:0] switches;
    wire[7:0] rowPins;
    wire[7:0] colPins;
    wire[3:0] leds;
        
    Main#(.divisor(2), .divisorBits(2)) m(clk, resetSwitch, switches, rowPins, colPins, leds);
        
	initial begin
		resetSwitch = 1; #5 resetSwitch = 0; #5
		
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
