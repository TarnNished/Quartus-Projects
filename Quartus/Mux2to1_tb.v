module MUX_tb();
    // Inputs
    reg [1:0] in;
    reg s;

    // Output
    wire out;

    // Unit Under Test (UUT)
    MUX UUT(
        .in(in),
        .s(s),
        .out(out)
    );

    initial begin
        in = 2'b00; // Initialize inputs
        s = 0;
    end

    // Test stimulus
    always #2 s = s + 1;   // Toggle select line every 2 time units
    always #1 in = in + 1; // Increment input every 1 time unit
    initial #20 $finish;   // End simulation after 20 time units
endmodule
