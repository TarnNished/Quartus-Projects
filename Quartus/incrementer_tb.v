module incrementer_tb();
    reg clk = 0;          // Clock
    reg reset;            // Reset signal
    reg enable;           // Enable signal
    reg [29:0] in;        // 30-bit input
    wire [29:0] out;      // 30-bit output

    // Instantiate the incrementer module
    incrementer UUT (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .in(in),
        .out(out)
    );

    // Generate clock signal
    always #5 clk = ~clk; // Toggle clock every 5 time units

    // Test sequence
    initial begin
        reset = 1; enable = 0; in = 0; // Initial reset
        #10 reset = 0;                // Disable reset
        #10 enable = 1; in = 5;       // Enable increment with input = 5
        #100 enable = 0;              // Disable enable
    end
endmodule
