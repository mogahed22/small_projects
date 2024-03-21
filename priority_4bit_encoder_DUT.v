module priority_4bit_encoder (x, y);
input [3:0] x;
output reg [1:0] y;
//assign y = 2'bxx;
always @(*) begin
    casex (x)
        4'b000x: y = 2'b00 ;
        4'b001x: y = 2'b01 ;
        4'b01xx: y = 2'b10 ;
        4'b1xxx: y = 2'b11 ;
        default: y = 2'bxx;
    endcase
end
endmodule

