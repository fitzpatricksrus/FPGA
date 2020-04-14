`timescale 1ns / 1ps

module LEDMatrix8x8Sim();

    reg clk;
    wire [7:0] rows;
    wire [7:0] cols;
    LEDMatrix8x8 segs(clk, rows, cols);

initial
begin
    $finish();
end

endmodule
