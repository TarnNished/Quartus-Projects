module InstructionDecoder(
    input wire [31:0] instruction,
    output reg [3:0] alu_control,
    output reg alu_src,
    output reg [1:0] pc_mux_sel,
    output reg [1:0] gp_mux_sel,
    output reg branch,
    output reg jump,
    output reg mem_to_reg,
    output reg reg_dst,
    output reg gp_we
);

    always @(*) begin
        // Decode instruction here
        alu_control = 4'b0000;  // Default ALU control
        alu_src = 0;           // Default ALU source
        pc_mux_sel = 2'b00;    // Default PC mux selection
        gp_mux_sel = 2'b00;    // Default GP mux selection
        branch = 0;            // No branch by default
        jump = 0;              // No jump by default
        mem_to_reg = 0;        // Default: no memory to register
        reg_dst = 0;           // Default: no specific register destination
        gp_we = 0;             // Default: no general-purpose write enable
    end

endmodule
