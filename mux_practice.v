module mux_2to1( 
    input a, b, sel,
    output out ); 
    
    assign out = (sel == 0) ? a : b;

endmodule

module mux_2to1bus( 
    input [99:0] a, b,
    input sel,
    output [99:0] out );
    
    assign out = (sel == 0) ? a : b;

endmodule
