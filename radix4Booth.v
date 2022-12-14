module radix4Booth (input [31:0] a, input [31:0] b, output [63:0] result, output carry, output overflow);
  reg [2:0] selectors [0:15];
  reg [63:0] products [0:15];
  wire [63:0] aux [0:14];
  wire [31:0] firstInputShifted;
  wire [31:0] firstInputComplement;
  wire [31:0] firstInputComplementShifted;
  assign firstInputShifted = a << 1'b1;
  assign firstInputComplement = ~a + 1'b1;
  assign firstInputComplementShifted = firstInputComplement << 1'b1;
  integer i;
  integer j;
  genvar k;
  assign aux[0] = products[0];
  generate
  	for(k = 1; k < 15; k = k + 1)
 		carrySelectAdder #(64)adder(aux[k-1],products[k],1'b0,aux[k], carry, overflow);
  endgenerate
  carrySelectAdder #(64)finalAdder(aux[14],products[15],1'b0,result, carry, overflow);
  always @(a or b) begin
    selectors[0] = {b[1], b[0], 1'b0};
    for(i = 1; i < 16; i = i +1) 
      selectors[i] = {b[(2*i) + 1], b[2*i], b[(2*i) - 1]};
    for(i = 0; i < 16; i = i +1) begin
      case(selectors[i])
        3'b001: products[i] = {{32{a[31]}},a[31:0]}; // 001 => put first input as it is
        3'b010: products[i] = {{32{a[31]}},a[31:0]}; // 010 => put first input as it is
        3'b011: products[i] = {{32{firstInputShifted[31]}}, firstInputShifted}; // 011 => shift left first input by one (multiply by 2)
        3'b100: products[i] = {{32{firstInputComplementShifted[31]}},firstInputComplementShifted}; // 100 => sheft left 2's complement of first input by one (multiply by -2)
        3'b101: products[i] = {{32{firstInputComplement[31]}},firstInputComplement}; // 101 => put 2's complement of first input
        3'b110: products[i] = {{32{firstInputComplement[31]}},firstInputComplement}; // 110 => put 2's complement of first input
        default: products[i] = 64'b0; // 000, 111 => put 0
      endcase
      // if we add 100 + 101, we want to make it, 00100 + 10100, and every stage we shift more bits
      for(j = 0; j < i; j = j + 1)
        products[i] = products[i] << 2'b10;  // shift left 2 bits
    end
  end
endmodule

