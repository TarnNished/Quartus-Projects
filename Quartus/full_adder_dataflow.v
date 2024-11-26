module full_adder(s,co,a,b,c);
input a,b,c;
output s,co;
assign s=a ^ b ^ c;
assign co=  (a & b) | (b & c) | (a & c);
endmodule