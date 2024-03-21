module LFSR_tb();

reg clk ,set , rst;
wire [3:0]out;

LFSR tb(.clk(clk),.set(set),.rst(rst),.out(out));

initial begin
    clk = 0;
    forever begin
        #1 clk = ~clk;
    end
end

initial begin

    repeat (100) begin

        rst = $random ;
        set = $random;
        @(negedge clk);

    end
$stop;
end






endmodule