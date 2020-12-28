//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:53:15 05/15/2019 
// Design Name: 
// Module Name:    laser_surgery_sys 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////
///////
///////////////////////////////////////////////////////////////////////////
///////
module trafficLight #(
parameter NBITS = 32
)
(
input wire b ,
input wire clk ,
output reg light,
output reg light2,
output reg walk,
output [3:0] an,
output [7:0] sseg
);
wire [7:0] in0;
wire [7:0] in1;
wire [7:0] in2;
wire [7:0] in3;
reg reset;
reg reset2;
wire timer;
wire timer2;
reg Breg;
reg sw0;
reg sw1;
reg sw2;
reg sw3;
reg sw4;
reg sw5;
reg [1:0] current_state ;
reg [1:0] next_state ; 
wire [NBITS-1:0] cnt_ini ;
wire [NBITS-1:0] cnt_rst ;
wire [NBITS-1:0] cnt_rst2;
// --------------------------------------
// Sequential logic
// --------------------------------------
always @(posedge clk) begin
current_state = next_state ;
end
// --------------------------------------
// Comb. Logic
// --------------------------------------
assign cnt_ini = 32'h0000 ;
assign cnt_rst = 32'h8F0D180; // 3 secs ( 50 MHZ internal clock )
assign cnt_rst2 = 32'hEE6B280; // 5 secs ( 50 MHX internal clock)
// --------------------------------------
// Comb. Logic - FSM
// --------------------------------------
localparam L1 = 2'b00 ;
localparam L2 = 2'b01 ;
localparam WALK = 2'b10 ;
always @( current_state ) begin



case (current_state)
 L1 : begin
 Breg = b? b : Breg;
 next_state = timer? Breg? WALK:L2 : L1;
 reset = 1'b0;
 reset2 = 1'b1;
 walk = 1'b0;
 light = 1'b1;
 light2 = 1'b0;
  sw0 = 1'b0;
 sw1 = 1'b0;
 sw2 = 1'b0;
 sw3 = 1'b0;
 sw4 = 1'b1;
 sw5 = 1'b1;
 // your code for state transition
 end

 L2 : begin
	Breg = b? b : Breg;
 next_state = timer? Breg? WALK:L1 : L2;
 reset = 1'b0;
 reset2 = 1'b1;
 walk = 1'b0;
 light = 1'b0;
 light2 = 1'b1;
 sw0 = 1'b0;
 sw1 = 1'b0;
 sw2 = 1'b0;
 sw3 = 1'b0;
 sw4 = 1'b0;
 sw5 = 1'b0;
 // your code for state transition
	end
 WALK: begin
 Breg = 1'b0;
 next_state = timer2? L1:WALK;
 reset = 1'b1;
 reset2 = 1'b0;
 walk = 1'b1;
 light = 1'b0;
 light2 = 1'b0;
 sw0 = 1'b0;
 sw1 = 1'b0;
 sw2 = 1'b0;
 sw3 = 1'b0;
 sw4 = 1'b0;
 sw5 = 1'b1;
 // your code for state transition
 end 
default: begin
Breg = 1'b0;
 light = 1'b0 ;
 light2 = 1'b1;
 walk = 1'b0;
reset = 1'b0;
reset2 = 1'b1; 
next_state = L1 ;
 end
endcase
end
// --------------------------------------
// Timer instantiation
// --------------------------------------
timer_st #( .NBITS(NBITS) ) timerst (
.timer(timer),
.clk(clk),
.reset(reset) ,
.cnt_ini(cnt_ini) ,
.cnt_rst(cnt_rst)
);

timer_st #( .NBITS(NBITS) ) timerst2 (
.timer(timer2),
.clk(clk),
.reset(reset2) ,
.cnt_ini(cnt_ini) ,
.cnt_rst(cnt_rst2)
);

disp_mux_bh c5(
.clk (clk),
.in0 (in0) ,
 .in1 (in1) ,
 .in2 (in2) ,
 .in3 (in3) ,
 .an (an) ,
 .sseg (sseg ) ) ;
 
   bcd_to_7led_bh c1(sw0, sw1, sw2, sw3,
in0[0],in0[1],in0[2],in0[3], in0[4],in0[5],in0[6],in0[7] ); 
 bcd_to_7led_bh c2(sw0, sw1, sw4, sw5,
in1[0],in1[1],in1[2],in1[3], in1[4],in1[5],in1[6],in1[7] );
 bcd_to_7led_bh c3(sw0, sw1, sw4, sw5,
in2[0],in2[1],in2[2],in2[3], in2[4],in2[5],in2[6],in2[7] );
 bcd_to_7led_bh c4(sw0, sw1, sw4, sw5,
in3[0],in3[1],in3[2],in3[3], in3[4],in3[5],in3[6],in3[7] );
endmodule

module flopr #( parameter NBITS = 16 )(
 input clk,
input reset,
input [NBITS-1:0] cnt_ini,
input [NBITS-1:0] nextq,
output[NBITS-1:0] q
);
reg [NBITS-1:0] iq ;
always @(posedge clk) begin 
if (reset) begin
iq <= cnt_ini ;
 end
 else begin
iq <= nextq;
 end
end
assign q = iq ;
endmodule
module comparatorgen_st #( parameter NBITS = 16 )(
output wire r ,
input wire[NBITS-1:0] a ,
input wire[NBITS-1:0] b );
wire [NBITS-1:0] iresult ;
genvar k ;
generate
for (k=0; k < NBITS; k = k+1)
begin : blk
 xor c1 (iresult[k], a[k], b[k] ) ;
