//provided module: module my_dff8 ( input clk, input [7:0] d, output [7:0] q );
//You are given a module my_dff8 with two inputs and one output (that implements a set of 8 D flip-flops). 
//Instantiate three of them, then chain them together to make a 8-bit wide shift register of length 3. 
//In addition, create a 4-to-1 multiplexer (not provided) that chooses what to output depending on sel[1:0]: 
//The value at the input d, after the first, after the second, or after the third D flip-flop. 
//(Essentially, sel selects how many cycles to delay the input, from zero to three clock cycles.)

module mux_4to1 (input in3, input in2, input in1,input in0, input [1:0] sel, output [7:0] out);
    //mux code here
    always @(*) begin
        case (in0)
            2'b00: out = in0;
            2'b01: out = in1;
            2'b10: out = in2;
            2'b11: out = in3;
        endcase
    end
        
endmodule

module top_module (input clk, input [7:0] d, input [1:0] sel, output [7:0] q);
    //top_module code here
    wire [7:0] one;
    wire [7:0] two;
    wire [7:0] three;
    
    my_dff8 instance1 (clk, d, one);
    my_dff8 instance2 (clk, one, two);
    my_dff8 instance3 (clk, two, three);
    mux_4to1 instance_mux (three, two, one, d, sel, q);

endmodule
