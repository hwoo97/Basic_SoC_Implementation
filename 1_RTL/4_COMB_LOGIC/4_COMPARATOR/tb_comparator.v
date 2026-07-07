`timescale 1ns / 1ps

module tb_comparator;

//stimulus signal
reg	[3:0]	i_a, i_b	;

//monitor signal
wire o_equal, o_greater, o_less	;

//DUT instantiation
comparator uut(
	.i_a(i_a),
	.i_b(i_b),
	.o_equal(o_equal),
	.o_greater(o_greater),
	.o_less(o_less)
);

initial begin
	$dumpfile("./comparator.vcd");
	$dumpvars(0, tb_comparator);
end

initial begin
	// system task for monitoring
	$monitor("%0t\t %b\t %b\t %b\t %b\t %b", $time, i_a, i_b, o_equal, o_greater, o_less);

	// apply stimulus
	i_a = 32'd12; i_b = 32'd15; #10;
	i_a = 32'd25; i_b = 32'd20; #10;
	i_a = 32'd10; i_b = 32'd10; #10;
	i_a = 32'd18; i_b = 32'd22; #10;
	i_a = 32'd30; i_b = 32'd16; #10;
	i_a = 32'd19; i_b = 32'd19; #10;

	#10; $finish;
end

endmodule
