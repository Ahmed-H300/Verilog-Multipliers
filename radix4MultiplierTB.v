module radix4MultiplierTB;
reg [31:0] a, b;
wire [63:0] radix4BoothMultResult;
reg clk;
radix4BoothWithRegs radix4BoothWithRegsInst(a, b, clk, radix4BoothMultResult);
integer passed, failed;
initial begin
	passed = 0;
	failed = 0;
	clk = 1;
	a = 5;
    b = -7;
	#100;
	if (radix4BoothMultResult === -35) begin  
		passed = passed + 1;
		$display("TestCase#1: success");
	end else begin
		failed = failed +1;
		$display("TestCase#1: failed with Input %d, %d, Output radix4Booth: %d, Overflow radix4Booth: ", a, b);
	end
	a = 2;
    b = 3;
	#100;
	if (radix4BoothMultResult === 6) begin  
		passed = passed + 1;
		$display("TestCase#2: success");
	end else begin
		failed = failed +1;
		$display("TestCase#2: failed with Input %d, %d, Output radix4Booth: %d, Overflow radix4Booth: ", a, b);
	end
	a = -12;
    b = -4;
	#100;
	if (radix4BoothMultResult === 48) begin 
		passed = passed + 1; 
		$display("TestCase#3: success");
	end else begin
		failed = failed +1;
		$display("TestCase#3: failed with Input %d, %d, Output radix4Booth: %d, Overflow radix4Booth: ", a, b);
	end
	a = -9;
    b = 5;
	#100;
	if (radix4BoothMultResult === -45) begin  
		passed = passed + 1;
		$display("TestCase#4: success");
	end else begin
		failed = failed +1;
		$display("TestCase#4: failed with Input %d, %d, Output radix4Booth: %d, Overflow radix4Booth: ", a, b);
	end
	a = 11;
    b = 0;
	#100;
	if (radix4BoothMultResult === 0) begin  
		passed = passed + 1;
		$display("TestCase#5: success");
	end else begin
		failed = failed +1;
		$display("TestCase#5: failed with Input %d, %d, Output radix4Booth: %d, Overflow radix4Booth: ", a, b);
	end
	a = 10;
    b = 1;
	#100;
	if (radix4BoothMultResult === 10) begin  
		passed = passed + 1;
		$display("TestCase#6: success");
	end else begin
		failed = failed +1;
		$display("TestCase#6: failed with Input %d, %d, Output radix4Booth: %d, Overflow radix4Booth: ", a, b);
	end
	a = 4;
    b = 6;
	#100;
	if (radix4BoothMultResult === 24) begin  
		passed = passed + 1;
		$display("TestCase#7: success");
	end else begin
		failed = failed +1;
		$display("TestCase#7: failed with Input %d, %d, Output radix4Booth: %d, Overflow radix4Booth: ", a, b);
	end
	a = -1;
    b = -7;
	#100;
	if (radix4BoothMultResult === 7) begin  
		passed = passed + 1;
		$display("TestCase#8: success");
	end else begin
		failed = failed +1;
		$display("TestCase#8: failed with Input %d, %d, Output radix4Booth: %d, Overflow radix4Booth: ", a, b);
	end
	$display("Total passed tests: %d and Total failed tests: %d", passed, failed);
end
always begin
	#50;
	clk = ~clk;
end
endmodule