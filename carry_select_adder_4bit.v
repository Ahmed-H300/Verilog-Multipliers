`include "mux2x1.v"
`include "mux4x1.v"
`include "ripple_adder_with_carry.v"
module carrySelectAdder4bit (input [3:0] x, input [3:0] y, input carryin, output [3:0] sum, output carryout);

wire [3:0] out1;
wire c1;
wire [3:0] out2;
wire c2;

ripple_adder_with_carry #(4) RA1 (.InputA(x),.InputB(y),.Carryin(1'b0),.OutSum(out1),.CarryOut(c1));
ripple_adder_with_carry #(4) RA2 (.InputA(x),.InputB(y),.Carryin(1'b1),.OutSum(out2),.CarryOut(c2));
//ripple_adder_with_carry #(4) RA2 (x,y,1,out2,c2);

mux4x1 M1 (out1, out2, carryin, sum);
mux2x1 M2 (c1, c2, carryin, carryout);


endmodule