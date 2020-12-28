`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:43:54 04/17/2019 
// Design Name: 
// Module Name:    Structure 
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
module and3(a, b, c, d);
   input a,b,c;
	output d;
	assign d = a & b & c;
endmodule

module Structure(
    input  s1,
    input  s0,
    input  i0,
    input  i1,
    input  i2,
    input  i3,
    output  d
    );

wire r1,r2,r3,r4;
and3 c1(~s1,~s0,i0,r1);
and3 c2(~s1,s0,i1,r2);
and3 c3(s1,~s0,i2,r3);
and3 c4(s1,s0,i3,r4);

assign d = r1|r2|r3|r4;

endmodule

