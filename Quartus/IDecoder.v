module IDecoder(
    input [31:0] instruction,
    output reg [3:0] Af,
    output reg I,
    output reg ALU_MUX_SEL,
    output reg [4:0] Cad,
    output reg GP_WE,
    output reg [1:0] GP_MUX_SEL,
    output reg [3:0] Bf,
    output reg DM_WE,
    output reg [2:0] Shift_type,
    output reg [1:0] PC_MUX_Select
);

    // Declare fields extracted from the instruction
    reg [5:0] opcode;
    reg [4:0] rs, rt, rd;
    reg [15:0] imm;
    reg [25:0] iindex;
    reg [5:0] funct;

    always @(*) begin
        // Extract fields from the instruction
        opcode = instruction[31:26];
        rs = instruction[25:21];
        rt = instruction[20:16];
        rd = instruction[15:11];
        imm = instruction[15:0];
        iindex = instruction[25:0];
        funct = instruction[5:0];

        // Default values for outputs
        Af = 4'b0000;
        I = 1'b0;
        ALU_MUX_SEL = 1'b0;
        Cad = 5'b00000;
        GP_WE = 1'b0;
        GP_MUX_SEL = 2'b00;
        Bf = 4'b0000;
        DM_WE = 1'b0;
        Shift_type = 3'b000;
        PC_MUX_Select = 2'b00;

        // Decode the instruction based on opcode and function fields
        case (opcode)
            6'b000000: begin // R-type instructions
                case (funct)
                    6'b100000: begin // ADD
                        Af = 4'b0010;
                        Cad = rd;
                        GP_WE = 1'b1;
                        GP_MUX_SEL = 2'b00;
                    end
                    6'b100001: begin // ADDU
                        Af = 4'b0010;
                        Cad = rd;
                        GP_WE = 1'b1;
                        GP_MUX_SEL = 2'b00;
                    end
                    6'b100010: begin // SUB
                        Af = 4'b0110;
                        Cad = rd;
                        GP_WE = 1'b1;
                        GP_MUX_SEL = 2'b00;
                    end
                    6'b100011: begin // SUBU
                        Af = 4'b0110;
                        Cad = rd;
                        GP_WE = 1'b1;
                        GP_MUX_SEL = 2'b00;
                    end
                    6'b100100: begin // AND
                        Af = 4'b0000;
                        Cad = rd;
                        GP_WE = 1'b1;
                        GP_MUX_SEL = 2'b00;
                    end
                    6'b100101: begin // OR
                        Af = 4'b0001;
                        Cad = rd;
                        GP_WE = 1'b1;
                        GP_MUX_SEL = 2'b00;
                    end
                    6'b100110: begin // XOR
                        Af = 4'b0011;
                        Cad = rd;
                        GP_WE = 1'b1;
                        GP_MUX_SEL = 2'b00;
                    end
                    6'b100111: begin // NOR
                        Af = 4'b0100;
                        Cad = rd;
                        GP_WE = 1'b1;
                        GP_MUX_SEL = 2'b00;
                    end
                    6'b101010: begin // SLT
                        Af = 4'b1011;
                        Cad = rd;
                        GP_WE = 1'b1;
                        GP_MUX_SEL = 2'b00;
                    end
                    default: ;
                endcase
            end

            6'b001000: begin // ADDI
                Af = 4'b0010;
                I = 1'b1;
                ALU_MUX_SEL = 1'b1;
                Cad = rt;
                GP_WE = 1'b1;
                GP_MUX_SEL = 2'b00;
            end

            6'b100011: begin // LW
                Af = 4'b0010;
                I = 1'b1;
                ALU_MUX_SEL = 1'b1;
                Cad = rt;
                GP_WE = 1'b1;
                GP_MUX_SEL = 2'b01;
                DM_WE = 1'b0;
            end

            6'b101011: begin // SW
                Af = 4'b0010;
                I = 1'b1;
                ALU_MUX_SEL = 1'b1;
                DM_WE = 1'b1;
            end

            6'b000100: begin // BEQ
                Bf = 4'b0001;
                PC_MUX_Select = 2'b10;
            end

            6'b000101: begin // BNE
                Bf = 4'b0010;
                PC_MUX_Select = 2'b10;
            end

            default: ;
        endcase
    end
endmodule
