module decoder(in, out);
    input [1:0] in;      // 2-bit input
    output reg [3:0] out; // 4-bit output

    always @(in) begin
        case (in)
            2'd0: out = 4'b0001; // When input is 0
            2'd1: out = 4'b0010; // When input is 1
            2'd2: out = 4'b0100; // When input is 2
            2'd3: out = 4'b1000; // When input is 3
            default: out = 4'b0000; // Default case
        endcase
    end
endmodule
