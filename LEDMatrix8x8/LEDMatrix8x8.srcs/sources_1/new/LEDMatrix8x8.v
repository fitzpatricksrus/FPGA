`timescale 1ns / 1ps

module LEDMatrix8x8 #(parameter rowSize = 8, colSize = 8)(
    input clk,
    output reg [7:0] rows,
    output reg [7:0] cols
    );
    
    localparam reset = 0;
    reg maxTick;
    wire [2:0] colNdx;
    
    Counter#(.bits(3), .intervalBegin(0), .intervalEnd(7)) counter(.clk(clk), .reset(reset), .maxTick(maxTick), .count(colNdx));
    DeMux#(.bits(3)) colDeMux(.ndx(colNdx), .out(cols));
    
    always@(cols) begin
    	rows <= cols;
    end
        
endmodule
