module  alu4bit_7segment_TB();
reg [3:0] a,b;
reg [1:0]oc;
reg EN;
wire [3:0] out0;
wire a0,b0,c0,d0,e0,f0,g0;
wire [3:0] out1;
wire a1,b1,c1,d1,e1,f1,g1;
alu4bit_7segment_DUT  tb (a,b,EN,oc,out0,a0,b0,c0,d0,e0,f0,g0);
alu4bit_7segment_gold TB(a,b,EN,oc,out1,a1,b1,c1,d1,e1,f1,g1);
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
if(out0 !== out1) begin
                $display("Error: out0 and out1 are not equal");
                $stop;
            end
if ({a0,b0,c0,d0,e0,f0,g0}!={a1,b1,c1,d1,e1,f1,g1})begin
                $display("Error: segments are not equal");
                $stop;    
end
end
end
initial begin
        $monitor("a[0]=%b, a[1]=%b, a[2]=%b,a[3]=%b,b[0]=%b,b[1]=%b,b[2]=%b,b[3]=%b,oc[0]=%b,oc[1]=%b,oc[2]=%b,oc[3]=%b,out1[0]=%b, out1[1]=%b,out1[2]=%b,out1[3]=%b,out2[0]=%b,out2[1]=%b,out2[2]=%b,out2[3]=%b", 
            a[0], a[1], a[2], a[3],b[0],b[1],b[2],b[3],oc[0],oc[1],oc[2],oc[3]
            , out0[0],out0[1],out0[2],out0[3],
            out1[0],out1[1],out1[2],out1[3]);
    end
endmodule