module dff_tb();
reg d,clk,rst;
wire q,qbar;
dff dut(d,clk,rst,q,qbar);
initial begin
    clk =0 ;
    forever begin
        #1 clk = ~clk;
    end
end
initial begin
rst =0;
d=1;
@(negedge clk);
rst = 1;
repeat (2000) begin
d = $random;
@(negedge clk);
end
$stop;
end
endmodule