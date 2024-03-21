module adder(a,b,clk,cin,rst,sum,cout);

parameter WIDTH = 4 ;
parameter PIPELINE_ENABLE = 1;
parameter USE_FULL_ADDER = 1;

input [WIDTH-1:0] a,b;
input clk,rst,cin;

output reg [WIDTH-1:0] sum;
output reg cout;

wire [WIDTH-1:0]com_sum_ha,com_sum_fa;
wire com_cout_fa ,com_cout_ha;

reg seq_cout_fa ,seq_cout_ha;
reg [WIDTH-1:0] seq_sum_ha , seq_sum_fa;

//combinatial
assign {com_sum_ha,com_cout_ha} = a+b;
assign {com_sum_fa,com_cout_fa} = a+b+cin;

//seq
always @(posedge clk) begin
    if (rst) begin

        seq_cout_ha <=0;
        seq_cout_fa <= 0;
        seq_sum_ha <=0;
        seq_sum_fa <=0;

    end 

    else begin

        {seq_sum_ha,seq_cout_ha} <= a+b;
        {seq_sum_fa,seq_cout_fa} <= a+b+cin;
    end
end

//chosing
always @(*) begin

    if (PIPELINE_ENABLE == 1) begin
        if(USE_FULL_ADDER == 1) begin
            sum = seq_sum_fa;
            cout = seq_cout_fa;
        end
        else begin
            sum = seq_sum_ha;
            cout = seq_cout_ha;
        end
    end

    else begin
        if (USE_FULL_ADDER == 1) begin
            sum = com_sum_fa;
            cout = com_cout_fa;
        end
        else begin
            sum = com_sum_ha;
            cout = com_cout_ha;
        end
    end
end
endmodule