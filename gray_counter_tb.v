module gray_counter_tb();
reg clk,rst;
wire [1:0]gray_out;
gray_counter tb(.clk(clk),.rst(rst),.gray_out(gray_out));

initial begin
    clk=0;
    forever begin
        #1 clk=~clk;
    end
end

initial begin
    rst = 1;
    repeat (20) begin
        @(negedge clk);
        if (gray_out !=0) begin
            $display("error");
            $stop;
        end
    end
    rst =0;
    repeat(1000) begin
        @(negedge clk);
    end
$stop;
end
endmodule