module clock (
    clk,
    reset,
    divided_clk
);
    input wire clk;
    input wire reset;
    output reg divided_clk;
    parameter odd = 5;

    localparam COUNTER_SIZE = $clog2(odd);
    reg [COUNTER_SIZE-1:0] counter = 0;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Clear the counter and the divided clock
            counter <= 0;
            divided_clk <= 0;
        end else begin
            if (counter == odd - 1) begin
                // Reset the counter when it reaches odd-1
                counter <= 0;
                // Toggle the divided clock output
                divided_clk <= ~divided_clk;
            end else begin
                counter <= counter + 1;
            end
        end
    end
endmodule
