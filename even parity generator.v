module even_parity_generator(

	input [7:0]A,
	output [8:0]output_with_parity

	);

	wire parity;
	assign parity = ^A ;

	assign output_with_parity = {A,parity};


endmodule