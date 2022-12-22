module boothmultiplier (input [31:0] m, input [31:0] q, input clk, input reset, input en, output reg [63:0] result, output reg enableOutput);

reg resetReg;
reg [5:0] counter;

reg [64:0]res=0;
assign result = res[64:1];

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
else if (counter === 0)begin
res = {32'b0,q,1'b0};
if(res[1:0] == 2'b01)begin
res[64:33] = res[64:33] + m;
end
else if(res[1:0] == 2'b10) begin
res[64:33] = res[64:33] - m;
end
res = {res[64], res[64:1]};
counter = 1;
end
else begin
if(res[1:0] == 2'b01)begin
res[64:33] = res[64:33] + m;
end
else if(res[1:0] == 2'b10) begin
res[64:33] = res[64:33] - m;
end
res = {res[64], res[64:1]};
counter = counter + 1;
if (counter === 6'd33) begin
counter = 0;
end
if (counter === 6'd32) begin 
result = res; // last iteration
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