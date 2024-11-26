module tb_processor;

// Testbench signals
reg clk;
reg reset;
reg S;
reg [31:0] next_pc;
reg [31:0] data_addr_in;
reg [31:0] data_in;
wire [31:0] PC_out;
wire [31:0] Iout;
wire [31:0] Mout;
wire E;

// Instantiate the processor module
processor uut (
    .clk(clk),
    .reset(reset),
    .S(S),
    .next_pc(next_pc),
    .data_addr_in(data_addr_in),
    .data_in(data_in),
    .PC_out(PC_out),
    .Iout(Iout),
    .Mout(Mout),
    .E(E)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Test sequence
initial begin
    // Initialize inputs
    reset = 1;
    S = 0;
    next_pc = 0;
    data_addr_in = 0;
    data_in = 0;

    // Apply reset
    #10 reset = 0;

    #10;
    #10;

    // Store data to memory
    S = 1;
    data_addr_in = 32'h00000004;
    data_in = 32'hAABBCCDD;
    #10;

    // Disable store instruction
    S = 0;
    #10;

    #20;
    $stop;
end

endmodule
