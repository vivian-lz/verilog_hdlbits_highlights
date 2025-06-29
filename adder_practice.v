//given module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
//An adder-subtractor can be built from an adder by optionally negating one of the inputs, which is equivalent 
//to inverting the input then adding 1. The net result is a circuit that can do two operations: (a + b + 0) 
//and (a + ~b + 1).
//subtractor utilizes twos complement, where a - b is done with a + ~b + 1
//Use a 32-bit wide XOR gate to invert the b input whenever sub is 1. 
//(This can also be viewed as b[31:0] XORed with sub replicated 32 times. See replication operator.). 
//Also connect the sub input to the carry-in of the adder.
module adder_subtractor(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] xor_gate;
    wire carry_internal;
    assign xor_gate = b ^ {32{sub}};
    add16 lower (a[15:0], xor_gate[15:0], sub, sum[15:0], carry_internal);
    add16 higher (a[31:16], xor_gate[31:16], carry_internal, sum[31:16]);

endmodule


//given module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
//carry select adder improves the performance and speed of the 32 bit adder

module carry_select_adder(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout;
    reg [15:0] mux0;
    reg [15:0] mux1;
    add16 lower_instance (a[15:0], b[15:0], 1'd0, sum[15:0], cout);
    add16 higher0 (a[31:16], b[31:16], 1'd0, mux0);
    add16 higher1 (a[31:16], b[31:16], 1'd1, mux1);
    assign sum[31:16] = (cout == 1'd0) ? mux0 : mux1; //fast 2to1 mux
    
endmodule


//given module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
//You must instantiate two of them to create a 32-bit adder. 
//One add16 module computes the lower 16 bits of the addition result, while the second add16 module computes 
//the upper 16 bits of the result. Your 32-bit adder does not need to handle carry-in (assume 0) or carry-out (ignored).
//Within each add16, 16 full adders (module add1, not provided) are instantiated to actually perform the addition. You must write the full adder module
module adder32 (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire carry_internal;
    add16 lower_instance (a[15:0], b[15:0], 1'd0, sum[15:0], carry_internal);
    add16 higher_instance (a[31:16], b[31:16], carry_internal, sum[31:16]);

endmodule

module add1 ( input a, input b, input cin, output sum, output cout );
// Full adder module here
    reg x;
    assign x = a ^ b;
    assign sum = x ^ cin;
    assign cout = (a & b) | (x & cin);

endmodule
