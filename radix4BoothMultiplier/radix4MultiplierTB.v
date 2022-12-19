module radix4MultiplierTB;
reg [31:0] a, b;
wire signed [63:0] radix4BoothMultResult;
reg clk, reset, resetIntegration, en;
radix4BoothWithRegs radix4BoothWithRegsInst(a, b, clk, reset, resetIntegration, en, radix4BoothMultResult);
integer passed, failed;
initial begin
	// Clock cycle time = 20
	passed = 0;
	failed = 0;
	clk = 0;
	en = 1;
	a = 5;
    b = -7;
	reset = 1;
	resetIntegration = 1;
	#20;
	reset = 0;
	resetIntegration = 0;
	#340;
	if (radix4BoothMultResult === -35) begin  
		passed = passed + 1;
		$display("TestCase#1: success");
	end else begin
		failed = failed +1;
		$display("TestCase#1: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	a = 2;
    b = 3;
	reset = 1;
	#20;
	reset = 0;
	#340;
	if (radix4BoothMultResult === 6) begin  
		passed = passed + 1;
		$display("TestCase#2: success");
	end else begin
		failed = failed +1;
		$display("TestCase#2: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	a = -12;
    b = -4;
	reset = 1;
	#20;
	reset = 0;
	#340;
	if (radix4BoothMultResult === 48) begin 
		passed = passed + 1; 
		$display("TestCase#3: success");
	end else begin
		failed = failed +1;
		$display("TestCase#3: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	a = -9;
    b = 5;
	reset = 1;
	#20;
	reset = 0;
	#340;
	if (radix4BoothMultResult === -45) begin  
		passed = passed + 1;
		$display("TestCase#4: success");
	end else begin
		failed = failed +1;
		$display("TestCase#4: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	a = 11;
    b = 0;
	reset = 1;
	#20;
	reset = 0;
	#340;
	if (radix4BoothMultResult === 0) begin  
		passed = passed + 1;
		$display("TestCase#5: success");
	end else begin
		failed = failed +1;
		$display("TestCase#5: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	a = 10;
    b = 1;
	reset = 1;
	#20;
	reset = 0;
	#340;
	if (radix4BoothMultResult === 10) begin  
		passed = passed + 1;
		$display("TestCase#6: success");
	end else begin
		failed = failed +1;
		$display("TestCase#6: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	a = 4;
    b = 6;
	reset = 1;
	#20;
	reset = 0;
	#340;
	if (radix4BoothMultResult === 24) begin  
		passed = passed + 1;
		$display("TestCase#7: success");
	end else begin
		failed = failed +1;
		$display("TestCase#7: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	a = -1;
    b = -7;
	reset = 1;
	#20;
	reset = 0;
	#340;
	if (radix4BoothMultResult === 7) begin  
		passed = passed + 1;
		$display("TestCase#8: success");
	end else begin
		failed = failed +1;
		$display("TestCase#8: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	$display("Total passed tests: %d and Total failed tests: %d", passed, failed);
end
always begin
	#10;
	clk = ~clk;
end
endmodule