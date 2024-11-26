module immediate_extension #(parameter N = 16, M = 32) (
    input [N-1:0] immediateIN,
    input U,
    output [M-1:0] immediateOUT
);
    assign immediateOUT = U ? {{(M-N){1'b0}}, immediateIN} : {{(M-N){immediateIN[N-1]}}, immediateIN};
endmodule
