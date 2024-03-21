module  decimal_to_BCD_TB();
reg [9:0] a;
wire [3:0] out1;
wire [3:0] out2;
decimal_to_BCD_DUT TB(a,out1);
decimal_to_BCD_gold tb(a,out2);
integer i,q;
initial begin
for(i=0;i<10;i=i+1) begin
for (q=0;q<10;q=q+1)begin
    a[q]=$random;
end
#10
if(out1 !== out2) begin
                $display("Error: out1 and out2 are not equal");
                $stop;
            end 
end
end
initial begin
        $monitor("a[0]=%b, a[1]=%b, a[2]=%b,a[3]=%b,a[4]=%b, a[5]=%b,a[6]=%b,a[7]=%b,a[8]=%b,a[9]=%b,out1[0]=%b, out1[1]=%b,out1[2]=%b,out1[3]=%b,out2[0]=%b,out2[1]=%b,out2[2]=%b,out2[3]=%b", 
            a[0], a[1], a[2], a[3],a[4],a[5],a[6],a[7],a[8],a[9]
            , out1[0],out1[1],out1[2],out1[3],
            out2[0],out2[1],out2[2],out2[3]);
    end
endmodule