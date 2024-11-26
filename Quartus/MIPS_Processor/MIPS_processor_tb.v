module tb_MIPS_Processor;
    reg clk;
    reg reset;
    reg init;
    reg [7:0] init_addr;
    reg [31:0] init_data;
    wire [31:0] aluresultout;
    wire [31:0] shiftresultout;
    wire [31:0] GP_DATA_INout;

    // Instantiate the processor
    MIPS_Processor uut (
        .clk(clk),
        .reset(reset),
        .init(init),
        .init_addr(init_addr),
        .init_data(init_data),
        .aluresultout(aluresultout),
        .shiftresultout(shiftresultout),
        .GP_DATA_INout(GP_DATA_INout)
    );

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        init = 0;
        #10;
        reset = 0;

        // Initialize instruction memory
        init = 1;
        init_addr = 0; init_data = 32'b10001100000000010000000000000100; // lw
        #10;
        init_addr = 1; init_data = 32'b10101100000000100000000000001000; // sw
        #10;
        init_addr = 2; init_data = 32'b00100000000000010000000000001010; // addi
        #10;
        init_addr = 3; init_data = 32'b00100000000000010000000000001011; // addiu
        #10;
        init_addr = 4; init_data = 32'b00100100000000010000000000001100; // subi
        #10;
        init_addr = 5; init_data = 32'b00101000000000010000000000001101; // ori
        #10;
        init_addr = 6; init_data = 32'b00101100000000010000000000001110; // andi
        #10;
        init_addr = 7; init_data = 32'b00110000000000010000000000001111; // xori
        #10;
        init_addr = 8; init_data = 32'b00110100000000010000000000001110; // lui
        #10;
        init_addr = 9; init_data = 32'b00011000000000010000000000010000; // bltz
        #10;
        init_addr = 10; init_data = 32'b00011100000000010000000000010001; // bgez
        #10;
        init_addr = 11; init_data = 32'b00001000000000010000000000010010; // beq
        #10;
        init_addr = 12; init_data = 32'b00001100000000010000000000010011; // bne
        #10;
        init_addr = 13; init_data = 32'b00111000000000010000000000010100; // blez
        #10;
        init_addr = 14; init_data = 32'b00111100000000010000000000010101; // bgtz
        #10;
        init_addr = 15; init_data = 32'b01000000000000010000000000010110; // sll
        #10;
        init_addr = 16; init_data = 32'b01000100000000010000000000010111; // srl
        #10;
        init_addr = 17; init_data = 32'b01001000000000010000000000011000; // sra
        #10;
        init_addr = 18; init_data = 32'b01001100000000010000000000011001; // sllv
        #10;
        init_addr = 19; init_data = 32'b01010000000000010000000000011010; // srlv
        #10;
        init_addr = 20; init_data = 32'b01010100000000010000000000011011; // srav
        #10;
        init_addr = 21; init_data = 32'b01011000000000010000000000011100; // add
        #10;
        init_addr = 22; init_data = 32'b01011100000000010000000000011101; // addu
        #10;
        init_addr = 23; init_data = 32'b01100000000000010000000000011110; // sub
        #10;
        init_addr = 24; init_data = 32'b01100100000000010000000000011111; // subu
        #10;
        init_addr = 25; init_data = 32'b01101000000000010000000000100000; // and
        #10;
        init_addr = 26; init_data = 32'b01101100000000010000000000100001; // or
        #10;
        init_addr = 27; init_data = 32'b01110000000000010000000000100010; // xor
        #10;
        init_addr = 28; init_data = 32'b01110100000000010000000000100011; // nor
        #10;
        init_addr = 29; init_data = 32'b01111000000000010000000000100100; // slt
        #10;
        init_addr = 30; init_data = 32'b01111100000000010000000000100101; // sltu
        #10;
        init_addr = 31; init_data = 32'b10000000000000010000000000100110; // jr
        #10;
        init_addr = 32; init_data = 32'b10000100000000010000000000100111; // jalr
        #10;
        init_addr = 33; init_data = 32'b10001000000000010000000000101000; // j
        #10;
        init_addr = 34; init_data = 32'b10001100000000010000000000101001; // jal
        #10;
        init_addr = 35; init_data = 32'b11111100000000010000000000101010; // example data
        #10;

        init = 0;

        // Simulate for a sufficient amount of time
        #1000;

        // Finish simulation
        $finish;
    end

    // Clock generation
    always #5 clk = ~clk;

endmodule
