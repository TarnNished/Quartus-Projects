module MUX(out, in, s);
    output reg out;       // Output
    input [1:0] in;       // 2-bit Input
    input s;              // Select Line

    always @(*) begin
        if (s == 1'b0)    // If select is 0
            out = in[0];  // Output is in[0]
        else              // If select is 1
            out = in[1];  // Output is in[1]
    end
endmodule
