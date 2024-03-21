module pshift_register(
    sclr,sset,shiftin,load,data,clk,en,aclr,aset,shiftout
    );
    parameter LOAD_AVALUE = 1;
    parameter LOAD_SVALUE = 1;
    parameter SHIFT_WIDTH = 8;
    parameter SHIFT_DIRECTION = "LEFT";
    input sclr , sset , shiftin , load ,clk , en , aclr , aset;
    input [SHIFT_WIDTH-1  :0] data;
    output [SHIFT_WIDTH-1 :0] q ;
    output  shiftout;

    reg tmp_shiftout;
    reg [SHIFT_WIDTH-1:0] tmp_q;
    always @(posedge clk or posedge aclr or posedge aset) begin
        if (aclr) tmp_q <= 9'b0;
        else begin
            if (aset) tmp_q <= LOAD_AVALUE;
            else if (en) begin
                if (sclr) tmp_q <= 9'b0;
                else if (sset) tmp_q <= LOAD_SVALUE;
                else if (load) tmp_q <= data;
                else if (~load) begin
                    if (SHIFT_DIRECTION=="LEFT") {tmp_shiftout,tmp_q} <= {tmp_q,shiftin};
                    else  {tmp_q,tmp_shiftout} <= {shiftin,tmp_q};
                end
            end
        end
    end
    assign q = tmp_q;
    assign shiftout = tmp_shiftout;
endmodule