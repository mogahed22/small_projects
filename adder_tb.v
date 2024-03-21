module adder_tb();

parameter WIDTH = 4 ;
parameter PIPELINE_ENABLE = 1;
parameter USE_FULL_ADDER = 1;

reg [WIDTH-1:0]a,b;
reg cin,rst,clk;

wire [WIDTH-1:0] sum;
wire cout;

adder #(.WIDTH(WIDTH),.PIPELINE_ENABLE(PIPELINE_ENABLE),.USE_FULL_ADDER(USE_FULL_ADDER)) tb(.a(a),.b(b),.cin(cin),.clk(clk),.rst(rst),.sum(sum),.cout(cout));


initial begin
    clk = 0;
    forever begin
        #1 clk = ~clk;
    end
end


initial begin

a=4'b1001;
b=4'b1010;
cin=1'b1;
rst = 1;
#10
rst = 0;
#10;
$stop;
end

endmodule