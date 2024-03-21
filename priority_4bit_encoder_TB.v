module priority_4bit_encoder_TB();
    reg [3:0] a;
    wire [1:0] b;
    wire  [1:0] c;
    priority_4bit_encoder a_to_b(a, b);
    priority_4bit_encoder a_to_c(a, c);
    integer i;
    initial begin      
        for (i = 0; i < 10; i = i + 1) begin
            a[0] = $random;
            a[1] = $random;
            a[2] = $random;
            a[3] = $random;
            #10;
            if (b !== c) begin
                $display("Error: b and c are not equal");
                $stop;
            end
        end
    end
    initial begin
        $monitor("a[0]=%b, a[1]=%b, a[2]=%b, a[3]=%b, b[0]=%b, b[1]=%b, c[0]=%b, c[1]=%b", 
            a[0], a[1], a[2], a[3], b[0], b[1], c[0], c[1]);
    end
endmodule
