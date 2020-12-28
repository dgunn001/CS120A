`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:22:14 05/01/2019 
// Design Name: 
// Module Name:    hexto7 
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
module bcd_to_7led_bh(
    input wire sw0,
    input wire sw1,
    input wire sw2,
    input wire sw3,
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
	b = 1'b0 ;
	c = 1'b0 ;
	d = 1'b0 ;
	e = 1'b0 ;
	f = 1'b0 ;
	g = 1'b1;
	end
	
		4'b0001 : begin // 0
	a = 1'b1 ;
	b = 1'b0 ;
	c = 1'b0 ;
	d = 1'b1 ;
	e = 1'b1 ;
	f = 1'b1 ;
	g = 1'b1;
	end
		4'b0010 : begin // 0
	a = 1'b0 ;
	b = 1'b0 ;
	c = 1'b1 ;
	d = 1'b0 ;
	e = 1'b0 ;
	f = 1'b1 ;
	g = 1'b0;
	end
		4'b0011 : begin // 0
	a = 1'b0 ;
	b = 1'b0 ;
	c = 1'b0 ;
	d = 1'b0 ;
	e = 1'b1 ;
	f = 1'b1 ;
	g = 1'b0;
	end
		4'b0100 : begin // 0
	a = 1'b1 ;
	b = 1'b0 ;
	c = 1'b0 ;
	d = 1'b1 ;
	e = 1'b1 ;
	f = 1'b0 ;
	g = 1'b0;
	end
		4'b0101 : begin // 0
	a = 1'b0 ;
	b = 1'b1 ;
	c = 1'b0 ;
	d = 1'b0 ;
	e = 1'b1 ;
	f = 1'b0 ;
	g = 1'b0;
	end
		4'b0110 : begin // 0
	a = 1'b0 ;
	b = 1'b1 ;
	c = 1'b0 ;
	d = 1'b0 ;
	e = 1'b0 ;
	f = 1'b0 ;
	g = 1'b0;
	end
		4'b0111 : begin // 0
	a = 1'b0 ;
	b = 1'b0 ;
	c = 1'b0 ;
	d = 1'b1 ;
	e = 1'b1 ;
	f = 1'b1 ;
	g = 1'b1;
	end
		4'b1000 : begin // 0
	a = 1'b0 ;
	b = 1'b0 ;
	c = 1'b0 ;
	d = 1'b0 ;
	e = 1'b0 ;
	f = 1'b0 ;
	g = 1'b0;
	end
	4'b1001 : begin // 0
	a = 1'b0 ;
	b = 1'b0 ;
	c = 1'b0 ;
	d = 1'b0 ;
	e = 1'b1 ;
	f = 1'b0 ;
	g = 1'b0;
	end
	4'b1010 : begin
	a = 1'b0 ;
	b = 1'b0 ;
	c = 1'b0 ;
	d = 1'b1 ;
	e = 1'b0 ;
	f = 1'b0 ;
	g = 1'b0;
	end
	4'b1011 : begin // b
	a = 1'b1 ;
	b = 1'b1 ;
	c = 1'b0 ;
	d = 1'b0 ;
	e = 1'b0 ;
	f = 1'b0 ;
	g = 1'b0;
	end
	4'b1100 : begin //c
	a = 1'b0 ;
	b = 1'b1 ;
	c = 1'b1 ;
	d = 1'b0 ;
	e = 1'b0 ;
	f = 1'b0 ;
	g = 1'b1;
	end
	4'b1101 : begin //d
	a = 1'b1 ;
	b = 1'b0 ;
	c = 1'b0 ;
	d = 1'b0 ;
	e = 1'b0 ;
	f = 1'b1 ;
	g = 1'b0;
	end
	4'b1110 : begin //e
	a = 1'b0 ;
	b = 1'b1 ;
	c = 1'b1 ;
	d = 1'b0 ;
	e = 1'b0 ;
	f = 1'b0 ;
	g = 1'b0;
	end
	4'b1111 : begin //f
	a = 1'b0 ;
	b = 1'b1 ;
	c = 1'b1 ;
	d = 1'b1 ;
	e = 1'b0 ;
	f = 1'b0 ;
	g = 1'b0;
	end		
	endcase

end

endmodule

module dispmux_main_bh(
input clk,
input sw0, // Switch input
input sw1, // Switch input
input sw2, // Switch input
input sw3, // Switch input
output [3:0] an , // LED selector
output [7:0] sseg // Segment signals
 );
 
 wire [7:0] in0; wire [7:0] in1; wire [7:0] in2; wire [7:0] in3; 
 
bcd_to_7led_bh c1(sw0, sw1, sw2, sw3,
in0[0],in0[1],in0[2],in0[3], in0[4],in0[5],in0[6],in0[7] ); 
// Your code
// ---------------------------------

bcd_to_7led_bh c2(sw0, sw1, sw2, sw3,
in1[0],in1[1],in1[2],in1[3], in1[4],in1[5],in1[6],in1[7]);

bcd_to_7led_bh c3(sw0, sw1, sw2, sw3,
in2[0],in2[1],in2[2],in2[3], in2[4],in2[5],in2[6],in2[7]);

bcd_to_7led_bh c4(sw0, sw1, sw2, sw3,
in3[0],in3[1],in3[2],in3[3], in3[4],in3[5],in3[6],in3[7]);


// Module instantiation Mux
// ---------------------------------
disp_mux_bh c5(
 .clk (clk) ,
 .in0 (in0) ,
 .in1 (in1) ,
 .in2 (in2) ,
 .in3 (in3) ,
 .an (an) ,
 .sseg (sseg ) ) ;
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
r_qreg <= c_next ;
end
endmodule

