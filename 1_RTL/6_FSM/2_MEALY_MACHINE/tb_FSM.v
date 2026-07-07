`timescale 1ns / 1ps

module tb_FSM;

reg	clk;
reg	rst_n;
reg	din_bit;

wire	dout_bit;

FSM uut(
	.clk(clk),
	.rst_n(rst_n),
	.din_bit(din_bit),
	.dout_bit(dout_bit)
);

always #5 clk = ~clk;

initial begin
	clk = 1'b0; rst_n = 1'b0; din_bit = 1'b0;

	#20 rst_n = 1'b1;

	repeat(20) begin
		@(posedge clk);
		din_bit = $random % 2;
	end

	#50 $finish;
end

endmodule
