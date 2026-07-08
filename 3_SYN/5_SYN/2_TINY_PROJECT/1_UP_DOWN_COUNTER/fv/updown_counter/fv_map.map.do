
//input ports
add mapped point clk clk -type PI PI
add mapped point rst_n rst_n -type PI PI
add mapped point i_ena i_ena -type PI PI
add mapped point i_up_down i_up_down -type PI PI

//output ports
add mapped point o_count[3] o_count[3] -type PO PO
add mapped point o_count[2] o_count[2] -type PO PO
add mapped point o_count[1] o_count[1] -type PO PO
add mapped point o_count[0] o_count[0] -type PO PO

//inout ports




//Sequential Pins
add mapped point o_count[2]/q o_count_reg[2]/Q -type DFF DFF
add mapped point o_count[3]/q o_count_reg[3]/Q -type DFF DFF
add mapped point o_count[1]/q o_count_reg[1]/Q -type DFF DFF
add mapped point o_count[0]/q o_count_reg[0]/Q -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
