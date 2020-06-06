// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Thu May  7 10:56:42 2020
// Host        : JohnsGo running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/stuff/Documents/Projects/FPGA/BlinkyLights/BlinkyLights.sim/sim_1/synth/func/xsim/MainSim_func_synth.v
// Design      : Main
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s25csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* divisor = "10000000" *) (* divisorBits = "20" *) 
(* NotValidForBitStream *)
module Main
   (clk,
    reset,
    rowPins,
    colPins);
  input clk;
  input reset;
  output [7:0]rowPins;
  output [7:0]colPins;

  wire [7:0]colPins;
  wire [7:0]rowPins;

  OBUF \colPins_OBUF[0]_inst 
       (.I(1'b0),
        .O(colPins[0]));
  OBUF \colPins_OBUF[1]_inst 
       (.I(1'b0),
        .O(colPins[1]));
  OBUF \colPins_OBUF[2]_inst 
       (.I(1'b0),
        .O(colPins[2]));
  OBUF \colPins_OBUF[3]_inst 
       (.I(1'b0),
        .O(colPins[3]));
  OBUF \colPins_OBUF[4]_inst 
       (.I(1'b0),
        .O(colPins[4]));
  OBUF \colPins_OBUF[5]_inst 
       (.I(1'b0),
        .O(colPins[5]));
  OBUF \colPins_OBUF[6]_inst 
       (.I(1'b0),
        .O(colPins[6]));
  OBUF \colPins_OBUF[7]_inst 
       (.I(1'b0),
        .O(colPins[7]));
  OBUF \rowPins_OBUF[0]_inst 
       (.I(1'b0),
        .O(rowPins[0]));
  OBUF \rowPins_OBUF[1]_inst 
       (.I(1'b0),
        .O(rowPins[1]));
  OBUF \rowPins_OBUF[2]_inst 
       (.I(1'b0),
        .O(rowPins[2]));
  OBUF \rowPins_OBUF[3]_inst 
       (.I(1'b0),
        .O(rowPins[3]));
  OBUF \rowPins_OBUF[4]_inst 
       (.I(1'b0),
        .O(rowPins[4]));
  OBUF \rowPins_OBUF[5]_inst 
       (.I(1'b0),
        .O(rowPins[5]));
  OBUF \rowPins_OBUF[6]_inst 
       (.I(1'b0),
        .O(rowPins[6]));
  OBUF \rowPins_OBUF[7]_inst 
       (.I(1'b0),
        .O(rowPins[7]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
