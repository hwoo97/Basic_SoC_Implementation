`timescale 1ns / 1ps

module register(
	rst_n	,
	clk	,
	i_in1	,
	i_in2	,
	o_out1	,
	o_out2
);

input		rst_n	;
input		clk	;
input		i_in1	;
input	[3:0]	i_in2	;
output		o_out1	;
output	[3:0]	o_out2	;

reg o_out1;
always @(posedge clk, negedge rst_n)begin
	if(~rst_n)
		o_out1 <= 1'b0;
	else
		o_out1 <= i_in1;
end

reg [3:0] o_out2;
always @(posedge clk, negedge rst_n)begin
	if(~rst_n)
		o_out2 <= 4'b0;
	else
		o_out2 <= i_in2;
end

endmodule
