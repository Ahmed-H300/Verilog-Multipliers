module Carry_plus(in_1, in_2,Cin, Sum, Cout);
    input [31:0] in_1, in_2;	
    input Cin;
    output wire Cout;
    output wire [31:0] Sum;
    assign {Cout, Sum} = in_1 + in_2 + Cin;
endmodule