`timescale 1ns / 1ps

module pipeline(
	in1,
	in2,
	in3,
	clk,
	rst,
	out
);

input	clk;
input	rst;
input	[9:0] in1;
input	[9:0] in2;
input	[9:0] in3;
output	[11:0] out;
	
reg	[10:0] sum1;
always @(posedge clk, negedge rst)begin
	if(!rst)
		sum1  <= 11'b0;
	else
		sum1  <= {1'b0,in1} +{1'b0,in2};
end

reg	[9:0] temp_in3;
always @(posedge clk, negedge rst)begin
	if(!rst)
		temp_in3 <= 10'b0;
	else
		temp_in3 <= in3;
end

reg	[11:0] out;	
always @(posedge clk, negedge rst)begin
	if(!rst)
		out <= 12'b0;
	else
		out <= {1'b0,sum1} + {2'b0,temp_in3};
end

endmodule
