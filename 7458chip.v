module wires_method_7458chip ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
	wire one;
    wire two; 
    wire three;
    wire four;
    assign one = p2a & p2b;
    assign two = p2c & p2d;
    assign p2y = one | two;
    assign three = p1d & p1e & p1f;
    assign four = p1a & p1b & p1c;
    assign p1y = three | four;

endmodule

module assign_method_7458chip ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
	  assign p2y = (p2a & p2b) | (p2c & p2d);
    assign p1y = (p1e & p1f & p1d) | (p1a & p1c & p1b);

endmodule
