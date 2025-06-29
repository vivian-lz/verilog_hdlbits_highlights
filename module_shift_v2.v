//provided module: module my_dff8 ( input clk, input [7:0] d, output [7:0] q );
//task: Instantiate three of them, then chain them together to make a 8-bit wide shift register of length 3. 
//In addition, create a 4-to-1 multiplexer (not provided) that chooses what to output depending on sel[1:0]: 
//The value at the input d, after the first, after the second, or after the third D flip-flop. 
//(Essentially, sel selects how many cycles to delay the input, from zero to three clock cycles.)

module mux_4to1 (input in3, input in2, input in1,input in0, output out[7:0]);
    //mux code here
        
endmodule

module top_module (input clk, input [7:0] d, input [1:0] sel, output [7:0] q);
    //top_module code here
    wire one[7:0];
    wire two[7:0];
    wire three[7:0];
    
    my_dff8 instance1 (clk, d, one);
    my_dff8 instance2 (clk, one, two);
    my_dff8 instance3 (clk, two, three);
    mux_4to1 instance_mux (three, two, one, sel, q);

endmodule
