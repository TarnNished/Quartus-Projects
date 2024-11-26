module counter (clk, rstn, out);
    // Inputs
    input clk, rstn;

    // Outputs
    output reg [3:0] out;

    always @(posedge clk) begin
        if (!rstn)
            out <= 0;         // Reset the counter to 0
        else
            out <= out + 1;   // Increment the counter
    end
endmodule
