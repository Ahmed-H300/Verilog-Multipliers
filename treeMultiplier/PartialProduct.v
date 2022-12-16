module partial_products (a,b,p);

	output reg[63:0] p [32:0];
	input [31:0]a;
	input [31:0]b;

	integer i;
	always @(a or b)
	begin
		for(i=0; i<32; i=i+1)
		begin
			if(b[i] === 1)
			begin
				p[i] <= {{32{a[31]}} ,a} << i;
			end
			else
			 p[i] = 64'b0000000000000000000000000000000000000000000000000000000000000000;
		end

		if(b[31] == 1)begin
			p[31] <= {{1{!a[31]}} ,~a,31'b00000000_00000000_00000000_0000000} ;
			p[32] <= 64'b00000000_00000000_00000000_00000000_10000000_00000000_00000000_00000000;
		end
		else begin
			p[31] = 64'h00000000;
			p[32] = 64'h00000000;
		end
	end
endmodule