module shift_register_4bit(
    input clk,
    input reset,
    input [3:0] data_in,
    input load,
    output reg [3:0] data_out
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            data_out <= 4'b0000;
        end else if (load) begin
            data_out <= data_in;
        end else begin
            data_out <= data_out << 1; // Shift left by 1 bit
        end
    end
endmodule
