module half_adder_tb;

// Testbench variables
reg a, b;
wire s, c;

// Instantiate the half-adder
half_adder uut (s, c, a, b);

// Apply test cases
initial begin
    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;
    $stop;
end

endmodule
