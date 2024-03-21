module pff_tb();
reg d,rstn,clk;
wire q,qbar,Q,Qbar;
pff #("DFF") dut(d,rstn,clk,q,qbar);
dff gold(d,clk,rstn,Q,Qbar);
initial begin
    clk = 0;
    forever begin
        #1 clk = ~clk;
    end
end
initial begin
rstn =0;
d=1;
@(negedge clk);
rstn = 1;
repeat (2000) begin
d = $random;
@(negedge clk);
end
$stop;
end
initial begin
    if(q != Q) begin
        $display("Error");
    end
end
endmodule