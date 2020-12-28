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
output reg walk
);
reg reset;
reg reset2;
wire timer;
wire timer2;
reg Breg;
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