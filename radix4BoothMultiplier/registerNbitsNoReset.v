module registerNbitsNoReset #(parameter N = 32) (clk, en, inp, out);
	input clk, en;
	output reg [N-1:0] out;
	input [N-1:0] inp;
	always @(posedge clk) begin
			if(en)
				out <= inp;
	end
endmodule