end
endgenerate
// Reduction plus negation
assign r = ~(|iresult);
endmodule
module fulladder_st(
output wire r,
output wire cout,
input wire a,
input wire b,
input wire cin
) ;
assign r = (a ^ b) ^ (cin) ;
assign cout = (a & b) | ( a & cin ) | ( b & cin ) ;
endmodule
module addergen_st #( parameter NBITS = 16 )(
output wire[NBITS-1:0] r ,
output wire cout ,
input wire[NBITS-1:0] a ,
input wire[NBITS-1:0] b ,
input wire cin ) ;
wire [NBITS:0] carry;
assign carry[0]= cin ;
genvar k ;
generate
for (k=0; k < NBITS; k = k+1)
begin : blk
 fulladder_st FA (
 .r(r[k]),
 .cout(carry[k+1]),
 .a(a[k]),
 .b(b[k]),
 .cin(carry[k]) ) ;
end
endgenerate
assign cout = carry[NBITS] ;
endmodule
module adder #( parameter NBITS = 16 )(
input [NBITS-1:0] q ,
input [NBITS-1:0] cnt_ini ,
input [NBITS-1:0] cnt_rst ,
output[NBITS-1:0] nextq,
output tick
);
wire same ;
wire[NBITS-1:0] inextq;
// ------------------------------------------------
// inextq = q + 1 ;
// ------------------------------------------------
addergen_st #(.NBITS(NBITS))
nextval ( .r(inextq), // Next value
 .cout(), // Carry out - Don't use
 .a(q), // Current value
 .b(16'b0000_0001), // Plus One
 .cin(16'b0000_0000) ) ; // No carry in
// ------------------------------------------------
// Are inextq and cnt_rst equal ?
// ------------------------------------------------
comparatorgen_st #(.NBITS(NBITS))
comparator (
.r(same) ,
.a(inextq),
.b(cnt_rst) );
// -----------------------------------------------------------------
// If they are the same produce a tick and set the value for nextq
// -----------------------------------------------------------------
assign tick = (same) ? 'd1 : 'd0 ;
assign nextq = (same) ? cnt_ini : inextq ;
endmodule
module timer_st #(
 parameter NBITS = 32
)
(
 output wire timer ,
 input wire clk ,
 input wire reset,
 input [NBITS-1:0] cnt_ini ,
 input [NBITS-1:0] cnt_rst
);
wire [NBITS-1:0] q ;
wire [NBITS-1:0] qnext ;
// Compute the next value
adder #( .NBITS(NBITS ) )
 c1 (.q(q),
.cnt_ini(cnt_ini),
.cnt_rst(cnt_rst),
.nextq(qnext),
.tick(timer) );
// Save the next state
flopr #( .NBITS(NBITS ) )
 c2 (.clk(clk),
.reset(reset),
.cnt_ini(cnt_ini),
.nextq(qnext),
.q(q) );
endmodule

module bcd_to_7led_bh(
    input  sw0,
    input sw1,
    input sw2,
    input  sw3,
    output reg a,
    output reg b,
    output reg c,
    output reg d,
    output reg e,
    output reg f,
    output reg g, 
	output reg dp
    );
	// Internal wire
wire [3:0] bundle ;
assign bundle = {sw3,sw2,sw1,sw0 } ;
always @(*) begin
// Setting the ANs signals
//an0 = 1'b1;
//an1 = 1'b1;
//an2 = 1'b0;
//an3 = 1'b0; // Display in the module AN3
// Setting the segments signals
a = 1'b1;
b = 1'b1;
c = 1'b1;
d = 1'b1;
e = 1'b1;
f = 1'b1;
g = 1'b1;
dp = 1'b1;

case ( bundle )
	4'b0000 : begin // 0
	a = 1'b0 ;
	b = 1'b1 ;
	c = 1'b0 ;
	d = 1'b0 ;
	e = 1'b0;
	f = 1'b0 ;
	g = 1'b1;
	end
	
		4'b0001 : begin // 0
	a = 1'b0 ;
	b = 1'b0 ;
	c = 1'b0 ;
	d = 1'b0 ;
	e = 1'b0 ;
	f = 1'b0 ;
	g = 1'b1;
	end
		4'b0010 : begin // 0
	a = 1'b1 ;
	b = 1'b0 ;
	c = 1'b0 ;
	d = 1'b1 ;
	e = 1'b0 ;
	f = 1'b0 ;
	g = 1'b1;
	end
			4'b0011 : begin // 0
	a = 1'b0 ;
	b = 1'b1 ;
	c = 1'b1 ;
	d = 1'b0 ;
	e = 1'b1 ;
	f = 1'b1 ;
	g = 1'b0;
	end
	endcase
	
	end
	
endmodule

module disp_mux_bh(
input clk ,
input wire [7:0] in0 ,
input wire [7:0] in1 ,
input wire [7:0] in2 ,
input wire [7:0] in3 ,
output reg [3:0] an ,
output reg [7:0] sseg
);
reg [16:0] r_qreg ;
reg [16:0] c_next ;
// Mux **************************************
always @(*) begin
case (r_qreg[1:0])
2'b00 : sseg = in0 ;
2'b01 : sseg = in1 ;
2'b10 : sseg = in2 ;
2'b11 : sseg = in3 ;
endcase
end
// Decoder ***********************************
always @(*) begin
case (r_qreg[1:0])
2'b00 : an = ~(4'b0001) ;
2'b01 : an = ~(4'b0010) ;
2'b10 : an = ~(4'b0100) ;
2'b11 : an = ~(4'b1000) ;
endcase
end
// Counter ***********************************
always @(*) begin
c_next = r_qreg + 'd1;
end
// Register
always @(posedge clk) begin
r_qreg<= c_next;
end

endmodule
