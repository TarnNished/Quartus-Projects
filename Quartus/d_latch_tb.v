module tb();
    reg e;               // Enable signal
    reg d;               // Data input
    wire q;              // Output

    // Instantiate the Unit Under Test (UUT)
    d_latch uut (
        .E(e),
        .D(d),
        .Q(q)
    );

    initial begin
        e = 0; d = 0;    // Initialize signals
    end

    // Generate test waveforms
    always #3 e = ~e;    // Toggle enable every 3 time units
    always #5 d = ~d;    // Toggle data every 5 time units

    initial #1000 $stop; // Stop simulation after 1000 time units
endmodule
