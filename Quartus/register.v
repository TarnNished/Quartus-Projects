module register (
    input clk,                // Clock signal
    input EN,                 // Enable write/read
    input rst,                // Reset signal
    input [4:0] selectW1,     // Select register for write
    input [4:0] selectR1,     // Select register for read A
    input [4:0] selectR2,     // Select register for read B
    input read,               // Enable read
    input write,              // Enable write
    input [31:0] addr,        // Data to write
    output reg [31:0] outA,   // Data read from register A
    output reg [31:0] outB    // Data read from register B
);

    reg [31:0] regfile [31:0]; // 32 registers of 32 bits each
    integer i;

    always @ (posedge clk or posedge rst) begin
        if (rst == 1) begin
            for (i = 0; i < 32; i = i + 1) begin
                regfile[i] = 32'b0;  // Reset all registers
            end
        end else if (EN == 1) begin
            case ({read, write})
                2'b01: begin          // Write operation
                    if (selectW1 != 0)
                        regfile[selectW1] = addr;
                end
                2'b10: begin          // Read operation
                    outA = regfile[selectR1];
                    outB = regfile[selectR2];
                end
                2'b11: begin          // Simultaneous read and write
                    if (selectW1 != 0)
                        regfile[selectW1] = addr;
                    outA = regfile[selectR1];
                    outB = regfile[selectR2];
                end
            endcase
        end
    end
endmodule
