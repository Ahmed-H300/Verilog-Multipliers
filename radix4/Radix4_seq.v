module Radix4Booth (start,clk,en1,en2,result);
input [31:0] en1,en2;
input clk,start;
output reg [63:0] result;

reg [63:0] tempResult;

reg[31:0] A;
reg[31:0] B;

reg [34:0] newB;

reg [63:0] A1Plus;
reg [63:0] A1Minus;
reg [63:0] A2Plus;
reg [63:0] A2Minus;

reg [31:0] A1MinusFirst;
reg [32:0] A2PlusFirst;
reg [32:0] A2MinusFirst;

reg [63:0] in;
reg signed [5:0] n;


always@(posedge clk)
begin
if (start) 
  begin
    A=en1;
    B=en2;
    newB = {{2{B[31]}} , B  , 1'b0 };
    tempResult='b0;
    in='b0;
    n = 6'b000000;

    A1Plus = { {32{A[31]}}, A };

    A1MinusFirst=~A+1;
    A1Minus={ {32{A1MinusFirst[31]}}, A1MinusFirst };

    A2PlusFirst = A << 1;
    A2Plus={{31{A2PlusFirst[32]}},A2PlusFirst};

    A2MinusFirst=~A2Plus+1;
    A2Minus={{31{A2MinusFirst[32]}},A2MinusFirst};

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

          3'b011 : in= (A2Plus);

          3'b100 : in= (A2Minus);

          3'b101 : in= (A1Minus);
          3'b110 : in= (A1Minus);
          endcase

          tempResult=tempResult+(in<< n);
        n = n+2;
        end
    end
end

endmodule