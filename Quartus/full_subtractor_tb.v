module full_subtractor_tb();
    // Inputs
    reg a;
    reg b;
    reg bi;

    // Outputs
    wire d;
    wire bo;

    // Unit Under Test (UUT)
    full_subtractor UUT(
        .a(a),
        .b(b),
        .bi(bi),
        .d(d),
        .bo(bo)
    );

    initial begin
        {a, b, bi} = 3'b000;
        #5 {a, b, bi} = 3'b001;
        #5 {a, b, bi} = 3'b010;
        #5 {a, b, bi} = 3'b011;
        #5 {a, b, bi} = 3'b100;
        #5 {a, b, bi} = 3'b101;
        #5 {a, b, bi} = 3'b110;
        #5 {a, b, bi} = 3'b111;
    end
endmodule
