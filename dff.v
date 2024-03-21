module dff(d,clk,rst,q,qbar);
input d,clk,rst;
output reg q,qbar;
always @(posedge clk or negedge rst) begin
    if (~rst)begin
            q<=0;
            qbar <= 1;
        end
    else begin
        q <= d;
        qbar <= ~d;
    end
//qbar <= ~q;
end
endmodule