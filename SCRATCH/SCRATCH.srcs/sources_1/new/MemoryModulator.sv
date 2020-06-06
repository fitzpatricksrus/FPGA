`timescale 1ns / 1ps
`default_nettype none

/*
	A simple cycling copy circuit.  The modulator alternates between fetch and display states.  When 
	in FETCH, a memory address is put on the "addr" line.  On DISPLAY, the "data" and "addr" lines
	are latched onto modData/modAddr, addr is incremented.
*/
module MemoryModulator#(parameter width=8, depth=8, depthBits=$clog2(depth))(
    input wire clk,
    input wire reset,
    
    input wire[width-1:0] data,
    output wire[depthBits-1:0] addr,
    output wire addrClk,
    
    output wire[width-1:0] modData,
    output wire[depthBits-1:0] modAddr
    );
    
    typedef enum { FETCH, DISPLAY } State;
    
    State state = FETCH;
    reg[depthBits-1:0] fAddr = 0;
    reg[depthBits-1:0] mAddr = 0;
    reg[width-1:0] mData = 0;
    
    assign addr = fAddr;
    assign modData = mData;
    assign modAddr = mAddr;
    assign addrClk = state == FETCH;
    
    always_ff@(posedge clk, posedge reset) begin
    	if (reset) begin
			state <= FETCH;
			fAddr <= 0;
			mAddr <= 0;
			mData <= 0;
    	end else begin
    		case (state)
    		FETCH:
    			begin
    				mAddr <= fAddr;
    				mData <= data;
    				state <= DISPLAY;
    			end
    		DISPLAY:
    			begin
    				fAddr <= (fAddr < depth - 1) ? fAddr + 1 : 0;
    				state <= FETCH;
    			end
    		default:
    			begin
    			end
    		endcase
    	end
    
    end
    
endmodule
