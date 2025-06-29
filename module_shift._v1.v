
//given module my_dff ( input clk, input d, output q );
//The task was to instantiate three of them, then chain them together to make a shift register of length 3.
module top_module ( input clk, input d, output q );
    wire one;
    wire two;
    my_dff instance1 (clk, d, one);
    my_dff instance2 (clk, one, two);
    my_dff instance3 (clk, two, q);

endmodule
