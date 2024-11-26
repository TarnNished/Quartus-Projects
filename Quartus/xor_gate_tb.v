module xor_test;
reg x,y;
wire z;
xor_gate xor_test(z,x,y);
initial
begin
#000 x=0;y=0;
#100 x=0;y=1;
#100 x=1;y=0;
#100 x=1;y=1;
end

endmodule