module ROM(address, data);
    input [2:0] address;       // 3-bit address input
    output reg [7:0] data;     // 8-bit data output

    always @(address) begin
        case (address)
            3'b000: data = 8'b00000001;
            3'b001: data = 8'b00000010;
            3'b010: data = 8'b00000100;
            3'b011: data = 8'b00001000;
            3'b100: data = 8'b00010000;
            3'b101: data = 8'b00100000;
            3'b110: data = 8'b01000000;
            3'b111: data = 8'b10000000;
            default: data = 8'b00000000; // Default case
        endcase
    end
endmodule
