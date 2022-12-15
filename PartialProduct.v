module partial_products (a,b,p);

	output reg[63:0] p [31:0];
	input [31:0]a;
	input [31:0]b;

	integer i;
	always @(a or b)
	begin
		for(i=0; i<32; i=i+1)
		begin
			if(b[i] === 1)
			begin
				p[i] <= (a << i);
			end
			else
			 p[i] = 64'b0000000000000000000000000000000000000000000000000000000000000000;
		end
	end
endmodule