module tb1();
parameter SHIFT_DIRECTION = "RIGHT";
parameter SHIFT_AMOUNT = 2;
reg clk , rst,load , load_vlaue;
wire [7:0] po;
shift_register #(.SHIFT_DIRECTION(SHIFT_DIRECTION),.SHIFT_AMOUNT(SHIFT_AMOUNT)) tb_1 (.clk(clk),.rst(rst),.load(load),
.load_vlaue(load_vlaue),.po(po));
initial begin
    clk = 0;
    forever begin
        #1 clk = ~clk;
    end
end
initial begin
rst = 1 ;
load = 1;
load_vlaue = $random;
#10;
rst = 0;
load = 1;
load_vlaue = $random;
#10;
rst=0;
load = 0;
load_vlaue = $random;
#10;
$stop;
end
endmodule