module processor(
    input wire clk,
    input wire reset,
    input wire s,
    input wire [31:0] next_pc,
    input wire [31:0] data_addr_in,
    input wire [31:0] data_in,
    output reg [31:0] PC_out,
    output reg [31:0] IOut,
    output reg [31:0] MOut,
    output reg E
);

// Internal Registers
reg [31:0] PC;
reg [31:0] instruction_register;
reg [31:0] memory [0:255]; // Memory array with 256 x 32-bit words

// Initialize memory with $readmemb
initial begin
    $readmemb("memory_init.mem", memory);
end

// E Register Logic: Alternates between fetch (0) and execute (1) cycles
always @(posedge clk or posedge reset) begin
    if (reset) begin
        E <= 0;
    end else begin
        E <= ~E;
    end
end

// Program Counter Logic: Increment every two clock cycles if E is 1
always @(posedge clk or posedge reset) begin
    if (reset) begin
        PC <= 0;
    end else if (E == 1) begin
        PC <= PC + 1;
    end
end

// Fetch and Execute Cycle Logic
always @(posedge clk) begin
    if (E == 0) begin // Fetch Cycle
        instruction_register <= memory[PC];
    end else if (E == 1) begin // Execute Cycle
        if (s) begin // Store instruction
            memory[data_addr_in[31:2]] <= data_in;
        end
        MOut <= memory[data_addr_in[31:2]];
    end
end

// Output assignments
always @(posedge clk) begin
    PC_out <= PC;
    IOut <= instruction_register;
end

endmodule
