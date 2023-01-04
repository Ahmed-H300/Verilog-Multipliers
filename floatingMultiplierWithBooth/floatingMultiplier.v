module registerNbits #(parameter N = 32) (clk, reset, en, inp, out);
	input clk, reset, en;
	output reg [N-1:0] out;
	input [N-1:0] inp;
	always @(posedge clk) begin
			if (reset) 
				out <= 'b0;
			else if(en)
				out <= inp;
	end
endmodule

module boothmultiplier (input [31:0] m, input [31:0] q, input clk, input reset, input en, output reg [63:0] result, output reg enableOutput);

reg resetReg;
reg [5:0] counter;

reg [64:0]res=0;
//assign result = res[64:1];

always @(posedge clk) begin
enableOutput = 0;
if (en === 1'b1) begin
if (reset === 1'b1) begin
counter = 0;
result = 0;
resetReg = 1;
enableOutput = 1;
end
else if (resetReg === 1'b1) begin
counter = 0;
result = 0;
resetReg = 0; // make it waits 1 cycle after reset is gone to 0 to get right data
end
else if (counter === 0)begin
res = {32'b0,q,1'b0};
if(res[1:0] == 2'b01)begin
res[64:33] = res[64:33] + m;
end
else if(res[1:0] == 2'b10) begin
res[64:33] = res[64:33] - m;
end
res = {res[64], res[64:1]};
counter = 1;
end
else begin
if(res[1:0] == 2'b01)begin
res[64:33] = res[64:33] + m;
end
else if(res[1:0] == 2'b10) begin
res[64:33] = res[64:33] - m;
end
res = {res[64], res[64:1]};
counter = counter + 1;
if (counter === 6'd33) begin
counter = 0;
end
if (counter === 6'd32) begin 
result = res[64:1]; // last iteration
// make one cycle delay for getting input data right
enableOutput = 1; // write the previos result out to the out register
end
end
end
else begin
result = 64'bx;
enableOutput = 1;
end
end


endmodule

module boothmultiplier_withregs #(parameter N = 32) (inputA, inputB, clk, reset, en, result, enableOutput);
input clk, reset, en;
input [N-1:0] inputA, inputB;
output [2*N-1:0] result;
wire [N-1:0] A_reg;
wire [N-1:0] B_reg;
wire [N-1:0] outA_reg;
wire [N-1:0] outB_reg;
output enableOutput;
registerNbits #(32) regA(clk, reset, en, inputA, A_reg);
registerNbits #(32) regB(clk, reset, en, inputB, B_reg);
boothmultiplier BM(A_reg, B_reg, clk, reset, en, {outA_reg,outB_reg}, enableOutput);
registerNbits #(32) outA(clk, reset, enableOutput, outB_reg, result[N-1:0]);
registerNbits #(32) outB(clk, reset, enableOutput, outA_reg, result[2*N-1:N]);
endmodule

module floatingMultiplier (input [31:0] a, input [31:0] b, output [31:0] result, output exception, output overflow, input clk, input reset, input en, output enableOutput);
wire [47:0] tempMantissa;
wire [7:0] tempExponent, resultExponent;
wire [22:0] resultMantissa;
wire isZero, sign;
boothmultiplier boothInst({8'b00000000, {1'b1,a[22:0]}}, {8'b00000000, {1'b1,b[22:0]}}, clk, reset, en, tempMantissa, enableOutput);
assign sign = a[31]^b[31];
assign overflow = ((resultExponent[8] && !resultExponent[7]) && !isZero) === 1'b1 ? 1'b1 : 1'b0; // exponent is too large
assign exception = (&a[30:23]) || (&b[30:23]); // exception is 1 whenever any exponent is 255
assign tempExponent = a[30:23]+b[30:23]-127; // we added 127 2 times, so remove one of them
assign resultMantissa = tempMantissa[47] === 1'b0 ? tempMantissa[45:23] : tempMantissa[46:24]; // remove unwanted 2 bits that resulted from prepending one to each mantissa, or remove just 1 bit in case last bit is 1
assign resultExponent = tempMantissa[47] === 1'b0 ? tempExponent : tempExponent+1'b1; // increment the exponent if the last bit resulted from adding mantissas is 1
assign isZero = exception ? 1'b0 : (resultMantissa == 23'd0) ? 1'b1 : 1'b0;
assign result = (enableOutput === 1'b1) ? (reset === 1'b0) ? ((a[30:0] === 1'b0) || (b[30:0] === 1'b0) ||  (exception === 1'b1)) ? 32'd0 : (overflow === 1'b1 ? {sign, 8'b11111111, 23'd0} : {sign, resultExponent, resultMantissa}) : 32'b0 : 32'bx;
endmodule

module integrationMult #(parameter N = 32) (inputA, inputB, clk, reset, en, result, overflow, exception);
input clk, reset, en;
input [N-1:0] inputA, inputB;
output overflow, exception;
output [N-1:0] result;
wire [N-1:0] A_reg;
wire [N-1:0] B_reg;
wire [N-1:0] out_reg;
wire overflow_reg, exception_reg;
wire enableOutput;
registerNbits #(32) regA(clk, reset, en, inputA, A_reg);
registerNbits #(32) regB(clk, reset, en, inputB, B_reg);
floatingMultiplier floatingMultiplierInst(A_reg, B_reg, out_reg, overflow_reg, exception_reg, clk, reset, en, enableOutput);
registerNbits #(32) outReg(clk, reset, enableOutput, out_reg, result);
registerNbits #(1) outOverflow(clk, reset, enableOutput, overflow_reg, overflow);
registerNbits #(1) outException(clk, reset, enableOutput, exception_reg, exception);
endmodule