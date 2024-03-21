module four_bit_adder(
	[3:0]a,
	[3:0]b,
	[3:0]c
);
//assign c[0]= a[0] + b[0];
//assign c[1]= a[1] + b[1]+c[0];
//assign c[2]= a[2] + b[2]+c[1];
assign c= a + b;

endmodule