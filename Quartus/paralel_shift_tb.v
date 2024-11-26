module parallel_shift_register_tb();
    reg clk = 0;
    reg L;
    reg Shift;
    reg SerI;
    reg [3:0] D = 4'b1011;
    wire [3:0] Q;

    parallel_shift_register uut(
        .clk(clk), .L(L), .Shift(Shift), .SerI(SerI), .D(D), .Q(Q)
    );

    always begin #3; clk = !clk; end

    initial begin
        D = 4'b1011; Shift = 0; L = 1; SerI = 0; #10;
        Shift = 1; L = 0; #10;
        D = 4'b0011; Shift = 0; L = 1; #10;
        Shift = 1; L = 0; SerI = 1; #10;
        SerI = 0; #10;
    end
endmodule
