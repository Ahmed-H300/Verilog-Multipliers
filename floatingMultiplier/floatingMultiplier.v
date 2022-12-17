module floatingMultiplier (input [31:0] a, input [31:0] b, output [31:0] result, output exception, output overflow);
wire [47:0] tempMantissa;
wire [7:0] tempExponent, resultExponent;
wire [22:0] resultMantissa;
wire isZero, sign;
assign sign = a[31]^b[31];
assign overflow = ((resultExponent[8] && !resultExponent[7]) && !isZero) === 1'b1 ? 1'b1 : 1'b0;
assign exception = (&a[30:23]) || (&b[30:23]); // exception is 1 whenever any exponent is 255
assign tempMantissa = {1'b1,a[22:0]} * {1'b1,b[22:0]}; // we need to ignore most left 2 bits to remove unwanted 2 bits that resulted from prepending one to each mantissa
assign tempExponent = a[30:23]+b[30:23]-127; // we added 127 2 times, so remove one of them
assign resultMantissa = tempMantissa[47] === 1'b0 ? tempMantissa[45:23] : tempMantissa[46:24]; // remove unwanted 2 bits that resulted from prepending one to each mantissa, or remove just 1 bit in case last bit is 1
assign resultExponent = tempMantissa[47] === 1'b0 ? tempExponent : tempExponent+1'b1; // increment the exponent if the last bit resulted from adding mantissas is 1
assign isZero = exception ? 1'b0 : (resultMantissa == 23'd0) ? 1'b1 : 1'b0;
assign result = ((a[30:0] === 1'b0) || (b[30:0] === 1'b0) ||  (exception === 1'b1)) ? 32'd0 : (overflow === 1'b1 ? {sign, 8'b11111111, 23'd0} : {sign, resultExponent, resultMantissa});
endmodule