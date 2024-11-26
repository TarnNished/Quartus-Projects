module three_port_ram(
    input clk,
    input [7:0] addr_a, addr_b, addr_wr,
    input [31:0] data_in,
    input we,
    output reg [31:0] data_a, data_b
);

    reg [31:0] RAMA [255:0];
    reg [31:0] RAMB [255:0];

    // Initialize RAMA and RAMB with all zeros
    integer i;
    initial begin
        for (i = 0; i < 256; i = i + 1) begin
            RAMA[i] = 32'b0;
            RAMB[i] = 32'b0;
        end
    end

    // Write operation
    always @(posedge clk) begin
        if (we && addr_wr != 8'b0) begin
            RAMA[addr_wr] <= data_in;
            RAMB[addr_wr] <= data_in;
        end
    end

    // Read operation for port A
    always @(posedge clk) begin
        if (addr_a == 8'b0)
            data_a <= 32'b0;
        else
            data_a <= RAMA[addr_a];
    end

    // Read operation for port B
    always @(posedge clk) begin
        if (addr_b == 8'b0)
            data_b <= 32'b0;
        else
            data_b <= RAMB[addr_b];
    end

endmodule
