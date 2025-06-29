module mux_2to1( 
    input a, b, sel,
    output out ); 
    
    assign out = (sel == 0) ? a : b;

endmodule
