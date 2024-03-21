module t_ff(t,clk,rst,q,qbar);
input t,clk,rst;
output reg q,qbar;
always @(posedge clk or negedge rst) begin
    //qbar = ~q; false as it's a sequntial cuircit
    if (~rst)begin
        q<=0;
        // true soluotion
        qbar <= 1;
    end
    else begin
        if (t) begin
            q<=~q;
                    // true soluotion
            qbar <= q;
        end
    end
end
endmodule