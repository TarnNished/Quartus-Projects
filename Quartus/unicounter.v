module counter(clk, reset, set, load, data, q);
    input clk;
    input reset;
    input set;
    input load;
    input [2:0] data;
    output reg [2:0] q;

    always @(posedge clk) begin
        if (reset) begin
            q <= 3'b000;       // Reset counter to 0
        end else if (set) begin
            q <= 3'b111;       // Set counter to all 1s
        end else if (load) begin
            q <= data;         // Load counter with input data
        end else begin
            q <= q + 1'b1;     // Increment counter
        end
    end
endmodule
