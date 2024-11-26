module BCE_tb;

// Inputs
reg [31:0] a;
reg [31:0] b;
reg [3:0] bf;

// Outputs
wire bcres;

// Instantiate the BCE module
BCE uut (
    .a(a),
    .b(b),
    .bf(bf),
    .bcres(bcres)
);

initial begin
    // Test case 1: [a] < 0
    a = -5; b = 0; bf = 4'b0010; #10;
    // Check result
    $display("Test case [a] < 0: bcres = %b (expected 1)", bcres);

    // Test case 2: [a] >= 0
    a = 5; b = 0; bf = 4'b0011; #10;
    // Check result
    $display("Test case [a] >= 0: bcres = %b (expected 1)", bcres);

    // Test case 3: a == b
    a = 5; b = 5; bf = 4'b1000; #10;
    // Check result
    $display("Test case a == b: bcres = %b (expected 1)", bcres);

    // Test case 4: a != b
    a = 5; b = 3; bf = 4'b1001; #10;
    // Check result
    $display("Test case a != b: bcres = %b (expected 1)", bcres);

    // Test case 5: [a] <= 0
    a = -5; b = 0; bf = 4'b1010; #10;
    // Check result
    $display("Test case [a] <= 0: bcres = %b (expected 1)", bcres);

    // Test case 6: [a] > 0
    a = 5; b = 0; bf = 4'b1011; #10;
    // Check result
    $display("Test case [a] > 0: bcres = %b (expected 1)", bcres);
end

endmodule
