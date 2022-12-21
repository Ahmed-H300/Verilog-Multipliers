module floatingMultiplierWithRegs #(parameter N = 32) (inputA, inputB, clk, reset, en, result, overflow, exception);
input clk, reset, en;
input [N-1:0] inputA, inputB;
output overflow, exception;
output [N-1:0] result;
wire [N-1:0] A_reg;
wire [N-1:0] B_reg;
wire [N-1:0] out_reg;
wire overflow_reg, exception_reg;
registerNbits #(32) regA(clk, reset, en, inputA, A_reg);
registerNbits #(32) regB(clk, reset, en, inputB, B_reg);
floatingMultiplier floatingMultiplierInst(A_reg, B_reg, out_reg, overflow_reg, exception_reg);
registerNbits #(32) outReg(clk, reset, en, out_reg, result);
registerNbits #(1) outOverflow(clk, reset, en, overflow_reg, overflow);
registerNbits #(1) outException(clk, reset, en, exception_reg, exception);
endmodule