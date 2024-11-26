module tb_three_port_ram;

    reg clk;
    reg [7:0] addr_a, addr_b, addr_wr;
    reg [31:0] data_in;
    reg we;
    wire [31:0] data_a, data_b;

    // Instantiate the three_port_ram module
    three_port_ram uut (
        .clk(clk),
        .addr_a(addr_a),
        .addr_b(addr_b),
        .addr_wr(addr_wr),
        .data_in(data_in),
        .we(we),
        .data_a(data_a),
        .data_b(data_b)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock period of 10 time units
    end

    // Test sequence
    initial begin
        // Initialize inputs
        addr_a = 0;
        addr_b = 0;
        addr_wr = 0;
        data_in = 0;
        we = 0;

        // Wait for the clock to stabilize
        #10;

        // Test write operation
        addr_wr = 8'd1;
        data_in = 32'hA5A5A5A5;
        we = 1;
        #10;
        we = 0;

        // Test read operation from port A
        addr_a = 8'd1;
        #10;
        $display("Read data_a: %h (Expected: A5A5A5A5)", data_a);

        // Test read operation from port B
        addr_b = 8'd1;
        #10;
        $display("Read data_b: %h (Expected: A5A5A5A5)", data_b);

        // Test special handling of register 0
        addr_wr = 8'd0;
        data_in = 32'hFFFFFFFF;
        we = 1;
        #10;
        we = 0;

        // Read from address 0
        addr_a = 8'd0;
        addr_b = 8'd0;
        #10;
        $display("Read data_a from addr 0: %h (Expected: 0)", data_a);
        $display("Read data_b from addr 0: %h (Expected: 0)", data_b);

        // End of test
        $finish;
    end
endmodule
