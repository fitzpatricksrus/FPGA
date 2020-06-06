// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Fri May 15 12:33:16 2020
// Host        : JohnsGo running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/stuff/Documents/Projects/FPGA/SCRATCH/SCRATCH.sim/sim_1/impl/func/xsim/InverterMainSim_func_impl.v
// Design      : InverterMain
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s25csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module BinaryCounter
   (Q,
    CLK);
  output [2:0]Q;
  input CLK;

  wire CLK;
  wire [2:0]Q;
  wire \count[0]_i_1_n_0 ;
  wire \count[1]_i_1_n_0 ;
  wire \count[2]_i_1_n_0 ;

  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_1 
       (.I0(Q[0]),
        .O(\count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \count[2]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(\count[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\count[0]_i_1_n_0 ),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\count[1]_i_1_n_0 ),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\count[2]_i_1_n_0 ),
        .Q(Q[2]),
        .R(1'b0));
endmodule

module ClockDivider
   (led_OBUF,
    CLK100MHZ_IBUF_BUFG);
  output [1:0]led_OBUF;
  input CLK100MHZ_IBUF_BUFG;

  wire CLK100MHZ_IBUF_BUFG;
  wire [1:0]led_OBUF;

  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(CLK100MHZ_IBUF_BUFG),
        .CE(1'b1),
        .D(led_OBUF[1]),
        .Q(led_OBUF[0]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \led_OBUF[1]_inst_i_1 
       (.I0(led_OBUF[0]),
        .O(led_OBUF[1]));
endmodule

(* ECO_CHECKSUM = "d986f966" *) (* divisor = "2" *) (* divisorBits = "3" *) 
(* NotValidForBitStream *)
module InverterMain
   (CLK100MHZ,
    led,
    led0_r,
    led0_g,
    led0_b);
  input CLK100MHZ;
  output [1:0]led;
  output led0_r;
  output led0_g;
  output led0_b;

  wire CLK100MHZ;
  wire CLK100MHZ_IBUF;
  wire CLK100MHZ_IBUF_BUFG;
  wire [1:0]led;
  wire led0_b;
  wire led0_b_OBUF;
  wire led0_g;
  wire led0_g_OBUF;
  wire led0_r;
  wire led0_r_OBUF;
  wire [1:0]led_OBUF;

  BUFG CLK100MHZ_IBUF_BUFG_inst
       (.I(CLK100MHZ_IBUF),
        .O(CLK100MHZ_IBUF_BUFG));
  IBUF CLK100MHZ_IBUF_inst
       (.I(CLK100MHZ),
        .O(CLK100MHZ_IBUF));
  BinaryCounter counter
       (.CLK(led_OBUF[0]),
        .Q({led0_r_OBUF,led0_g_OBUF,led0_b_OBUF}));
  ClockDivider divider
       (.CLK100MHZ_IBUF_BUFG(CLK100MHZ_IBUF_BUFG),
        .led_OBUF(led_OBUF));
  OBUF led0_b_OBUF_inst
       (.I(led0_b_OBUF),
        .O(led0_b));
  OBUF led0_g_OBUF_inst
       (.I(led0_g_OBUF),
        .O(led0_g));
  OBUF led0_r_OBUF_inst
       (.I(led0_r_OBUF),
        .O(led0_r));
  OBUF \led_OBUF[0]_inst 
       (.I(led_OBUF[0]),
        .O(led[0]));
  OBUF \led_OBUF[1]_inst 
       (.I(led_OBUF[1]),
        .O(led[1]));
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
