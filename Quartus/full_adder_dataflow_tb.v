module full_adder_tb();
// input
reg a;
reg b;
reg c;
//output
wire co;
wire s;
full_adder uut (
    .s(s),
    .co(co),
    .a(a),
    .b(b),
    .c(c)
);
initial begin
//every possible combination
{a,b,c} = 3'b000;
#10 {a,b,c} = 3'b001;
#10 {a,b,c} = 3'b010;
#10 {a,b,c} = 3'b011;
#10 {a,b,c} = 3'b100;
#10 {a,b,c} = 3'b101;
#10 {a,b,c} = 3'b110;
#10 {a,b,c} = 3'b111;
end
endmodule   