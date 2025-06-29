//given module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
//Instantiate two of them to create a 32-bit adder. One add16 module computes the lower 16 bits of the addition result, 
//while the second add16 module computes the upper 16 bits of the result, after receiving the carry-out from the first adder. 
//Your 32-bit adder does not need to handle carry-in (assume 0) or carry-out (ignored), but the internal modules need to 
//in order to function correctly. (In other words, the add16 module performs 16-bit a + b + cin, while your module performs 
//32-bit a + b).
module adder1(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout_internal;
    add16 lower_adder (a[15:0], b[15:0], 1'd0, sum[15:0], cout_internal);
    add16 higher_adder(a[31:16], b[31:16], cout_internal, sum[31:16]);

endmodule
