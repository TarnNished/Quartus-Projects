module register_tb;
    // Parameters
    parameter CLK_PERIOD = 10;

    // Signals
    reg clk, EN, rst, read, write;
    reg [4:0] selectW1, selectR1, selectR2;
    reg [31:0] addr;
    wire [31:0] outA, outB;

    // Instantiate the module
    register dut (
        .clk(clk),
        .EN(EN),
        .rst(rst),
        .selectW1(selectW1),
        .selectR1(selectR1),
        .selectR2(selectR2),
        .read(read),
        .write(write),
        .addr(addr),
        .outA(outA),
        .outB(outB)
    );

    // Clock generation
    always begin
        #5 clk = 0;
        #5 clk = 1;
    end

    // Test scenarios
    initial begin
        // Reset all registers
        EN = 0;
        rst = 1;
        selectW1 = 0;
        selectR1 = 0;
        selectR2 = 0;
        read = 0;
        write = 0;
        addr = 0;

        #50 rst = 0;

        // Test scenario 1: Write operation
        #10;
        EN = 1;
        selectW1 = 1; // Write to register 1
        addr = 123;   // Data to write
        write = 1;
        #10 write = 0;

        // Test scenario 2: Read operation
        #10;
        selectR1 = 1; // Read from register 1
        selectR2 = 2; // Read from register 2
        read = 1;
        #10 read = 0;

        // Test scenario 3: Write and Read operation
        #10;
        selectW1 = 3; // Write to register 3
        addr = 456;   // Data to write
        write = 1;
        #10 write = 0;
        #10;
        selectR1 = 3; // Read from register 3
        selectR2 = 1; // Read from register 1
        read = 1;
        #10 read = 0;

        // Test scenario 4: Attempt to write to register 0
        #10;
        EN = 1;
        selectW1 = 0; // Attempt to write to register 0 (should not write)
        addr = 123;
        write = 1;
        #10 write = 0;
        #10;
        selectR1 = 0; // Read from register 0 (should be 0)
        read = 1;
        #10 read = 0;

        // End test
        $stop;
    end
endmodule
