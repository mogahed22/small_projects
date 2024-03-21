/*module comparetor(A,B,C1,C2,C3);

input [3:0]A, [3:0]B;
output C1,C2,C3;

assign C1 = (A>B) ? 1 : 0 ;
assign C2 = (A<B) ? 1 : 0 ;
assign C3 = (A==B) ? 1 : 0 ;

endmodule*/

module comparetor(
    input [3:0] A, 
    input [3:0] B, 
    output C1, C2, C3
);

    assign C1 = (A > B) ? 1 : 0;
    assign C2 = (A < B) ? 1 : 0;
    assign C3 = (A == B) ? 1 : 0;

endmodule
