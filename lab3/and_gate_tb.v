// Verilog test fixture created from schematic C:\CS\CS120 Labs\lab3\and_gate.sch - Wed Apr 17 18:35:51 2019

`timescale 1ns / 1ps

module and_gate_and_gate_sch_tb();

// Inputs
 reg i1;
 reg i2;
// Output
 wire d;
// Bidirs

// Instantiate the UUT
   and_gate UUT (
		.i1(i1),
		.i2(i2),
		.d(d)
   );
// Initialize Inputs
       initial begin
		 i1 = 0;
		 i2 = 0;
		 #100
		 i1 = 1;
		 i2 = 1;
		 #100
		 i1 = 0;
		 i2 = 1;
		 #100
		 i1 = 1;
		 i2 = 1;

end

endmodule
