module alu4bit_gold (A, B, opcode,result);
 parameter N = 3; 
 input [N:0]A,B;
input [N-2:0] opcode;
output  [N:0] result;
assign result = (opcode == 2'b00) ? A+B:
(opcode == 2'b10) ? A - B:
(opcode == 2'b01) ? A| B:
 A ^ B ;
/* always @(*) begin
 	if (opcode == 2'b00) begin
 			result = A+B;
 	end
 	else if (opcode == 2'b10) begin
 		result = A - B;
 	end
 	else if(opcode == 2'b01) begin
 		result = A| B;
 	end
 	else begin
 		result = A ^ B ;
 	end
 end*/

endmodule