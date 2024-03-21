module alu4bit_7segment_gold (
    input [3:0] A, B,
    input en,
    input [1:0] opcode,
    output reg [3:0] result,
    output reg a, b, c, d, e, f, g
);

always @(*) begin
    case (opcode)
        2'b00: result = A + B;
        2'b10: result = A - B;
        2'b01: result = A | B;
        default: result = A ^ B;
    endcase
end

always @(*) begin
    case (result)
        4'b0000: {a, b, c, d, e, f, g} = 7'b100_0000;
        4'b0001: {a, b, c, d, e, f, g} = 7'b111_1001;
        4'b0010: {a, b, c, d, e, f, g} = 7'b010_0100;
        4'b0011: {a, b, c, d, e, f, g} = 7'b011_0000;
        4'b0100: {a, b, c, d, e, f, g} = 7'b001_1001;
        4'b0101: {a, b, c, d, e, f, g} = 7'b001_0010;
        4'b0110: {a, b, c, d, e, f, g} = 7'b000_0010;
        4'b0111: {a, b, c, d, e, f, g} = 7'b111_1000;
        4'b1000: {a, b, c, d, e, f, g} = 7'b000_0000;
        4'b1001: {a, b, c, d, e, f, g} = 7'b001_0000;
        4'b1010: {a, b, c, d, e, f, g} = 7'b000_1000;
        4'b1011: {a, b, c, d, e, f, g} = 7'b000_0111;
        4'b1100: {a, b, c, d, e, f, g} = 7'b100_0010;
        4'b1101: {a, b, c, d, e, f, g} = 7'b010_0001;
        4'b1110: {a, b, c, d, e, f, g} = 7'b100_0010;
        4'b1111: {a, b, c, d, e, f, g} = 7'b100_0110;
        default: {a, b, c, d, e, f, g} = 7'b000_0000;
    endcase
end

endmodule
