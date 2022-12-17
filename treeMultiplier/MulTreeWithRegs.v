module MulTreeWithRegs #(parameter N = 32) (inputA, inputB, clk, reset, en, result);
input clk, reset, en;
input [N-1:0] inputA, inputB;
output [2*N-1:0] result;
wire [N-1:0] A_reg;
wire [N-1:0] B_reg;
wire [N-1:0] outA_reg;
wire [N-1:0] outB_reg;
registerNbits #(32) regA(clk, reset, en, inputA, A_reg);
registerNbits #(32) regB(clk, reset, en, inputB, B_reg);
miltiplierTree MulTree(A_reg, B_reg, {outA_reg,outB_reg});
registerNbits #(32) outA(clk, reset, en, outB_reg, result[N-1:0]);
registerNbits #(32) outB(clk, reset, en, outA_reg, result[2*N-1:N]);
endmodule