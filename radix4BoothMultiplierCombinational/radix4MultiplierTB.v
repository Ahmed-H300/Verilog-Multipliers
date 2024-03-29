module radix4MultiplierTB;
reg [31:0] a, b;
wire signed [63:0] radix4BoothMultResult;
reg clk, reset, en;
radix4BoothWithRegs radix4BoothWithRegsInst(a, b, clk, reset, en, radix4BoothMultResult);
integer passed, failed;
initial begin
	passed = 0;
	failed = 0;
	clk = 1;
	reset = 1;
	en = 1;
	#50;
	#50;
	reset = 0;
	a = 553524;
    b = 840;
	#50;
	#50;
	if (radix4BoothMultResult === 64'd464960160) begin  
		passed = passed + 1;
		$display("TestCase#1: success");
	end else begin
		failed = failed +1;
		$display("TestCase#1: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	a = 32'h50647236;
    b = 32'h50612336;
	#50;
	#50;
	if (radix4BoothMultResult === 64'h193DE4CED7437964) begin  
		passed = passed + 1;
		$display("TestCase#2: success");
	end else begin
		failed = failed +1;
		$display("TestCase#2: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	a = 553524;
    b = -259;
	#50;
	#50;
	if (radix4BoothMultResult === -143362716) begin 
		passed = passed + 1; 
		$display("TestCase#3: success");
	end else begin
		failed = failed +1;
		$display("TestCase#3: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	a = 32'h50647236;
    b = 32'hB887CAAF;
	#50;
	#50;
	if (radix4BoothMultResult === 64'hE98E647F4142AEEA) begin  
		passed = passed + 1;
		$display("TestCase#4: success");
	end else begin
		failed = failed +1;
		$display("TestCase#4: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	a = -259;
    b = 553524;
	#50;
	#50;
	if (radix4BoothMultResult === -143362716) begin  
		passed = passed + 1;
		$display("TestCase#5: success");
	end else begin
		failed = failed +1;
		$display("TestCase#5: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	a = 32'hB887CAAF;
    b = 32'h50647236;
	#50;
	#50;
	if (radix4BoothMultResult === 64'hFDC57DE4938342EA) begin  
		passed = passed + 1;
		$display("TestCase#6: success");
	end else begin
		failed = failed +1;
		$display("TestCase#6: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	a = -259;
    b = -259;
	#50;
	#50;
	if (radix4BoothMultResult === 67081) begin  
		passed = passed + 1;
		$display("TestCase#7: success");
	end else begin
		failed = failed +1;
		$display("TestCase#7: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	a = 32'hB887CAAF;
    b = 32'h887CAAF3;
	#50;
	#50;
	if (radix4BoothMultResult === 64'h215D8B0A7A419A1D) begin  
		passed = passed + 1;
		$display("TestCase#8: success");
	end else begin
		failed = failed +1;
		$display("TestCase#8: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	a = 1;
    b = 1348760118;
	#50;
	#50;
	if (radix4BoothMultResult === 1348760118) begin  
		passed = passed + 1;
		$display("TestCase#9: success");
	end else begin
		failed = failed +1;
		$display("TestCase#9: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	a = -1199060305;
    b = 1;
	#50;
	#50;
	if (radix4BoothMultResult === -1199060305) begin  
		passed = passed + 1;
		$display("TestCase#10: success");
	end else begin
		failed = failed +1;
		$display("TestCase#10: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	a = 0;
    b = 1348760118;
	#50;
	#50;
	if (radix4BoothMultResult === 0) begin  
		passed = passed + 1;
		$display("TestCase#11: success");
	end else begin
		failed = failed +1;
		$display("TestCase#11: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	a = -1199060305;
    b = 0;
	#50;
	#50;
	if (radix4BoothMultResult === 0) begin  
		passed = passed + 1;
		$display("TestCase#12: success");
	end else begin
		failed = failed +1;
		$display("TestCase#12: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	$display("Total passed tests: %d and Total failed tests: %d", passed, failed);
end
always begin
	#25;
	clk = ~clk;
end
/* initial begin
	passed = 0;
	failed = 0;
	clk = 1;
	reset = 1;
	en = 1;
	#50;
	#50;
	reset = 0;
	a = 5;
    b = -7;
	#50;
	#50;
	if (radix4BoothMultResult === -35) begin  
		passed = passed + 1;
		$display("TestCase#1: success");
	end else begin
		failed = failed +1;
		$display("TestCase#1: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	a = 2;
    b = 3;
	#50;
	#50;
	if (radix4BoothMultResult === 6) begin  
		passed = passed + 1;
		$display("TestCase#2: success");
	end else begin
		failed = failed +1;
		$display("TestCase#2: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	a = -12;
    b = -4;
	#50;
	#50;
	if (radix4BoothMultResult === 48) begin 
		passed = passed + 1; 
		$display("TestCase#3: success");
	end else begin
		failed = failed +1;
		$display("TestCase#3: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	a = -9;
    b = 5;
	#50;
	#50;
	if (radix4BoothMultResult === -45) begin  
		passed = passed + 1;
		$display("TestCase#4: success");
	end else begin
		failed = failed +1;
		$display("TestCase#4: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	a = 11;
    b = 0;
	#50;
	#50;
	if (radix4BoothMultResult === 0) begin  
		passed = passed + 1;
		$display("TestCase#5: success");
	end else begin
		failed = failed +1;
		$display("TestCase#5: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	a = 10;
    b = 1;
	#50;
	#50;
	if (radix4BoothMultResult === 10) begin  
		passed = passed + 1;
		$display("TestCase#6: success");
	end else begin
		failed = failed +1;
		$display("TestCase#6: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	a = 4;
    b = 6;
	#50;
	#50;
	if (radix4BoothMultResult === 24) begin  
		passed = passed + 1;
		$display("TestCase#7: success");
	end else begin
		failed = failed +1;
		$display("TestCase#7: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	a = -1;
    b = -7;
	#50;
	#50;
	if (radix4BoothMultResult === 7) begin  
		passed = passed + 1;
		$display("TestCase#8: success");
	end else begin
		failed = failed +1;
		$display("TestCase#8: failed with Input %d, %d, Output radix4Booth: %d", a, b, radix4BoothMultResult);
	end
	$display("Total passed tests: %d and Total failed tests: %d", passed, failed);
end */
endmodule