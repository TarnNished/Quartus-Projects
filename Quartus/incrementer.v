module incrementer(
    input clk,           // Clock signal
    input reset,         // Reset signal
    input enable,        // Enable signal
    input [29:0] in,     // 30-bit input
    output reg [29:0] out // 30-bit output
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        out <= 30'd0;    // Reset output to 0
    end else if (enable) begin
        out <= in + 1'b1; // Increment input
    end
end

endmodule
