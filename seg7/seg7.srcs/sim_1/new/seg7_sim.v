`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2020 11:29:43 AM
// Design Name: 
// Module Name: seg7_sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seg7_sim();

    reg [3:0] sw;
    wire [3:0] led;
    wire [7:0] out;
    seg7 segs(sw, led, out);

initial
begin
    sw = 0;
    #5 $display("%d %d %d\n", sw, led, out);
    sw = 1;
    #5 $display("%d %d %d\n", sw, led, out);
    sw = 2;
    #5 $display("%d %d %d\n", sw, led, out);
    sw = 3;
    #5 $display("%d %d %d\n", sw, led, out);
    sw = 4;
    #5 $display("%d %d %d\n", sw, led, out);
    sw = 5;
    #5 $display("%d %d %d\n", sw, led, out);
    sw = 6;
    #5 $display("%d %d %d\n", sw, led, out);
    sw = 7;
    #5 $display("%d %d %d\n", sw, led, out);
    sw = 8;
    #5 $display("%d %d %d\n", sw, led, out);
    sw = 9;
    #5 $display("%d %d %d\n", sw, led, out);
    sw = 10;
    #5 $display("%d %d %d\n", sw, led, out);
    sw = 11;
    #5 $display("%d %d %d\n", sw, led, out);
    sw = 12;
    #5 $display("%d %d %d\n", sw, led, out);
    sw = 13;
    #5 $display("%d %d %d\n", sw, led, out);
    sw = 14;
    #5 $display("%d %d %d\n", sw, led, out);
    sw = 15;
    #5 $display("%d %d %d\n", sw, led, out);
    $finish();
    
end

endmodule
