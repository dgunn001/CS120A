module HalfAdder(
    input wire A,
    input wire B,
    output wire C,
    output wire S
    );
	 assign C =A & B;
	 assign S = A ^B;


endmodule
