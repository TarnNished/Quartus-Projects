module decoder_tb();
    reg [1:0] in;        // 2-bit input
    wire [3:0] out;      // 4-bit output

    // Instantiate the Unit Under Test (UUT)
    decoder UUT(
        .in(in),
        .out(out)
    );

    initial begin
        in = 0; #5;     // Test case for input 0
        in = 1; #5;     // Test case for input 1
        in = 2; #5;     // Test case for input 2
        in = 3; #5;     // Test case for input 3
    end
endmodule
