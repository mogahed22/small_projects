module alu4bit_DUT (A, B, opcode,result);
parameter N = 3; 
input [N:0]A,B;
input [N-2:0] opcode;
output  reg [N:0] result;
always @(*) begin
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
 end
endmodule