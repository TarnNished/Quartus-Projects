module decoder1(in, out);
    input [1:0] in;       // 2-bit input
    output reg [3:0] out; // 4-bit output

    always @(in) begin
        out = 4'b0000; // Set all outputs to 0 initially
        if (in == 2'b00)
            out[0] = 1'b1; // When input is 00, set Y0 to 1
        else if (in == 2'b01)
            out[1] = 1'b1; // When input is 01, set Y1 to 1
        else if (in == 2'b10)
            out[2] = 1'b1; // When input is 10, set Y2 to 1
        else if (in == 2'b11)
            out[3] = 1'b1; // When input is 11, set Y3 to 1
    end
endmodule
