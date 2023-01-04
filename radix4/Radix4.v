module Radix4Booth (start,clk,input1,input2,result);
input [31:0] input1,input2;
input clk,start;
output reg [63:0] result;

reg [63:0] tempResult;

reg[31:0] A;
reg[31:0] B;

reg [34:0] newB;

reg [63:0] A1Plus;
reg [63:0] invertFirstInput;
reg [63:0] shiftFirstInput;
reg [63:0] shiftInvertFirstInput;

reg [31:0] A1MinusFirst;
reg [32:0] A2PlusFirst;
reg [32:0] A2MinusFirst;

reg [63:0] in;
reg signed [5:0] n;


always@(posedge clk)
begin
if (start) 
  begin
    A=input1;
    B=input2;
    newB = {{2{B[31]}} , B  , 1'b0 };
    tempResult='b0;
    in='b0;
    n = 6'b000000;

    A1Plus = { {32{A[31]}}, A };

    A1MinusFirst=~A+1;
    invertFirstInput={ {32{A1MinusFirst[31]}}, A1MinusFirst };

    A2PlusFirst = A << 1;
    shiftFirstInput={{31{A2PlusFirst[32]}},A2PlusFirst};

    A2MinusFirst=~shiftFirstInput+1;
    shiftInvertFirstInput={{31{A2MinusFirst[32]}},A2MinusFirst};

end
else
    begin
      if(n == 'd32)
        begin
          result =  tempResult;
        end
      else
        begin
          case ({newB[n+2],newB[n+1],newB[n]})
          3'b000 : in= 0;
          3'b111 : in= 0;

          3'b001 : in= (A1Plus);
          3'b010 : in= (A1Plus);

          3'b011 : in= (shiftFirstInput);

          3'b100 : in= (shiftInvertFirstInput);

          3'b101 : in= (invertFirstInput);
          3'b110 : in= (invertFirstInput);
          endcase

          tempResult=tempResult+(in<< n);
        n = n+2;
        end
    end
end

endmodule
module Radix4 (input clk, input [31:0] inputA, inputB, output reg [63:0] out, input start);
	wire [63:0] result;
	reg [31:0] A, B;

	// input register
	always @(posedge clk) begin
		A = inputA;
		B = inputB;
	end

	Radix4Booth mult(start, clk ,A, B, result);

	// output register
	always @(posedge clk) begin
		out <= result;
	end

endmodule