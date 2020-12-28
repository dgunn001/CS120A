// Verilog test fixture created from schematic C:\CS\CS120 Labs\ee120a_L2P1_sprinkler_valve_controller\sprinkler_circuit.sch - Wed Apr 10 19:39:51 2019

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
       initial begin
	Enable = 1;
A = 0;
B = 0;
C = 0;
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
$display("TC16 ");
if ( D5 != 1'b1 ) $display ("Result is wrong");
A = 1;
B = 1;
C = 0;
#100;
$display("TC17 ");
if ( D6 != 1'b1 ) $display ("Result is wrong");
A = 1;
B = 1;
C = 1;
#100;
$display("TC18 ");
if ( D7 != 1'b1 ) $display ("Result is wrong");
   end
endmodule
/*
module sprinkler_circuit(
// I/0 ports
input wire Enable ,
input wire A ,
input wire B ,
input wire C ,
output wire D0,
output wire D1,
output wire D2,
output wire D3,
output wire D4,
output wire D5,
output wire D6,
output wire D7
);
// Using the and4 module to set all outputs
and4 c1(e, ~a, ~b, ~c, d0) ;
// Your code goes here
assign r = e&a&b&c;
endmodule

*/
