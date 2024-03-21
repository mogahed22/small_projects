module alu4bit_7segment_gold (A, B,en, opcode,result,a,b,c,d,e,f,g);
 parameter N = 4; 
 input [N-1:0]A,B;
 input en;
input [N-3:0] opcode;
output   [N-1:0] result;
output  a,b,c,d,e,f,g;
assign result = (opcode == 2'b00) ? A+B:
(opcode == 2'b10) ? A - B:
(opcode == 2'b01) ? A| B:
 A ^ B ;
 assign {a, b, c, d, e, f, g} = (result==4'b0000)?7'b100_0000:
 (result==4'b0001)?7'b111_1001:
 (result==4'b0010)?7'b010_0100:
 (result==4'b0011)?7'b011_0000:
 (result==4'b0100)?7'b001_1001:
 (result==4'b0101)?7'b001_0010:
 (result==4'b0110)?7'b000_0010:
 (result==4'b0111)?7'b111_1000:
 (result==4'b1000)?7'b000_0000:
 (result==4'b1001)?7'b001_0000:
 (result==4'b1010)?7'b000_1000:
 (result==4'b1011)?7'b000_0111:
 (result==4'b1100)?7'b100_0010:
 (result==4'b1101)?7'b010_0001:
 (result==4'b1110)?7'b100_0010:
 (result==4'b1110)?7'b000_0000:
7'b000_0000;
endmodule