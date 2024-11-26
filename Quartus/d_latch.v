module d_latch(D, E, Q);
    input D, E;          // D is data input, E is enable signal
    output reg Q;        // Q is the output

    always @(*) begin
        if (E)           // When Enable is high
            Q <= D;      // Latch the value of D
    end
endmodule
