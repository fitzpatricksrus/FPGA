`timescale 1ns / 1ps
`default_nettype none

/*
DoubleBuffer maintains two memories that are selected by bufferSelect.  You
never read and write to the same buffer at once.  If buffer is readable the
other is writeable, but they are never the same buffer.  Writes are latched
on the positive clock edge.  Reads are continuous.  A positive edge triggered
reset clears both buffers to 0.
*/
module DoubleBuffer#(parameter addrBits=3, dataBits=8)(
    input wire clk,
    input wire reset,
    input wire bufferSelect,
    input wire writeEnable,
    input wire[addrBits-1:0] writeAddress,
    input wire[dataBits-1:0] writeData,
    input wire[addrBits-1:0] readAddress,
    output wire[dataBits-1:0] readData
    );
    
    localparam ndxEnd = addrBits**2;
    reg [dataBits-1:0] data0[0:ndxEnd-1];
    reg [dataBits-1:0] data1[0:ndxEnd-1];
    reg [addrBits:0] ndx;
    
    assign readData = bufferSelect ? data0[readAddress] : data1[readAddress];
    
    always@(posedge clk, posedge reset) begin
		if (reset) begin
			for (ndx = 0; ndx < ndxEnd; ndx = ndx + 1) begin
				data0[ndx] <= 0;
				data1[ndx] <= 0;
			end
		end else begin
			if (writeEnable) begin
				if (bufferSelect) begin
					data1[writeAddress] <= writeData;
				end else begin
					data0[writeAddress] <= writeData;
				end
			end
		end
    end
endmodule
