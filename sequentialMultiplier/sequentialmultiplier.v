module sequentialmultiplier (input [31:0] in1, input [31:0] in2, output [63:0] result, output overflow);

integer i;

wire [31:0] m;
wire [31:0] q;
wire [63:0] out;

assign m = (in1[31] == 1) ? (-in1): in1;
assign q = (in2[31] == 1) ? (-in2): in2;
assign overflow = (in1[31] ^ in2[31])^result[63];

reg [64:0]res=0;
assign result = out;
assign out = ((in1[31] ^ in2[31]) == 1) ? (-res[63:0]) : res[63:0];

always @(m or q) begin
res = {33'b0,q};
for(i = 0; i < 32; i = i + 1) begin

if(res[0] == 0)begin
res = res >> 1;
end
else begin
res[64:32] = res[63:32] + m;
res = res >> 1;
end



end

end
endmodule
