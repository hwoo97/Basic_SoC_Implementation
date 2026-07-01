`timescale 1ns / 1ps

module tb_pipeline;

reg[9:0] in1,in2,in3;
reg clk;
reg rst;
wire [11:0] out;

pipeline uut (
	.in1(in1),
	.in2(in2),
	.in3(in3),
	.clk(clk),
	.rst(rst),
	.out(out)
);

initial begin
	clk = 0;
	forever #10 clk = ~clk;
	end

initial begin
	rst = 0;
	in1 = 0;
	in2 = 0;
	in3 = 0;

	#10;
	rst = 1;

	in1 = 10;
	in2 = 10;
	in3 = 10;

	#20;
	in1 = 15;
	in2 = 20;
	in3 = 25;

	#20;
	in1 = 30;
	in2 = 40;
	in3 = 50;

	#100;
	$finish;
	end

initial begin
	$dumpfile("./pipeline.vcd");
	$dumpvars(0, uut);
	end
endmodule
