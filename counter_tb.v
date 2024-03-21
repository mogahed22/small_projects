module counter_tb();
reg clk1,Set,rstn;
wire [3:0] Out0 ,Out1 ;
Counterdut Dut(clk1,Set,Out0);
ripple_counter gold(clk1,rstn,Out1);
initial begin
    clk1 = 0;
    forever begin
        #1 clk1 = ~clk1;
    end
end
initial begin
    Set=0;
    rstn=0;
    #5;
    repeat (200)begin
        Set =1;
        rstn = 1;
        @(negedge clk1);
    end
    $stop;
end
initial begin
    if (Out0 !== Out1) begin
        $display (" Error! ");
    end
end
endmodule