module radix4BoothWithRegs (input [31:0]  a, input [31:0]  b, input clk, output reg [63:0] resultOut, output carry, output overflow);
  reg [63:0] inputs;
  wire [63:0] result;
  radix4Booth radix4BoothIns(inputs[63:32], inputs[31:0], result, carry, overflow);
  always @(posedge clk) begin
    inputs = {a, b};
  end
  always @(negedge clk) begin
    resultOut = result;
  end
endmodule

