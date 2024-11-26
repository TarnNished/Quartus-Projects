module full_subtractor(a, b, bi, d, bo);
    input a, b, bi;
    output d, bo;

    assign d = a ^ b ^ bi;           // a XOR b XOR bi
    assign bo = ((~a) & b) | ((~(a ^ b)) & bi); // (~a AND b) OR (~(a XOR b) AND bi)
endmodule
