`timescale 1ns / 1ps

module tb_register;

reg		rst_n	;
reg		clk	;
reg		i_in1	;
reg	[3:0]	i_in2	;

wire		o_out1	;
wire	[3:0]	o_out2	;

register uut(
	.rst_n(rst_n),
	.clk(clk),
	.i_in1(i_in1),
	.i_in2(i_in2),
	.o_out1(o_out1),
	.o_out2(o_out2)
);

always #5 clk = ~clk	;

initial begin

	rst_n	= 1'b0		;
	clk	= 1'b0		;
	i_in1	= 1'b0		;
	i_in2	= 4'b0000	;

	#1000 rst_n = 1'b1	;

	#200 i_in1 = 1'b1	;

	#100 i_in2 = 4'b1010	;

	#500 rst_n = 1'b0	;

	#200 i_in1 = 1'b0	;
		i_in2 = 4'd0	;

	#300 i_in1 = 1'b0	;
		i_in2 = 4'b1111	;

	#100 rst_n = 1'b1	;

	#200 $finish;
end

endmodule
