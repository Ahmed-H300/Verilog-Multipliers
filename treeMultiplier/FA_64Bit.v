module FA_64 (
	input [63:0] x,
	input [63:0] y,
	input [63:0] z,
	output [63:0] sum,
	output [63:0] cout);

assign sum = x^y^z;
assign cout[0] = 0;
assign cout[63:1] = (x&y) | (y&z) | (z&x);

endmodule