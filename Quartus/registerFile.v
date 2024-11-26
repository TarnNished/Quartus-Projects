module register (
    input [31:0] Ip1,       // Input data
    input [3:0] sel_i1,     // Selector for write
    input [3:0] sel_o1,     // Selector for output 1
    input [3:0] sel_o2,     // Selector for output 2
    input RD, WR, rst, EN, clk, // Read, Write, Reset, Enable, Clock signals
    output [31:0] Op1,      // Output data 1
    output [31:0] Op2       // Output data 2
);
    reg [31:0] Op1, Op2;        // Registers for outputs
    reg [31:0] regFile [0:15];  // Register file with 16 registers, 32-bit each
    integer i;
    wire sen;                   // Signal enable wire

    assign sen = clk || rst;    // Combination of clock and reset

    always @(posedge sen) begin
        if (EN == 1) begin      // When Enable is active
            if (rst == 1) begin // Reset condition
                for (i = 0; i < 16; i = i + 1) begin
                    regFile[i] = 32'h0; // Initialize all registers to 0
                end
                Op1 = 32'hx;           // Undefined output
            end
            else if (rst == 0) begin  // Normal operation
                case ({RD, WR})
                    2'b00: begin
                        // No operation
                    end
                    2'b01: begin
                        // Write operation
                        regFile[sel_i1] = Ip1;
                    end
                    2'b10: begin
                        // Read operation
                        Op1 = regFile[sel_o1];
                        Op2 = regFile[sel_o2];
                    end
                    2'b11: begin
                        // Simultaneous read and write
                        Op1 = regFile[sel_o1];
                        Op2 = regFile[sel_o2];
                    end
                    default: begin
                        // Undefined behavior
                    end
                endcase
            end
        end
    end
endmodule
