module d_flipflop(input d, clk, output reg o);
    always @(posedge clk) begin
        o <= d; // On the rising edge of clk, assign d to o
    end
endmodule
