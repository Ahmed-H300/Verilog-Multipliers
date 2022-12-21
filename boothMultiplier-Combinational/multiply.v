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


module boothmultiplier (input [31:0] m, input [31:0] q, output [63:0] result);
integer i;

reg signed [64:0]res=0;
assign result = res[64:1];

always @(m or q) begin
res = {32'b0,q,1'b0};
for(i = 0; i < 32; i = i + 1) begin

if(res[1:0] == 2'b01)begin
res[64:33] = res[64:33] + m;
res = res >>> 1;
end
else if(res[1:0] == 2'b10) begin
res[64:33] = res[64:33] - m;
res = res >>> 1;
end
else begin
res = res >>> 1;
end



end

end
endmodule

module integrationMult #(parameter N = 32) (inputA, inputB, clk, reset, en, result);
input clk, reset, en;
input [N-1:0] inputA, inputB;
output [2*N-1:0] result;
wire [N-1:0] A_reg;
wire [N-1:0] B_reg;
wire [N-1:0] outA_reg;
wire [N-1:0] outB_reg;
registerNbits #(32) regA(clk, reset, en, inputA, A_reg);
registerNbits #(32) regB(clk, reset, en, inputB, B_reg);
boothmultiplier BM(A_reg, B_reg, {outA_reg,outB_reg});
registerNbits #(32) outA(clk, reset, en, outB_reg, result[N-1:0]);
registerNbits #(32) outB(clk, reset, en, outA_reg, result[2*N-1:N]);
endmodule