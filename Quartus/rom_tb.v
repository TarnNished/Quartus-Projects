module ROM_tb();
    // Inputs
    reg [2:0] address;

    // Outputs
    wire [7:0] data;

    // Unit Under Test (UUT)
    ROM uut(
        .address(address),
        .data(data)
    );

    initial begin
        // Initialize Inputs
        address = 0;
        #100;

        // Add stimulus here
        address = 3'b000; #10;
        address = 3'b001; #10;
        address = 3'b010; #10;
        address = 3'b011; #10;
        address = 3'b100; #10;
        address = 3'b101; #10;
        address = 3'b110; #10;
        address = 3'b111; #10;
    end
endmodule
