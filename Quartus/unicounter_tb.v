module counter_tb();
    // Inputs
    reg clk;
    reg reset;
    reg set;
    reg load;
    reg [2:0] data;

    // Outputs
    wire [2:0] q;

    // Unit Under Test (UUT)
    counter uut(
        .clk(clk),
        .reset(reset),
        .set(set),
        .load(load),
        .data(data),
        .q(q)
    );

    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 0;
        set = 0;
        load = 0;
        data = 0;

        #100;
        reset = 1; #20; reset = 0;  // Apply reset
        set = 1; #20; set = 0;      // Set counter to all 1s
        load = 1; data = 3'b101; #20; load = 0; // Load specific value into counter
    end

    // Clock generation
    always #10 clk = ~clk;
endmodule
