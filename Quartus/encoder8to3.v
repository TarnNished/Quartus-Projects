module encoder(in, out);
    input [7:0] in;       // 8-bit input
    output reg [2:0] out; // 3-bit output

    always @(*) begin
        if (in[7]) out = 3'b111;  // If bit 7 is active
        else if (in[6]) out = 3'b110; // If bit 6 is active
        else if (in[5]) out = 3'b101; // If bit 5 is active
        else if (in[4]) out = 3'b100; // If bit 4 is active
        else if (in[3]) out = 3'b011; // If bit 3 is active
        else if (in[2]) out = 3'b010; // If bit 2 is active
        else if (in[1]) out = 3'b001; // If bit 1 is active
        else if (in[0]) out = 3'b000; // If bit 0 is active
    end
endmodule
