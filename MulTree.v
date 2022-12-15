module miltiplierTree (
	input  [31:0] a,
	input [31:0] b,
	output [63:0] out,
	output wire overflowFlag
);
	
	wire [63:0] p_prods [32:0] ;
	integer i;
	
	partial_products pp (a, b, p_prods);

	

	//The following is for level 1 of the multiplier tree
	wire [63:0] sum_l11, cout_l11, sum_l12, cout_l12, sum_l13, cout_l13, sum_l14, cout_l14, sum_l15, cout_l15, sum_l16, cout_l16, sum_l17, cout_l17, sum_l18, cout_l18, sum_l19, cout_l19, sum_l110, cout_l110;

	FA_64 l11 (p_prods[0][63:0], p_prods[1][63:0], p_prods[2][63:0], sum_l11[63:0], cout_l11[63:0]);
	FA_64 l12 (p_prods[3][63:0], p_prods[4][63:0], p_prods[5][63:0], sum_l12[63:0], cout_l12[63:0]);
	FA_64 l13 (p_prods[6][63:0], p_prods[7][63:0], p_prods[8][63:0], sum_l13[63:0], cout_l13[63:0]);
	FA_64 l14 (p_prods[9][63:0], p_prods[10][63:0], p_prods[11][63:0], sum_l14[63:0], cout_l14[63:0]);
	FA_64 l15 (p_prods[12][63:0], p_prods[13][63:0], p_prods[14][63:0], sum_l15[63:0], cout_l15[63:0]);
	FA_64 l16 (p_prods[15][63:0], p_prods[16][63:0], p_prods[17][63:0], sum_l16[63:0], cout_l16[63:0]);
	FA_64 l17 (p_prods[18][63:0], p_prods[19][63:0], p_prods[20][63:0], sum_l17[63:0], cout_l17[63:0]);
	FA_64 l18 (p_prods[21][63:0], p_prods[22][63:0], p_prods[23][63:0], sum_l18[63:0], cout_l18[63:0]);
	FA_64 l19 (p_prods[24][63:0], p_prods[25][63:0], p_prods[26][63:0], sum_l19[63:0], cout_l19[63:0]);
	FA_64 l110 (p_prods[27][63:0], p_prods[28][63:0], p_prods[29][63:0], sum_l110[63:0], cout_l110[63:0]);
	
	//The following is for level 2 of the multiplier tree
	wire [63:0] sum_l21, cout_l21, sum_l22, cout_l22, sum_l23, cout_l23, sum_l24, cout_l24, sum_l25, cout_l25, sum_l26, cout_l26, sum_l27, cout_l27;

	FA_64 l21 (sum_l11[63:0], cout_l11[63:0], sum_l12[63:0], sum_l21[63:0], cout_l21[63:0]);
	FA_64 l22 (cout_l12[63:0], sum_l13[63:0], cout_l13[63:0], sum_l22[63:0], cout_l22[63:0]);
	FA_64 l23 (sum_l14[63:0], cout_l14[63:0], sum_l15[63:0], sum_l23[63:0], cout_l23[63:0]);
	FA_64 l24 (cout_l15[63:0], sum_l16[63:0], cout_l16[63:0], sum_l24[63:0], cout_l24[63:0]);
	FA_64 l25 (sum_l17[63:0], cout_l17[63:0], sum_l18[63:0], sum_l25[63:0], cout_l25[63:0]);
	FA_64 l26 (cout_l18[63:0], sum_l19[63:0], cout_l19[63:0], sum_l26[63:0], cout_l26[63:0]);
	FA_64 l27 (sum_l110[63:0], cout_l110[63:0], p_prods[30][63:0], sum_l27[63:0], cout_l27[63:0]);
	
	//The following is for level 3 of the multiplier tree
	wire [63:0] sum_l31, cout_l31, sum_l32, cout_l32, sum_l33, cout_l33, sum_l34, cout_l34, sum_l35, cout_l35;

	FA_64 l31 (sum_l21[63:0], cout_l21[63:0], sum_l22[63:0], sum_l31[63:0], cout_l31[63:0]);
	FA_64 l32 (cout_l22[63:0], sum_l23[63:0], cout_l23[63:0], sum_l32[63:0], cout_l32[63:0]);
	FA_64 l33 (sum_l24[63:0], cout_l24[63:0], sum_l25[63:0], sum_l33[63:0], cout_l33[63:0]);
	FA_64 l34 (cout_l25[63:0], sum_l26[63:0], cout_l26[63:0], sum_l34[63:0], cout_l34[63:0]);
	FA_64 l35 (sum_l27[63:0], cout_l27[63:0], p_prods[31][63:0], sum_l35[63:0], cout_l35[63:0]);

	// The following is for level 4 of the multiplier tree
	wire [63:0] sum_l41, cout_l41, sum_l42, cout_l42, sum_l43, cout_l43;

	FA_64 l41 (sum_l31[63:0], cout_l31[63:0], sum_l32[63:0], sum_l41[63:0], cout_l41[63:0]);
	FA_64 l42 (cout_l32[63:0], sum_l33[63:0], cout_l33[63:0], sum_l42[63:0], cout_l42[63:0]);
	FA_64 l43 (sum_l34[63:0], cout_l34[63:0], sum_l35[63:0], sum_l43[63:0], cout_l43[63:0]);
	
	// The following is for level 5 of the multiplier tree
	wire [63:0] sum_l51, cout_l51, sum_l52, cout_l52;

	FA_64 l51 (sum_l41[63:0], cout_l41[63:0], sum_l42[63:0], sum_l51[63:0], cout_l51[63:0]);
	FA_64 l52 (cout_l42[63:0], sum_l43[63:0], cout_l43[63:0], sum_l52[63:0], cout_l52[63:0]);

	// The following is for level 6 of the multiplier tree
	wire [63:0] sum_l61, cout_l61;

	FA_64 l61 (sum_l51[63:0], cout_l51[63:0], sum_l52[63:0], sum_l61[63:0], cout_l61[63:0]);
	
	// The following is for level 7 of the multiplier tree
	wire [63:0] sum_l71, cout_l71;

	FA_64 l71 (sum_l61[63:0], cout_l61[63:0], cout_l52[63:0], sum_l71[63:0], cout_l71[63:0]);

	// The following is for level 8 of the multiplier tree
	wire [63:0] sum_l81, cout_l81;

	FA_64 l81 (sum_l71[63:0], cout_l71[63:0], cout_l35[63:0], sum_l81[63:0], cout_l81[63:0]);


	wire [63:0] sum_l91, cout_l91;

	FA_64 l91 (sum_l81[63:0], cout_l81[63:0], p_prods[32], sum_l91[63:0], cout_l91[63:0]);

	// The following is for level 9 of the multiplier tree


	 wire c;
	wire c2;
	 Carry_plus l101 (sum_l91[31:0], cout_l91[31:0], 1'b0, out[31:0], c);
	 Carry_plus l102 ( sum_l91[63:32], cout_l91[63:32], c, out[63:32], c2);

    	 assign overflowFlag = (a[31]==b[31] && a[31] !== out[63] )? 1'b1 : 1'b0;

endmodule