`timescale 1ns / 1ps
`default_nettype none

module LED_PWM_SIM(
    );
    
    localparam WIDTH = 4;
    localparam DEPTH = 1 << WIDTH;
    
    reg clk;
    reg reset;
    wire[DEPTH-1:0] leds;
    reg[WIDTH-1:0] led_values[DEPTH-1:0];
    wire first;
    wire last;
    
    LED_PWM #(.LED_DEPTH(DEPTH),.LED_WIDTH(WIDTH)) pwm(
    	.clk(clk), .reset(reset), .led_values(led_values), .led_out(leds), .first_step(first), .last_step(last));
    
   	integer i;
    
    initial begin
    	clk = 0;
    	reset = 0;
    	
		led_values[0] = 4'b0000;
		led_values[1] = 4'b0001;
		led_values[2] = 4'b0010;
		led_values[3] = 4'b0011;
		led_values[4] = 4'b0100;
		led_values[5] = 4'b0101;
		led_values[6] = 4'b0110;
		led_values[7] = 4'b0111;
		led_values[8] = 4'b1000;
		led_values[9] = 4'b1001;
		led_values[10] = 4'b1010;
		led_values[11] = 4'b1011;
		led_values[12] = 4'b1100;
		led_values[13] = 4'b1101;
		led_values[14] = 4'b1110;
		led_values[15] = 4'b1111;

    	reset = 1;
    	clk = 1;
    	#2;
    	reset = 0;
    	clk = 0;
    	#2;
    	
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
    	
    	
    	for (i = 0; i < DEPTH*2; i = i + 1) begin
    		clk = 1;
    		#2;
    		clk = 0;
    		#2;
    	end
    	$finish();
    	
    
    end
endmodule
