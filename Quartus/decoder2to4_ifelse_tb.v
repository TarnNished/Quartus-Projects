module decoder1_tb();
    // Inputs
    reg [1:0] in;

    // Outputs
    wire [3:0] out;

    // Unit Under Test (UUT)
    decoder1 UUT(
        .in(in),
        .out(out)
    );

    initial begin
        // Initialize inputs
        in = 2'b00;
        #10;

        in = 2'b00; #20; // Test case for input 00
        in = 2'b01; #20; // Test case for input 01
        in = 2'b10; #20; // Test case for input 10
        in = 2'b11; #20; // Test case for input 11

        // Finish the simulation
        #10;
        $finish;
    end
endmodule
