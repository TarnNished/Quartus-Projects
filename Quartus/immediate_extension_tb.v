module testbench;
    parameter N = 16;
    parameter M = 32;

    reg [N-1:0] immediateIN;
    reg U;
    wire [M-1:0] immediateOUT;

    immediate_extension #(N, M) uut (
        .immediateIN(immediateIN),
        .U(U),
        .immediateOUT(immediateOUT)
    );

    initial begin
        // Test case 1: Zero extension
        U = 1;
        immediateIN = 16'b0000000000001010; // 10 in decimal
        #10;
        $display("U: %b, immediateIN: %b, immediateOUT: %b", U, immediateIN, immediateOUT);

        // Test case 2: Sign extension
        U = 0;
        immediateIN = 16'b1000000000001010; // -32758 in decimal (if considered as signed)
        #10;
        $display("U: %b, immediateIN: %b, immediateOUT: %b", U, immediateIN, immediateOUT);

        // Test case 3: Zero extension with a different value
        U = 1;
        immediateIN = 16'b0001111000011111; // 3855 in decimal
        #10;
        $display("U: %b, immediateIN: %b, immediateOUT: %b", U, immediateIN, immediateOUT);

        // Test case 4: Sign extension with a different value
        U = 0;
        immediateIN = 16'b1111111000011111; // -3856 in decimal (if considered as signed)
        #10;
        $display("U: %b, immediateIN: %b, immediateOUT: %b", U, immediateIN, immediateOUT);

        $stop;
    end
endmodule
