module BCE (
    input [31:0] a,  // 32-bit input a
    input [31:0] b,  // 32-bit input b
    input [3:0] bf,  // 4-bit input bf
    output reg bcres // 1-bit output bcres
);

always @(*) begin
    case (bf)
        4'b0010: bcres = (a < 0);   // [a] < 0
        4'b0011: bcres = (a >= 0);  // [a] >= 0
        4'b1000: bcres = (a == b);  // a == b
        4'b1001: bcres = (a != b);  // a != b
        4'b1010: bcres = (a <= 0);  // [a] <= 0
        4'b1011: bcres = (a > 0);   // [a] > 0
        default: bcres = 1'b0;      // default case to avoid latches
    endcase
end

endmodule
