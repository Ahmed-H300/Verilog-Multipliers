module boothmultiplier (input [31:0] m, input [31:0] q, output [63:0] result);
integer i;

reg signed [64:0]res=0;
assign result = res[64:1];

always @(m or q) begin
res = {32'b0,q,1'b0};
for(i = 0; i < 32; i = i + 1) begin

if(res[1:0] == 2'b01)begin
res[64:33] = res[64:33] + m;
res = res >>> 1;
end
else if(res[1:0] == 2'b10) begin
res[64:33] = res[64:33] - m;
res = res >>> 1;
end
else begin
res = res >>> 1;
end



end

end
endmodule