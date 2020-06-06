`timescale 1ns / 1ps

module Inverter(
    input wire clk,
    output wire invClkOut
    );
    
    reg notc;
    
    initial begin
    	notc = 1;
    end
    
    always@(clk) begin
    	if (clk) begin
    		notc <= 0;
    	end else begin
    		notc <= 1;
    	end
    end
    
    assign invClkOut = notc;
//    assign invClkOut = ~clk;
endmodule
