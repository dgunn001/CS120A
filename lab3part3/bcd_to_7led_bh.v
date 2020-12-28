`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:07:21 04/17/2019 
// Design Name: 
// Module Name:    bcd_to_7led_bh 
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
    output reg an0,
    output reg an1,
    output reg an2,
    output reg an3
    );
	// Internal wire
wire [3:0] bundle ;
assign bundle = {sw3,sw2,sw1,sw0 } ;
always @(*) begin
// Setting the ANs signals
an0 = 1'b1;
an1 = 1'b1;
an2 = 1'b0;
an3 = 1'b0; // Display in the module AN3
// Setting the segments signals
a = 1'b1;
b = 1'b1;
c = 1'b1;
d = 1'b1;
e = 1'b1;
f = 1'b1;
g = 1'b1;

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
	endcase

end

endmodule
