module ripple_counter(CLK,RSTN,out);
input CLK,RSTN;
output [3:0]out;
wire q1,q2,q3,q4;
wire qn1,qn2,qn3,qn4;
dff ff1(.clk(CLK),.rst(RSTN),.q(q1),.qbar(qn1),.d(qn1));
dff ff2(.clk(q1),.rst(RSTN),.q(q2),.qbar(qn2),.d(qn2));
dff ff3(.clk(q2),.rst(RSTN),.q(q3),.qbar(qn3),.d(qn3));
dff ff4(.clk(q3),.rst(RSTN),.q(q4),.qbar(qn4),.d(qn4));
assign out = {qn4,qn3,qn2,qn1};
endmodule