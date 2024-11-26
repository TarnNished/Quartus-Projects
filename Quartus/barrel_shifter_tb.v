module testbench;
    reg [3:0] data_in;
    reg [1:0] shift_amt;
    wire [3:0] data_out;

    // Instantiate the barrel shifter
    barrel_shifter_4bit shifter (
        .data_in(data_in),
        .shift_amt(shift_amt),
        .data_out(data_out)
    );

    initial begin
        // Initialize inputs
        data_in = 4'b0001; shift_amt = 2'b00; #10;
        data_in = 4'b0001; shift_amt = 2'b01; #10;
        data_in = 4'b0001; shift_amt = 2'b10; #10;
        data_in = 4'b0001; shift_amt = 2'b11; #10;

        // Finish the simulation
        $finish;
    end
endmodule
