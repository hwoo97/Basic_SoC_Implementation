`timescale 1ns / 1ps

module tb_updown_counter;

reg		clk		;
reg		rst_n		;
reg		i_ena		;
reg		i_up_down	;

wire	[3:0]	o_count		;

updown_counter uut(
	.clk(clk),
	.rst_n(rst_n),
	.i_ena(i_ena),
	.i_up_down(i_up_down),
	.o_count(o_count)
);

always #5 clk = ~clk;

initial begin
	clk = 1'b0; rst_n = 1'b0; i_ena = 1'b0; i_up_down = 1'b0;

	#20 rst_n = 1'b1; i_ena = 1'b1;

	#10;
	repeat(20) begin
		i_up_down = $random % 2;
		@(negedge clk);
	end

	#20 $finish;
end

endmodule	
