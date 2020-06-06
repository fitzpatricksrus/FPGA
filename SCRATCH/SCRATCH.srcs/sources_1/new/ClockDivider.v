`timescale 1ns / 1ps
`default_nettype none

module ClockDivider#(parameter divisor=10000000)(
    input wire clkIn,
    output wire clkOut
    );
    
    localparam bits = $clog2(divisor);
    reg[bits-1:0] counter;
    
    initial begin
    	counter <= 0;
    end
    
    always@(posedge clkIn) begin
		if (counter >= divisor-1) begin
			counter <= 0;
		end else begin
			counter <= counter + 1;
		end
    end
    
    assign clkOut = (counter < divisor/2) ? 0 : 1; 
    
endmodule
