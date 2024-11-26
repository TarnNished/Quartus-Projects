module program_counter_testbench();
    reg clk = 0;
    reg reset = 1;
    reg [31:0] PCMAX = 15;
    wire [31:0] pc;

    program_counter uut (
        .clk(clk),
        .reset(reset),
        .PCMAX(PCMAX),
        .pc(pc)
    );

    always begin
        #1 clk = !clk;
    end

    initial begin
        #40;
        reset = 0; #5;
        reset = 1; #5;
        $finish;
    end
endmodule
