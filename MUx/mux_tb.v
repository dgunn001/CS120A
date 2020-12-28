`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:48:50 04/17/2019
// Design Name:   Structure
// Module Name:   C:/CS/CS120 Labs/MUx/mux_tb.v
// Project Name:  MUx
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Structure
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux_tb;

	// Inputs
	reg s1;
	reg s0;
	reg i0;
	reg i1;
	reg i2;
	reg i3;

	// Outputs
	wire d;

	// Instantiate the Unit Under Test (UUT)
	Structure uut (
		.s1(s1), 
		.s0(s0), 
		.i0(i0), 
		.i1(i1), 
		.i2(i2), 
		.i3(i3), 
		.d(d)
	);
	and3 UUT(
		.a(a),
		.b(b),
		.c(c),
		.d(d)
	);

	initial begin
		// Initialize Inputs
		s1 = 0;
		s0 = 0;
		i0 = 0;
		i1 = 0;
		i2 = 0;
		i3 = 0;

		// Wait 100 ns for global reset to finish
		#100;
		$display("TC11 ");
	if ( d != i0 ) $display ("Result is wrong");
	s1 = 0;
	s0 = 1;
	#100;
	$display("TC12 ");
	if ( d != i1 ) $display ("Result is wrong");
	s1 = 1;
	s0 = 0;
	#100;
	$display("TC13 ");
	if ( d != i2 ) $display ("Result is wrong");
	s1 = 1;
	s0 = 1;
	#100;
	$display("TC14 ");
	if ( d != i3 ) $display ("Result is wrong");
 // Your test cases

end

endmodule
        
		// Add stimulus here


