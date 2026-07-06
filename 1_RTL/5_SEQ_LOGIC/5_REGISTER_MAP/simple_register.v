`timescale 1ns / 1ps

module simple_register (
	// port list
	clk	,
	rst_n	,
	wen	,
	i_wdata	,
	o_rdata
);

input		clk	;
input		rst_n	;
input		wen	;
input	[31:0]	i_wdata	;
output	[31:0]	o_rdata	;

//32-bit internal register
reg	[31:0]	r_reg32	;

//moderling
always @(posedge clk or negedge rst_n) begin
	if (~rst_n) begin
		r_reg32 <= 32'b0	;
	end else if (wen) begin
		r_reg32 <= i_wdata	;
	end
end

assign o_rdata = r_reg32	; //assing >> wire

endmodule
