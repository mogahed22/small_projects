module DSP_tb();
    reg [17:0]a,b,d;
    reg [47:0]c;
    reg clk,rst_n;
    wire [47:0]p;

    DSP tb(a,b,c,d,clk,rst_n,p);

    initial begin
        clk=0;
        forever begin
            #1 clk= ~clk;
        end
    end

    initial begin
        a=50;
        b=20;
        c=135;
        d=75;
        rst_n = 0;
        repeat (20) begin
            @(negedge clk);
            if (p != 0 ) begin
                $display("error");
                $stop;
            end
        end
        rst_n=1;
        repeat(800) @(negedge clk);
        $stop;
    end
endmodule