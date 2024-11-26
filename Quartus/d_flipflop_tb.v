module d_flipflop_tb();

    // Input and output declarations
    reg d, clk;
    wire o;

    // Instantiate the Unit Under Test (UUT)
    d_flipflop uut(
        .d(d),
        .clk(clk),
        .o(o)
    );

    initial begin
        d = 0;          // Initialize d
        clk = 0;        // Initialize clk
    end

    // Clock signal generation
    always begin
        #3 clk = ~clk;  // Toggle clk every 3 time units
    end

    // Toggle the input d
    always begin
        #5 d = ~d;      // Toggle d every 5 time units
    end

    initial begin
        #1000 $stop;    // Stop the simulation after 1000 time units
    end
endmodule
