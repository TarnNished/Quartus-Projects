module par_reg(input clock, input reset, input [9:0] WIDTH, output reg [511:0] op);

    reg [511:0] data = 10;

    always @(posedge clock) begin
        if (!reset)
            data <= 0;
        else
            op <= data & ((512'b1 << WIDTH) - 1);
    end

endmodule
