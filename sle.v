module sle(d,clk,en,aln,adn,sln,sd,lat,q);
input d,clk,en,aln,adn,sln,sd,lat;
output reg q;
//always @(*) for ==> latch
//always @(posedge clk ) ==> for flip-flop
always @(posedge clk or negedge aln) begin
    if (~aln) q<=~adn;
    else begin
        if (~lat) begin
            if (en && ~sln) q <= sd;
            else if (en && sln) q <= d;
        end
        else begin
            if (clk) begin
                if (en && ~sln) q <= sd;
                else if (en && sln) q <= d;
            end
        end
    end 
end
endmodule