module MULTREETB;
reg signed [31:0] a, b;
wire signed [63:0] MulTreeResult;
reg clk, reset, en;
MulTreeWithRegs MulTreeWithRegsInst(a, b, clk, reset, en, MulTreeResult);
integer passed, failed;
initial begin
	passed = 0;
	failed = 0;
	clk = 0;
	en = 1;
	a = 553524;
    b = 840;
	reset = 1;
	#20;
	reset = 0;
	#20;
	#320;
	a = 32'h50647236;
    b = 32'h50612336;
	#20;
	if (MulTreeResult === 64'd464960160) begin  
		passed = passed + 1;
		$display("TestCase#1: success");
	end else begin
		failed = failed +1;
		$display("TestCase#1: failed with Input %d, %d, Output MulTreeResult: %d", a, b, MulTreeResult);
	end
	#320;
	a = 553524;
    b = -259;
	#20;
	if (MulTreeResult === 64'h193DE4CED7437964) begin  
		passed = passed + 1;
		$display("TestCase#2: success");
	end else begin
		failed = failed +1;
		$display("TestCase#2: failed with Input %d, %d, Output MulTreeResult: %d", a, b, MulTreeResult);
	end
	#320;
	a = 32'h50647236;
    b = 32'hB887CAAF;
	#20;
	if (MulTreeResult === -143362716) begin 
		passed = passed + 1; 
		$display("TestCase#3: success");
	end else begin
		failed = failed +1;
		$display("TestCase#3: failed with Input %d, %d, Output MulTreeResult: %d", a, b, MulTreeResult);
	end
	#320;
	a = -259;
    b = 553524;
	#20;
	if (MulTreeResult === 64'hE98E647F4142AEEA) begin  
		passed = passed + 1;
		$display("TestCase#4: success");
	end else begin
		failed = failed +1;
		$display("TestCase#4: failed with Input %d, %d, Output MulTreeResult: %d", a, b, MulTreeResult);
	end
	#320;
	a = 32'hB887CAAF;
    b = 32'h50647236;
	#20;
	if (MulTreeResult === -143362716) begin  
		passed = passed + 1;
		$display("TestCase#5: success");
	end else begin
		failed = failed +1;
		$display("TestCase#5: failed with Input %d, %d, Output MulTreeResult: %d", a, b, MulTreeResult);
	end
	#320;
	a = -259;
    b = -259;
	#20;
	if (MulTreeResult === 64'hFDC57DE4938342EA) begin  
		passed = passed + 1;
		$display("TestCase#6: success");
	end else begin
		failed = failed +1;
		$display("TestCase#6: failed with Input %d, %d, Output MulTreeResult: %d", a, b, MulTreeResult);
	end
	#320;
	a = 32'hB887CAAF;
    b = 32'h887CAAF3;
	#20;
	if (MulTreeResult === 67081) begin  
		passed = passed + 1;
		$display("TestCase#7: success");
	end else begin
		failed = failed +1;
		$display("TestCase#7: failed with Input %d, %d, Output MulTreeResult: %d", a, b, MulTreeResult);
	end
	#320;
	a = 1;
    b = 1348760118;
	#20;
	if (MulTreeResult === 64'h215D8B0A7A419A1D) begin  
		passed = passed + 1;
		$display("TestCase#8: success");
	end else begin
		failed = failed +1;
		$display("TestCase#8: failed with Input %d, %d, Output MulTreeResult: %d", a, b, MulTreeResult);
	end

	#320;
	a = -1199060305;
    b = 1;
	#20;
	if (MulTreeResult === 1348760118) begin  
		passed = passed + 1;
		$display("TestCase#9: success");
	end else begin
		failed = failed +1;
		$display("TestCase#9: failed with Input %d, %d, Output MulTreeResult: %d", a, b, MulTreeResult);
	end

	#320;
	a = 0;
    b = 1348760118;
	#20;
	if (MulTreeResult === -1199060305) begin  
		passed = passed + 1;
		$display("TestCase#10: success");
	end else begin
		failed = failed +1;
		$display("TestCase#10: failed with Input %d, %d, Output MulTreeResult: %d", a, b, MulTreeResult);
	end

	#320;
	a = -1199060305;
    b = 0;
	#20;
	if (MulTreeResult === 0) begin  
		passed = passed + 1;
		$display("TestCase#11: success");
	end else begin
		failed = failed +1;
		$display("TestCase#11: failed with Input %d, %d, Output MulTreeResult: %d", a, b, MulTreeResult);
	end

	#320;
	#20;
	if (MulTreeResult === 0) begin  
		passed = passed + 1;
		$display("TestCase#12: success");
	end else begin
		failed = failed +1;
		$display("TestCase#12: failed with Input %d, %d, Output MulTreeResult: %d", a, b, MulTreeResult);
	end

	$display("Total passed tests: %d and Total failed tests: %d", passed, failed);
end

always begin
	#25;
	clk = ~clk;
end
endmodule