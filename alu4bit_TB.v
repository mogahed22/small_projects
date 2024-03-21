module  alu4bit_TB();
reg [3:0] a,b;
reg [1:0]oc;
wire [3:0] out1;
wire [3:0] out2;
alu4bit_DUT  tb (a,b,oc,out1);
alu4bit_gold  TB (a,b,oc,out2);
integer i,q;
initial begin
for(i=0;i<10;i=i+1) begin
for (q=0;q<4;q=q+1)begin
    a[q]=$random;
    b[q]=$random;
end
for(q=0;q<2;q=q+1)begin
oc[q]=$random;
end
#10
if(out1 !== out2) begin
                $display("Error: out1 and out2 are not equal");
                $stop;
            end 
end
end
initial begin
        $monitor("a[0]=%b, a[1]=%b, a[2]=%b,a[3]=%b,b[0]=%b,b[1]=%b,b[2]=%b,b[3]=%b,oc[0]=%b,oc[1]=%b,oc[2]=%b,oc[3]=%b,out1[0]=%b, out1[1]=%b,out1[2]=%b,out1[3]=%b,out2[0]=%b,out2[1]=%b,out2[2]=%b,out2[3]=%b", 
            a[0], a[1], a[2], a[3],b[0],b[1],b[2],b[3],oc[0],oc[1],oc[2],oc[3]
            , out1[0],out1[1],out1[2],out1[3],
            out2[0],out2[1],out2[2],out2[3]);
    end
endmodule