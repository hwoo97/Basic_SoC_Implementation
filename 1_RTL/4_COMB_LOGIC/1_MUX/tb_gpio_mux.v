`timescale 1ns / 1ps

module tb_gpio_mux;

reg	[1:0]	i_sel;
reg		i_tx0;
reg		i_rx0;
reg		i_pwm1;
reg		i_other_signal;
wire		o_gpio_pin;

gpio_mux uut(
	.i_sel(i_sel),
	.i_tx0(i_tx0),
	.i_rx0(i_rx0),
	.i_pwm1(i_pwm1),
	.i_other_signal(i_other_signal),
	.o_gpio_pin(o_gpio_pin)
);

//apply stimulus
initial begin
	i_tx0 = 1'b0;
	i_rx0 = 1'b1;
	i_pwm1 = 1'b0;
	i_other_signal = 1'b1;
	
	//test ventor generation > coverage 100%
	i_sel = 2'b00; #10;
	i_sel = 2'b01; #10;
	i_sel = 2'b10; #10;
	i_sel = 2'b11; #10;

	$finish;
end

initial begin
	$dumpfile("./gpio.vcd");
	$dumpvars(0,tb_gpio_mux);
end

endmodule
