module radix4BoothWithRegs #(parameter N = 32) (inputA, inputB, clk, reset, resetIntegration, en, result);
input clk, reset, en, resetIntegration;
input [N-1:0] inputA, inputB;
output [2*N-1:0] result;
wire [N-1:0] A_reg;
wire [N-1:0] B_reg;
wire [N-1:0] outA_reg;
wire [N-1:0] outB_reg;
wire enableOutput;
registerNbitsNoReset #(32) regA(clk, en, inputA, A_reg);
registerNbitsNoReset #(32) regB(clk, en, inputB, B_reg);
radix4Booth radix4BoothIns(A_reg, B_reg, clk, reset, en, {outA_reg,outB_reg}, enableOutput);
registerNbits #(32) outA(clk, resetIntegration, enableOutput, outB_reg, result[N-1:0]);
registerNbits #(32) outB(clk, resetIntegration, enableOutput, outA_reg, result[2*N-1:N]);
endmodule