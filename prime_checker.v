module prime_checker(
    input [2:0] A,
    output is_prime
);


assign is_prime = 
    (A == 3'b001) ||  
    (A == 3'b011) ||  
    (A == 3'b101) ||  
    (A == 3'b111);    

endmodule
