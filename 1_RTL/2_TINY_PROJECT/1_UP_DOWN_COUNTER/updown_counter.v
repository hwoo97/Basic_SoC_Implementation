`timescale 1ns / 1ps

module updown_counter(
	clk,
	rst_n,
	i_ena,
	i_up_down,
	o_count	
);

input	clk		;
input	rst_n		;
input	i_ena		;	
input	i_up_down	;

output	[3:0]	o_count	;

reg	[3:0]	o_count	;
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		o_count <= 4'b0;
	else if (i_ena) begin
		if(i_up_down)
			o_count <= o_count + 1'b1;
		else
			o_count <= o_count - 1'b1;
	end
end

endmodule
