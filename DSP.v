module DSP (a,b,c,d,clk,rst_n,p);
    parameter OPERATION = "ADD" ;
    input [17:0]a,b,d;
    input [47:0]c;
    input clk,rst_n;
    output reg [47:0]p;
    reg [17:0] a0,a1,b0,d0,adder1out;
    reg [47:0] c0,multiout;
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            p<=0;
            a0<=0;
            a1<=0;
            b0<=0;
            d0<=0;
            c0<=0;
            adder1out<=0;
            multiout<=0;
        end

        else begin
            a0<=a;
            a1<=a0;
            b0<=b;
            c0<=c;
            d0<=d;
            multiout <= adder1out*a1;
            if (OPERATION == "ADD")begin
                adder1out<= b0+d0;
                p<= c0+multiout;
            end
            else if(OPERATION =="SUBTRACT") begin
                adder1out <= d0-b0;
                p <= multiout - c0;
            end
        end
    end
endmodule