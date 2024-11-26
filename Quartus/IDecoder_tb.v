module IDecoder_tb;
    reg [31:0] instruction;
    wire [3:0] Af;
    wire I;
    wire ALU_MUX_SEL;
    wire [4:0] Cad;
    wire GP_WE;
    wire [1:0] GP_MUX_SEL;
    wire [3:0] Bf;
    wire DM_WE;
    wire [2:0] Shift_type;
    wire [1:0] PC_MUX_Select;

    IDecoder uut (
        .instruction(instruction),
        .Af(Af),
        .I(I),
        .ALU_MUX_SEL(ALU_MUX_SEL),
        .Cad(Cad),
        .GP_WE(GP_WE),
        .GP_MUX_SEL(GP_MUX_SEL),
        .Bf(Bf),
        .DM_WE(DM_WE),
        .Shift_type(Shift_type),
        .PC_MUX_Select(PC_MUX_Select)
    );

    initial begin
        // Test I-type instructions
        instruction = 32'b10001100000000010000000000000000; // LW
        #10;
        instruction = 32'b00100000001000100000000000000001; // ADDI
        #10;
        instruction = 32'b00100100001000100000000000000001; // ADDIU
        #10;
        instruction = 32'b00101100001000100000000000000001; // SLTIU
        #10;
        instruction = 32'b00110100001000100000000000000001; // ORI
        #10;
        instruction = 32'b00111000001000100000000000000001; // XORI
        #10;
        instruction = 32'b00111100001000100000000000000001; // LUI
        #10;

        // Test branch instructions
        instruction = 32'b00000100001000010000000000000000; // BLTZ
        #10;
        instruction = 32'b00011100001000010000000000000000; // BGEZ
        #10;
        instruction = 32'b00010000001000100000000000000001; // BEQ
        #10;
        instruction = 32'b00011000001000100000000000000001; // BLEZ
        #10;
        instruction = 32'b00010100001000100000000000000001; // BNE
        #10;
        instruction = 32'b00011100001000100000000000000001; // BGTZ
        #10;

        // Test R-type instructions
        instruction = 32'b00000000001000010001000000000000; // SLL
        #10;
        instruction = 32'b00000000001000010001000000000010; // SRL
        #10;
        instruction = 32'b00000000001000010001000000000011; // SRA
        #10;
        instruction = 32'b00000000001000010001000000000100; // SLLV
        #10;
        instruction = 32'b00000000001000010001000000000110; // SRLV
        #10;
        instruction = 32'b00000000001000010001000000000111; // SRAV
        #10;
        instruction = 32'b00000000001000010001000000010000; // ADD
        #10;
        instruction = 32'b00000000001000010001000000010001; // ADDU
        #10;
        instruction = 32'b00000000001000010001000000010010; // SUB
        #10;
        instruction = 32'b00000000001000010001000000010011; // SUBU
        #10;
        instruction = 32'b00000000001000010001000000010100; // AND
        #10;
        instruction = 32'b00000000001000010001000000010101; // OR
        #10;
        instruction = 32'b00000000001000010001000000010110; // XOR
        #10;
        instruction = 32'b00000000001000010001000000010111; // NOR
        #10;
        instruction = 32'b00000000001000010001000000011010; // SLT
        #10;
        instruction = 32'b00000000001000010001000000011011; // SLTU
        #10;

        // Test J-type instructions
        instruction = 32'b00001000000000000000000000000001; // J
        #10;
        instruction = 32'b00001100000000000000000000000001; // JAL
        #10;

        $stop;
    end
endmodule
