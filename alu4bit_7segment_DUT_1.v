module alu4bit_7segment_DUT (
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
    if (en == 0) begin
        a = b = c = d = e = f = g = 0;
    end
    else begin
        case (result)
            4'b0000: begin a = b = c = d = e = f = 1; g = 0; end
            4'b0001: begin b = c = 1; a = d = e = f = g = 0; end
            4'b0010: begin a = b = d = e = g = 1; c = f = 0; end
            4'b0011: begin a = b = c = d = g = 1; e = f = 0; end
            4'b0100: begin a = b = c = f = g = 1; d = e = 0; end
            4'b0101: begin a = c = d = f = g = 1; b = e = 0; end
            4'b0110: begin a = c = d = e = f = g = 1; b = 0; end
            4'b0111: begin a = b = c = 1; d = e = f = 0; end
            4'b1000: begin a = b = c = d = e = f = 1; end
            4'b1001: begin a = b = c = d = f = g = 1; e = 0; end
            4'b1010: begin a = b = c = e = f = g = 1; d = 0; end
            4'b1011: begin c = d = e = f = g = 1; a = b = 0; end
            4'b1100: begin a = d = e = f = 1; b = c = g = 0; end
            4'b1101: begin b = c = d = e = g = 1; a = f = 0; end
            4'b1110: begin a = d = e = f = g = 1; b = c = 0; end
            4'b1111: begin a = e = f = g = 1; b = c = d = 0; end
            default: begin a = b = c = d = e = f = g = 0; end
        endcase
    end
end

endmodule
