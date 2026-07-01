`timescale 1ns / 1ps

module gpio_mux(
	i_sel,
	i_tx0,
	i_rx0,
	i_pwm1,
	i_other_signal,
	o_gpio_pin,
);
//stimulus : connected to input(active)
input	[1:0]	i_sel;
input		i_tx0;
input		i_rx0;
input		i_pwm1;
input		i_other_signal;
// monitor signal: connected to output(passive)
output		o_gpio_pin;

reg o_gpio_pin;
always @(*) begin
	case(i_sel)//use gray code
		2'b00 : o_gpio_pin = i_tx0;
		2'b01 : o_gpio_pin = i_rx0;
		2'b11 : o_gpio_pin = i_pwm1;
		2'b10 : o_gpio_pin = i_other_signal;
		default : o_gpio_pin = 1'b0;
	endcase
end

endmodule
