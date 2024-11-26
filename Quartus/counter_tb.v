module counter_tb();
    // Inputs
    reg clk;
    reg rstn;

    // Outputs
    wire [3:0] out;

    // Unit Under Test (UUT)
    counter UUT(
        .clk(clk),
        .rstn(rstn),
        .out(out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk <= 0;
        rstn <= 0;

        #5 rstn <= 1;   // Release reset
        #15 rstn <= 0;  // Assert reset
        #10 rstn <= 1;  // Release reset again
    end
endmodule
