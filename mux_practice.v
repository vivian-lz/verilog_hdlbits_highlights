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

module mux_9to1( 
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output [15:0] out );
    
    always @(*) begin
        if (sel == 0)
            out = a;
        else if (sel == 1)
            out = b;
        else if (sel == 2)
            out = c;
        else if (sel == 3)
            out = d;
        else if (sel == 4)
            out = e;
        else if (sel == 5)
            out = f;
        else if (sel == 6)
            out = g;
        else if (sel == 7)
            out = h;
        else if (sel == 8)
            out = i;
        else
            out = 16'b1111111111111111;
    end

endmodule
