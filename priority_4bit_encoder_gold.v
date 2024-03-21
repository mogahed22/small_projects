module priority_4bit_encoder (x, y);
input [3:0] x;
output reg [1:0] y;
always @(*) begin
    if (x == 4'b000x)
        y=2'b00;
    else if (x== 4'b001x)
        y=2'b01;
    else if (x == 4'b01xx)
        y=2'b10;
    else
        y=2'b11;            
end
endmodule