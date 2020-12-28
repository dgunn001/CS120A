`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:16:44 05/08/2019 
// Design Name: 
// Module Name:    Adder 
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
module falogic(
output  r,
input  x,
input  y,
input cin
 );
xor cx1 ( t1, x,y );
xor cx2 ( r, t1, cin );
endmodule

module register_logic(
 input clk,
 input enable,
 input [4:0] Data ,
 output reg [4:0] Q 
 );
 always @(posedge clk )
 begin
 if ( enable) begin
 Q = Data;
 end
 end
endmodule

module carrylogic(
output [3:0] cout ,
input cin,
input [3:0] x,
input [3:0] y
 );
// Computing all gx
wire g0, g1, g2, g3 ; 
assign g0 = x[0] & y[0] ;
assign g1 = x[1] & y[1] ;
assign g2 = x[2] & y[2] ;
assign g3 = x[3] & y[3] ;
// Computing all px
wire p0, p1, p2, p3 ;
assign p0 = x[0] + y[0] ;
assign p1 = x[1] + y[1] ;
//added code
assign p2 = x[2] + y[2] ;
assign p3 = x[3] + y[3] ;
// Computing all carries
assign cout[0] = g0 | ( p0 & cin) ;
assign cout[1] = g1 | ( p1 & ( g0 | (p0 & cin) ) ) ;
//added code
assign cout[2] = g2 | ( p2 & ( g1 | ( p1 & ( g0 | ( p0 & cin ) ) ) ) ) ;
assign cout[3] = g3 | ( p3 & ( g2 | ( p2 & ( g1 | ( p1 & ( g0 | (p0 & cin) ) ) ) ) ) );
endmodule

module carrylookahead_st(
 input clk ,
 input enable,
 input cin,
 input [3:0] x,
 input [3:0] y,
 output cout,
 output [3:0] r
 );
wire [3:0] c;
wire [3:0] ir1 ;
wire [4:0] ir2;

// Compute Carries
carrylogic cx1 ( c, cin, x, y ) ;
// Compute R
falogic cx6 ( ir1[0], x[0], y[0], cin ) ;
falogic cx7 ( ir1[1], x[1], y[1], c[0] );
falogic cx8 ( ir1[2], x[2], y[2], c[1] );
falogic cx9 ( ir1[3], x[3], y[3], c[2] );



// Register
register_logic cx10 ( clk,1'b1, {c[3],ir1}, ir2 ) ;
// Results
assign r = ir2[3:0] ;
assign cout = ir2[4] ;

endmodule