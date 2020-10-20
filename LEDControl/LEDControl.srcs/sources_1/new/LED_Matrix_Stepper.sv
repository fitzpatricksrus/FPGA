`timescale 1ns / 1ps
`default_nettype none


module LED_Matrix_Stepper#(parameter rowWidth=8, cols=8, colBits=3)(
    input wire clk,
    input wire reset,
    input wire[rowWidth-1:0] data[cols],
    output wire[rowWidth-1:0] row,
    output wire first,
    output wire last
    );
    
    
    reg[colBits-1:0] nextColNdx;
    reg[rowWidth-1:0] rowOut;
    reg firstOut;
    reg lastOut;
    
    assign row = rowOut;
    assign first = firstOut;
    assign last = lastOut;
    
    always@(posedge clk) begin
        if (reset) begin
            nextColNdx <= 0;
            rowOut <= data[0];
            firstOut <= 1'b1;
            lastOut <= 1'b0;
        end else begin
            rowOut <= data[nextColNdx];
            firstOut <= (nextColNdx == 0);
            lastOut <= (nextColNdx >= cols - 1);
            nextColNdx <= (nextColNdx >= cols - 1) ? 0 : nextColNdx + 1;
            
        end
    end
    
endmodule
