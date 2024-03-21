module data_latch_with_active_low_clear(clr,d,g,q);
input clr,d,g;
output reg q;
always @(*) begin
    if (~clr)begin
        q<=0;
    end
    else begin
        if (g)begin
            q<=d;
        end
    end
end
endmodule