set_clock_latency -source -early -max   -0.0001 [get_ports {clk}] -clock clk 
set_clock_latency -source -late -max   -0.0001 [get_ports {clk}] -clock clk 
