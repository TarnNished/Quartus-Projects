module half_subtractor(a, b, d, bo);
    input a, b;
    output d, bo;
    assign d = a ^ b;     // a XOR b
    assign bo = (~a) & b; // ~a AND b
endmodule
