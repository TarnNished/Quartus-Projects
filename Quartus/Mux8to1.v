module Mux1(o, i, s);
    output reg o;        // Output
    input [7:0] i;       // 8-bit Input
    input [2:0] s;       // 3-bit Select

    always @(*) begin
        case(s)
            3'b000: o = i[0];
            3'b001: o = i[1];
            3'b010: o = i[2];
            3'b011: o = i[3];
            3'b100: o = i[4];
            3'b101: o = i[5];
            3'b110: o = i[6];
            3'b111: o = i[7];
            default: o = 8'b0;
        endcase
    end
endmodule
