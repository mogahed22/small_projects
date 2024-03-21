module ripple_counter_tb();
reg clk , rst;
wire [3:0]out;
ripple_counter dut(clk,rst,out);
initial begin
    clk =0;
    forever begin
        #1 clk=~clk;
    end
end
initial begin
    rst = 0;
    #5; 
    repeat(2000)begin 
    #1 rst =1;
    end
    $stop;
end
endmodule