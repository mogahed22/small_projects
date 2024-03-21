module shift_register(clk,rst,po,load,load_vlaue);

parameter SHIFT_DIRECTION = "LEFT" ;
parameter SHIFT_AMOUNT = 1;

input clk,rst,load,load_vlaue;
output reg [7:0] po;

always @(posedge clk or posedge rst) begin
    if (rst) po <= 0;
    else if (load) po <= load_vlaue;
    else if (SHIFT_DIRECTION == "LEFT") 
        po <= {po[7-SHIFT_AMOUNT:0] , {SHIFT_AMOUNT{1'b0}}};
    else if (SHIFT_DIRECTION == "RIGHT") 
        po <= { {SHIFT_AMOUNT{1'b0}} , po[7-SHIFT_AMOUNT:0] };
end
endmodule