module latch_tb();
parameter LAT_WIDTH_tb = 4;
reg Aset,Gate,Aclr;
reg [LAT_WIDTH_tb-1:0] Data;
wire [LAT_WIDTH_tb-1:0]Q;
latch #(LAT_WIDTH_tb) tb(.aset(Aset),.gate(Gate),.aclr(Aclr),.data(Data),.q(Q));
initial begin
    Aclr = 1;
    Aset = 1;
    Gate = 1;
    Data = 4'b0000;
    /*#5;
    Aclr = 0;
    #5;
    Aset = 0 ;*/
    repeat (2000) begin
        Aclr = $random;
        Aset = $random;
        Gate = $random;
        Data = {$random,$random,$random,$random};
        #1;
    end
end
endmodule