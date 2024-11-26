module Mux1_tb();
    // Inputs
    reg [7:0] i;
    reg [2:0] s;

    // Output
    wire o;

    // Unit Under Test (UUT)
    Mux1 UUT(
        .o(o),
        .i(i),
        .s(s)
    );

    initial begin
        // Initializing inputs
        i = 8'b10110110;
        #5 s = 3'b000;
        #5 s = 3'b001;
        #5 s = 3'b010;
        #5 s = 3'b011;
        #5 s = 3'b100;
        #5 s = 3'b101;
        #5 s = 3'b110;
        #5 s = 3'b111;
    end
endmodule
