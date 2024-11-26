module clock_tb();
    parameter odd = 5;
    parameter CLOCK_PERIOD = 10;

    reg tb_clk;
    reg tb_reset;
    wire tb_divided_clk;

    // Unit Under Test (UUT)
    clock uut (
        .clk(tb_clk),
        .reset(tb_reset),
        .divided_clk(tb_divided_clk)
    );

    // Clock generation
    always #(CLOCK_PERIOD/2) tb_clk = ~tb_clk;

    initial begin
        // Initialize Inputs
        tb_clk = 0;
        tb_reset = 1;

        #(CLOCK_PERIOD*2);
        tb_reset = 0;

        #(CLOCK_PERIOD * odd * 10);
        $finish;
    end
endmodule
