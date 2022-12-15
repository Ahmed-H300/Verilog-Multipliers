module XMult (
	input  [31:0] a,
	input [31:0] b,
	output [63:0] out,
	output wire overflowFlag
);
assign out= a*b;
assign overflowFlag = (a[31]==b[31] && a[31] !== out[63] )? 1'b1 : 1'b0;
endmodule