module alu_1bit(
    input a, b, Ainvert, Binvert, carryin, operation,
    output result, carryout
);

wire w1 = (Ainvert == 1'b0) ? a : ~a;
wire w2 = (Binvert == 1'b0) ? b : ~b;

 assign result = (operation == 3'b000) ? (w1 & w2 ):
(operation == 3'b001) ? ( w1 | w2): 
( w1 + w2 + carryin);
        
assign carryout = (operation == 3'b010) ? (w1 + w2 + carryin > 1'b1) : 1'b0;

endmodule
