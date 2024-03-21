
module t_ff_TB();
reg T,CLK,RST;
wire Q,Qbar;
t_ff DUT(T,CLK,RST,Q,Qbar);
initial begin
    CLK=0;
    forever begin
        #1 CLK=~CLK;
    end
end
initial begin
RST = 0;
T = 0;
@(negedge CLK);
RST = 1;
repeat (2000) begin
T = $random;
@(negedge CLK);
end
$stop;
end
endmodule