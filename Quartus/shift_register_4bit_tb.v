module shift_register_tb;
    reg clk;
    reg reset;
    reg [3:0] data_in;
    reg load;
    wire [3:0] data_out;

    shift_register_4bit uut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .load(load),
        .data_out(data_out)
    );

    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 1; // Apply reset
        data_in = 4'b1010;
        load = 0;

        // Wait for reset
        #20;
        reset = 0; // Release reset
        #20;

        // Load the data
        load = 1;
        #20;
        load = 0; // Begin shifting

        // Observe the shifts for a few clock cycles
        #80;

        // Reset the system to observe that behavior as well
        reset = 1;
        #20;
        reset = 0;
        #40;

        $finish; // End the simulation
    end

    always #10 clk = !clk; // Clock with a period of 20ns
endmodule
