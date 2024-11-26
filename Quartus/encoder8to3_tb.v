module encoder_tb();
    // Inputs
    reg [7:0] in;

    // Outputs
    wire [2:0] out;

    // Unit Under Test (UUT)
    encoder UUT(
        .in(in),
        .out(out)
    );

    // Test sequence
    initial begin
        // Initialize input
        in = 8'b00000000; #10; // No active bit
        
        // Add stimulus here
        in = 8'b00000001; #10; // Test case for bit 0
        in = 8'b00000010; #10; // Test case for bit 1
        in = 8'b00000100; #10; // Test case for bit 2
        in = 8'b00001000; #10; // Test case for bit 3
        in = 8'b00010000; #10; // Test case for bit 4
        in = 8'b00100000; #10; // Test case for bit 5
        in = 8'b01000000; #10; // Test case for bit 6
        in = 8'b10000000; #10; // Test case for bit 7

        // Finish simulation
        $finish;
    end
endmodule
