`timescale 1ns / 1ps

module FSM2 (
	//port list
	clk	,
	rst_n	,
	go	,
	rd	,
	ws	,
	ds
);

input	clk;
input	rst_n;
input	go;
input	ws;

output rd;
output ds;

parameter IDLE	= 2'b00;
parameter READ	= 2'b01;
parameter DLY	= 2'b11;
parameter DONE	= 2'b10;

reg	[1:0] state;
reg	[1:0] next;

reg rd;
reg ds;
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) state <= IDLE;
	else	   state <= next;
end

always @(posedge clk or negedge rst_n) begin
	next = 2'bx; rd = 1'b0; ds = 1'b0;
	case (state)
		IDLE	: if(go)	next = READ;
			  else		next = IDLE;
		READ	: begin
				rd = 1'b1;
				next = DLY;
			  end
		DLY	: begin
				ds = 1'b1;
				if(!ws)	next = DONE;
				else	next = READ;
			  end
		DONE	: begin
				ds = 1'b1;
				next = IDLE;
			  end
	endcase
end

endmodule
