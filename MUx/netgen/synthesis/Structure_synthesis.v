////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: Structure_synthesis.v
// /___/   /\     Timestamp: Wed Apr 17 15:49:01 2019
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim Structure.ngc Structure_synthesis.v 
// Device	: xc3s100e-5-cp132
// Input file	: Structure.ngc
// Output file	: C:\CS\CS120 Labs\MUx\netgen\synthesis\Structure_synthesis.v
// # of Modules	: 1
// Design Name	: Structure
// Xilinx        : D:\CS\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module Structure (
  i0, i1, i2, i3, d, s0, s1
);
  input i0;
  input i1;
  input i2;
  input i3;
  output d;
  input s0;
  input s1;
  wire N5;
  wire N6;
  wire d_OBUF_3;
  wire i0_IBUF_5;
  wire i1_IBUF_7;
  wire i2_IBUF_9;
  wire i3_IBUF_11;
  wire s0_IBUF_13;
  wire s1_IBUF_15;
  IBUF   i0_IBUF (
    .I(i0),
    .O(i0_IBUF_5)
  );
  IBUF   i1_IBUF (
    .I(i1),
    .O(i1_IBUF_7)
  );
  IBUF   i2_IBUF (
    .I(i2),
    .O(i2_IBUF_9)
  );
  IBUF   i3_IBUF (
    .I(i3),
    .O(i3_IBUF_11)
  );
  IBUF   s0_IBUF (
    .I(s0),
    .O(s0_IBUF_13)
  );
  IBUF   s1_IBUF (
    .I(s1),
    .O(s1_IBUF_15)
  );
  OBUF   d_OBUF (
    .I(d_OBUF_3),
    .O(d)
  );
  MUXF5   d_8 (
    .I0(N5),
    .I1(N6),
    .S(s1_IBUF_15),
    .O(d_OBUF_3)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  d_F (
    .I0(s0_IBUF_13),
    .I1(i0_IBUF_5),
    .I2(i1_IBUF_7),
    .O(N5)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  d_G (
    .I0(s0_IBUF_13),
    .I1(i2_IBUF_9),
    .I2(i3_IBUF_11),
    .O(N6)
  );
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

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
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

