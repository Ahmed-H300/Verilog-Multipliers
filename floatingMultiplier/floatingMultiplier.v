module floatingMultiplier (input [31:0] a, input [31:0] b, output [63:0] result);
wire [10:0] doubleExponentA, doubleExponentB;
wire [51:0] resultMantissa;
assign doubleExponentA = a[30:23] + 'd896; // -127 to return the original exponent and +1023 to represent it with douple precision
assign doubleExponentB = b[30:23] + 'd896;
assign resultMantissa = {1'b1,a[22:0]} * {1'b1,b[22:0]}; // 48, we need to shift left 4 bits to append zeros at the end, and and shift left another 2 bits to remove unwanted ones that resulted from prepending one to each mantissa
assign result = a[30:0] == 'd0 ? 0 : b[30:0] == 'd0 ? 0 : {a[31]^b[31], (doubleExponentA+doubleExponentB-1023), (resultMantissa<<6)}; // we added 1023 2 times so remove one of them, and we need to append 29 zeros to the end of every mantissa be 64 bit
endmodule