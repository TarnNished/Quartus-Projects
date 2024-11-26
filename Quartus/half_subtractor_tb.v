module half_subtractor_tb;
    // Inputs
    reg a;
    reg b;
    // Outputs
    wire d;
    wire bo;

    // Unit Under Test (UUT)
    half_subtractor UUT (
        .a(a),
        .b(b),
        .d(d),
        .bo(bo)
    );

    initial begin
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
    end
endmodule
