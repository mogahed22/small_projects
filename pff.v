module pff #(parameter FF_TYPE = "DFF") ( d, rstn, clk, q, qbar);
    input d, rstn, clk;
    output reg q, qbar;
    always @(posedge clk or negedge rstn) begin
       // qbar = ~q; Error: should'n mix between "=" and "<=" in the same always block
        if (~rstn)begin
            q <= 1'b0;
            qbar <=1;
            end
        else begin
            if (FF_TYPE == "DFF")begin
                q <= d;
                qbar <= ~d;
            end 
            else if (FF_TYPE == "TFF" && d)begin
                q <= ~q;
                qbar <= ~qbar;
                end
        end
    end

endmodule
