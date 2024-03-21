module sle_tb();
reg D,CLK,EN,ALN,ADN,SLN,SD,LAT;
wire Q;
sle tb(D,CLK,EN,ALN,ADN,SLN,SD,LAT,Q);
initial begin
   CLK = 0;
   forever begin
    #1 CLK = ~CLK;
   end 
end
initial begin
    ALN = 0;
    ADN = 0;
    LAT = 0;
    EN = 0;
    SLN = 0;
    SD = 0;
    D =0;
    @(negedge CLK);
    ALN=1;
    repeat (200) begin
        EN = $random ;
        SLN = $random;
        SD = $random;
        D = $random;
        @(negedge CLK);
    end
    LAT = 1;
    repeat (200) begin
        EN = $random ;
        SLN = $random;
        SD = $random;
        D = $random;
        @(negedge CLK);
    end
    $stop;
end
endmodule