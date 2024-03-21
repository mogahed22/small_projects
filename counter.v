module Counterdut(clk0,set,out0);
input clk0,set;
output reg [3:0] out0;
always @(posedge clk0 or negedge set) begin
    if (!set) out0 = 4'b1111;
    else if (out0 == 4'b1111) begin
         out0 <= 4'b0000;
    end
    else begin
        out0 <= out0 + 1;
    end    
end
endmodule