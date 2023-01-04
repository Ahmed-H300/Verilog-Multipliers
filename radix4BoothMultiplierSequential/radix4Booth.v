module radix4Booth (input [31:0] a, input [31:0] b, input clk, input reset, input en, output reg [63:0] result, output reg enableOutput);
  reg [63:0] product /*[0:15]*/;
  reg [63:0] aux;
  reg [4:0] j;
  reg [4:0] counter;
  reg resetReg;
  wire [2:0] selectors [0:15];
  wire [63:0] auxA;
  wire [63:0] firstInputShifted;
  wire [63:0] firstInputComplement;
  wire [63:0] firstInputComplementShifted;
  assign auxA = {{32{a[31]}},a[31:0]};
  assign firstInputShifted = auxA << 1'b1;
  assign firstInputComplement = ~auxA + 1'b1;
  assign firstInputComplementShifted = firstInputComplement << 1'b1;
  assign selectors[0] = {b[1], b[0], 1'b0};
  assign selectors[1] = {b[3], b[2], b[1]};
  assign selectors[2] = {b[5], b[4], b[3]};
  assign selectors[3] = {b[7], b[6], b[5]};
  assign selectors[4] = {b[9], b[8], b[7]};
  assign selectors[5] = {b[11], b[10], b[9]};
  assign selectors[6] = {b[13], b[12], b[11]};
  assign selectors[7] = {b[15], b[14], b[13]};
  assign selectors[8] = {b[17], b[16], b[15]};
  assign selectors[9] = {b[19], b[18], b[17]};
  assign selectors[10] = {b[21], b[20], b[19]};
  assign selectors[11] = {b[23], b[22], b[21]};
  assign selectors[12] = {b[25], b[24], b[23]};
  assign selectors[13] = {b[27], b[26], b[25]};
  assign selectors[14] = {b[29], b[28], b[27]};
  assign selectors[15] = {b[31], b[30], b[29]};
  always @(posedge clk) begin
      enableOutput = 0;
    if (en === 1'b1) begin
      if (reset === 1'b1) begin
        counter = 0;
        result = 0;
        resetReg = 1;
      end
      else if (resetReg === 1'b1) begin
        counter = 0;
        result = 0;
        resetReg = 0; // make it waits 1 cycle after reset is gone to 0 to get right data
      end
      else if (counter === 0) begin
        case(selectors[0])
          3'b001: product = {{32{a[31]}},a[31:0]}; // 001 => put first input as it is
          3'b010: product = {{32{a[31]}},a[31:0]}; // 010 => put first input as it is
          3'b011: product = firstInputShifted; // 011 => shift left first input by one (multiply by 2)
          3'b100: product = firstInputComplementShifted; // 100 => sheft left 2's complement of first input by one (multiply by -2)
          3'b101: product = firstInputComplement; // 101 => put 2's complement of first input
          3'b110: product = firstInputComplement; // 110 => put 2's complement of first input
          default: product = 64'b0; // 000, 111 => put 0
        endcase
        aux = product;
        counter = 1;
      end
      else begin
        case(selectors[counter])
        3'b001: product = {{32{a[31]}},a[31:0]}; // 001 => put first input as it is
        3'b010: product = {{32{a[31]}},a[31:0]}; // 010 => put first input as it is
        3'b011: product = firstInputShifted; // 011 => shift left first input by one (multiply by 2)
        3'b100: product = firstInputComplementShifted; // 100 => sheft left 2's complement of first input by one (multiply by -2)
        3'b101: product = firstInputComplement; // 101 => put 2's complement of first input
        3'b110: product = firstInputComplement; // 110 => put 2's complement of first input
        default: product = 64'b0; // 000, 111 => put 0
        endcase
        // if we add 100 + 101, we want to make it, 00100 + 10100, and every stage we shift more bits
        //for(j = 0; j < counter; j = j + 1)
        product = product << (counter << 1'b1);  // shift left 2 bits
        aux = aux + product;
        counter = counter + 1;
        if (counter === 5'd17) begin 
          counter = 0;
        end
        if (counter === 5'd16) begin 
          result = aux; // last iteration
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


/*
  assign aux[0] = products[0];
  assign aux[1] = aux[0] + products[1];
  assign aux[2] = aux[1] + products[2];
  assign aux[3] = aux[2] + products[3];
  assign aux[4] = aux[3] + products[4];
  assign aux[5] = aux[4] + products[5];
  assign aux[6] = aux[5] + products[6];
  assign aux[7] = aux[6] + products[7];
  assign aux[8] = aux[7] + products[8];
  assign aux[9] = aux[8] + products[9];
  assign aux[10] = aux[9] + products[10];
  assign aux[11] = aux[10] + products[11];
  assign aux[12] = aux[11] + products[12];
  assign aux[13] = aux[12] + products[13];
  assign aux[14] = aux[13] + products[14];
  assign result = aux[14] + products[15];*/