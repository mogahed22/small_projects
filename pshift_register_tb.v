module pshift_register_tb();

parameter LOADAVALUE = 1;
parameter LOADSVALUE = 1;
parameter SHIFTWIDTH = 8;
parameter SHIFTDIRECTION = "LEFT";

reg ACLR,ASET,SCLR,SSET,EN,CLK,LOAD,SHIFTIN;
reg [SHIFTWIDTH:0] DATA;
wire [SHIFTWIDTH:0] SHIFTOUT0,SHIFTOUT1;

pshift_register #(
    .LOAD_AVALUE(LOADAVALUE),.LOAD_SVALUE(LOADSVALUE),
    .SHIFT_WIDTH(SHIFTWIDTH),.SHIFT_DIRECTION("LEFT")
    ) tb0 (
        .aclr(ACLR),.aset(ASET),.sclr(SCLR),
        .sset(SSET),.en(EN),.clk(CLK),.load(LOAD),
        .shiftin(SHIFTIN),.data(DATA),
        .shiftout(SHIFTOUT0)
        );


    pshift_register #(
    .LOAD_AVALUE(LOADAVALUE),.LOAD_SVALUE(LOADSVALUE),
    .SHIFT_WIDTH(SHIFTWIDTH),.SHIFT_DIRECTION("RIGHT")
    ) tb1 (
        .aclr(ACLR),.aset(ASET),.sclr(SCLR),
        .sset(SSET),.en(EN),.clk(CLK),.load(LOAD),
        .shiftin(SHIFTIN),.data(DATA),
        .shiftout(SHIFTOUT1)
        );
        

initial begin
    CLK = 0;
    forever begin
        #1 CLK = ~CLK;
    end
end        

initial begin
    ACLR = 1;
    #10;
    ACLR = 0;
    DATA = 9'b010101011;
    repeat (1000) begin
        ASET = $random ;
        SCLR = $random ;
        SSET = $random ;
        EN = $random ;
        LOAD = $random ;
        SHIFTIN = $random ;
        @(negedge CLK);
    end
    $stop;
end


endmodule