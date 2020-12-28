`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:21:24 04/24/2019 
// Design Name: 
// Module Name:    RisingEdge 
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
module RisingEdge(
    input wire sw1,
	 input wire clk,
	 output reg outedge
    );
wire slow_clk ;
reg [1:0] c_state ;
reg [1:0] r_state ;
localparam ZERO = 'd0;
localparam CHANGE = 'd1;
localparam ONE = 'd2;

clkdiv c1(clk, slow_clk );

always @(*) begin
 case (r_state)

	ZERO : begin 
		c_state = sw1? CHANGE:ZERO;
		outedge = 'd0;
		end
	CHANGE : begin
		c_state = sw1? ONE:ZERO;
		outedge = 'd1;
			end
	ONE : begin
		c_state = sw1? ONE:ZERO;
		outedge = 'd0;
		end
	default : begin
			c_state = ZERO ;
			outedge = 'd0 ;
	end
 endcase
end 
// ---------------------------------
// Seq. logic
// ---------------------------------
always @( posedge slow_clk ) begin
r_state <= c_state ;
end 
endmodule

//slower clk
module clkdiv(clk,clk_out);
 input clk;
 output clk_out;

 reg [17:0] COUNT;
 assign clk_out=COUNT[17];
 always @(posedge clk)
 begin
 COUNT = COUNT + 1;
 end

endmodule
