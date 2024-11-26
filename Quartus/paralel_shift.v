module parallel_shift_register(input clk, input L, input Shift, input SerI, input [3:0] D, output reg [3:0] Q);
    always @(posedge clk) begin
        case ({Shift, L})
            2'b00: Q <= Q; // Retain current value
            2'b01: Q <= D; // Load parallel data
            default: Q <= {SerI, Q[3:1]}; // Shift right with Serial Input
        endcase
    end
endmodule
