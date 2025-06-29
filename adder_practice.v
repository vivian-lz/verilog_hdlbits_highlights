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
