// Verilog test fixture created from schematic C:\CS\CS120 Labs\ee120a_L2P1_sprinkler_valve_controller\sprinkler_circuit.sch - Wed Apr 10 19:28:11 2019

`timescale 1ns / 1ps

module sprinkler_circuit_sprinkler_circuit_sch_tb();

// Inputs
   reg A;
   reg C;
   reg B;
   reg Enable;

// Output
   wire D0;
   wire D1;
   wire D2;
   wire D3;
   wire D4;
   wire D5;
   wire D6;
   wire D7;

// Bidirs

// Instantiate the UUT
   sprinkler_circuit UUT (
		.A(A), 
		.C(C), 
		.B(B), 
		.Enable(Enable), 
		.D0(D0), 
		.D1(D1), 
		.D2(D2), 
		.D3(D3), 
		.D4(D4), 
		.D5(D5), 
		.D6(D6), 
		.D7(D7)
   );
// Initialize Inputs
   `ifdef auto_init
       initial begin
		 Enable = 1;
		A = 0;
		C = 0;
		B = 0;
		#100; // Wait for 100 ns
$display("TC11 ");
if ( D0 != 1'b1 ) $display ("Result is wrong");
A = 0;
B = 0;
C = 1;
#100;
$display("TC12 ");
if ( D1 != 1'b1 ) $display ("Result is wrong");
A = 0;
B = 1;
C = 0;
#100;
$display("TC13 ");
if ( D2 != 1'b1 ) $display ("Result is wrong");
A = 0;
B = 1;
C = 1;
#100;
$display("TC14 ");
if ( D3 != 1'b1 ) $display ("Result is wrong");
A = 1;
B = 0;
C = 0;
#100;
$display("TC15 ");
if ( D4 != 1'b1 ) $display ("Result is wrong");
A = 1;
B = 0;
C = 1;
#100; 
   `endif
endmodule
