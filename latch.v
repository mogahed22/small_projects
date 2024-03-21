module latch(aset,data,gate,aclr,q);
parameter LAT_WIDTH =4;
input aset,gate,aclr;
input [LAT_WIDTH - 1 : 0 ] data ;
output reg [LAT_WIDTH - 1 : 0 ] q;
always @ (*) begin
    if (aclr) q <= 4'b0000;
    else begin
        if (aset) q <= 4'b1111;
        else if (gate) q <= data ;
    end
end
endmodule