module par_regtestbench();

    reg clock = 0;
    reg reset = 1;
    reg [9:0] WIDTH = 10'b0000000100;
    wire [511:0] op;

    par_reg uut(
        .clock(clock),
        .reset(reset),
        .WIDTH(WIDTH),
        .op(op)
    );

    always begin
        #1 clock = !clock;
    end

    initial begin
        #40;
        WIDTH = 4'b0011; #10;
        reset = 0; #10;
        $finish;
    end

endmodule
