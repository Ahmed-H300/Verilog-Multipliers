module MULTREETB;
reg signed [31:0] a, b;
wire signed [63:0] MulTreeResult;
wire overflowMulTree;
reg clk, reset, en;
miltiplierTree MulTree(a, b, MulTreeResult, overflowMulTree);
integer passed, failed;
initial begin
	clk = 1;
	passed = 0;
	failed = 0;
	reset = 1;
	en = 1;
	#50;
	#50;
	a = 5;
    b = -7;
	#50;
	#50;
	if (MulTreeResult === -35) begin  
		passed = passed + 1;
		$display("TestCase#1: success");
	end else begin
		failed = failed +1;
		$display("TestCase#1: failed with Input %d, %d, Output MulTreeResult: %d, Booth multiplier: %d", a, b, MulTreeResult, overflowMulTree);
	end
	a = 2;
    b = 3;
	#50;
	#50;
	if (MulTreeResult === 6) begin  
		passed = passed + 1;
		$display("TestCase#2: success");
	end else begin
		failed = failed +1;
		$display("TestCase#2: failed with Input %d, %d, Output MulTreeResult: %d, Booth multiplier: %d", a, b, MulTreeResult, overflowMulTree);
	end
	a = -12;
    b = -4;
	#50;
	#50;
	if (MulTreeResult === 48) begin 
		passed = passed + 1; 
		$display("TestCase#3: success");
	end else begin
		failed = failed +1;
		$display("TestCase#3: failed with Input %d, %d, Output MulTreeResult: %d, Booth multiplier: %d", a, b, MulTreeResult, overflowMulTree);
	end
	a = -9;
    b = 5;
	#50;
	#50;
	if (MulTreeResult === -45) begin  
		passed = passed + 1;
		$display("TestCase#4: success");
	end else begin
		failed = failed +1;
		$display("TestCase#4: failed with Input %d, %d, Output MulTreeResult: %d, Booth multiplier: %d", a, b, MulTreeResult, overflowMulTree);
	end
	a = 11;
    b = 0;
	#50;
	#50;
	if (MulTreeResult === 0) begin  
		passed = passed + 1;
		$display("TestCase#5: success");
	end else begin
		failed = failed +1;
		$display("TestCase#5: failed with Input %d, %d, Output MulTreeResult: %d, Booth multiplier: %d", a, b, MulTreeResult, overflowMulTree);
	end
	a = 10;
    b = 1;
	#50;
	#50;
	if (MulTreeResult === 10) begin  
		passed = passed + 1;
		$display("TestCase#6: success");
	end else begin
		failed = failed +1;
		$display("TestCase#6: failed with Input %d, %d, Output MulTreeResult: %d, Booth multiplier: %d", a, b, MulTreeResult, overflowMulTree);
	end
	a = 4;
    b = 6;
	#50;
	#50;
	if (MulTreeResult === 24) begin  
		passed = passed + 1;
		$display("TestCase#7: success");
	end else begin
		failed = failed +1;
		$display("TestCase#7: failed with Input %d, %d, Output MulTreeResult: %d, Booth multiplier: %d", a, b, MulTreeResult, overflowMulTree);
	end
	a = -1;
    b = -7;
	#50;
	#50;
	if (MulTreeResult === 7) begin  
		passed = passed + 1;
		$display("TestCase#8: success");
	end else begin
		failed = failed +1;
		$display("TestCase#8: failed with Input %d, %d, Output MulTreeResult: %d, Booth multiplier: %d", a, b, MulTreeResult, overflowMulTree);
	end
	$display("Total passed tests: %d and Total failed tests: %d", passed, failed);
end

always begin
	#25;
	clk = ~clk;
end
endmodule