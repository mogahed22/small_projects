module d_flip_flop (
    input D, // Data input
    input EN, // Enable input
    input CLK, // Clock input
    output reg Q // Output
);

// Clock edge sensitive
always @(posedge CLK) begin
    if (EN) begin // Only update Q when the enable signal is high
        Q <= D;
    end
end

endmodule
