`timescale 10ns/1ns
module data_latch_with_active_low_clear_TB();
reg CLR ,D,G;
wire Q;
integer i;
data_latch_with_active_low_clear DUT(.clr(CLR),.d(D),.g(G),.q(Q));
initial begin
D=1;
CLR=0;
G=1;
for (i=0;i<100;i=i+1)begin
#1 CLR = 1;
G=$random;
D=$random;
end
end
initial begin
    $monitor("CLR=%b,G=%b,D=%b,Q=%b",CLR,G,D,Q);
end
endmodule