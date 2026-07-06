`timescale 1ns / 1ps

module tb_d_latch;

reg	clk	;
reg	i_d	;

wire	o_q	;

d_latch uut(
	.clk(clk),
	.i_d(i_d),
	.o_q(o_q)
);

always #5 clk = ~clk;

initial begin
	$monitor("Time=%0t | clk=%b | d=%b | q=%b",
		$time, clk, i_d, o_q);
	
	clk = 1'b0;
	i_d = 1'b0;
	
	#15 i_d = 1'b1; #20 i_d = 1'b0;
	#10 i_d = 1'b1; #10 i_d = 1'b0;
	#10 i_d = 1'b1; #15 i_d = 1'b0;

	#50; $finish;

end

endmodule
