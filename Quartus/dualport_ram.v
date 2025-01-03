module dual_port_ram #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 8,
    parameter RAM_DEPTH = 1 << ADDR_WIDTH
)(
    input clk,
    input [ADDR_WIDTH-1:0] addr_a, addr_b, addr_wr_a, addr_wr_b,
    input [DATA_WIDTH-1:0] data_in_a, data_in_b,
    input we_a, we_b,
    output reg [DATA_WIDTH-1:0] data_a, data_b
);

    reg [DATA_WIDTH-1:0] RAM [RAM_DEPTH-1:0];

    // Write operation
    always @(posedge clk) begin
        if (we_a && addr_wr_a != 8'b0) begin
            RAM[addr_wr_a] <= data_in_a;
        end else if (we_b && addr_wr_b != 8'b0) begin
            RAM[addr_wr_b] <= data_in_b;
        end
    end

    // Read operation for port A
    always @(posedge clk) begin
        if (addr_a == 8'b0)
            data_a <= 0;
        else
            data_a <= RAM[addr_a];
    end

    // Read operation for port B
    always @(posedge clk) begin
        if (addr_b == 8'b0)
            data_b <= 0;
        else
            data_b <= RAM[addr_b];
    end
endmodule
