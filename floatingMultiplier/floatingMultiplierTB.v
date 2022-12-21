module floatingMultiplierTB;
reg [31:0] a, b;
wire [31:0] floatingPointResult;
wire overflowFloatingPoint, exceptionFloatingPoint;
reg clk, reset, en;
floatingMultiplierWithRegs floatingMultiplierWithRegsInst(a, b, clk, reset, en, floatingPointResult, overflowFloatingPoint, exceptionFloatingPoint);
integer passed, failed;
initial begin
	clk = 1;
	passed = 0;
	failed = 0;
	reset = 1;
	en = 1;
	#50;
	#50;
	reset = 0;
	a = 32'b01000000101001000000000000000000; // 5.125
    b = 32'b11000000111100000000000000000000; // -7.5
	#50;
	#50;
	if (floatingPointResult === 32'b11000010000110011100000000000000) begin  // -38.4375
		passed = passed + 1;
		$display("TestCase#1: success");
	end else begin
		failed = failed +1;
		$display("TestCase#1: failed with Input %f, %f, Output floatingPointResult: %f, Overflow Floating Multiplier: %b, Exception Floating Multiplier: %b", a, b, floatingPointResult, overflowFloatingPoint, exceptionFloatingPoint);
	end
	a = 32'b01000000000000000000000000000000; // 2.0
    b = 32'b01000000011100000000000000000000; // 3.75
	#50;
	#50;
	if (floatingPointResult === 32'b01000000111100000000000000000000) begin  // 7.5
		passed = passed + 1;
		$display("TestCase#2: success");
	end else begin
		failed = failed +1;
		$display("TestCase#2: failed with Input %f, %f, Output floatingPointResult: %f, Overflow Floating Multiplier: %b, Exception Floating Multiplier: %b", a, b, floatingPointResult, overflowFloatingPoint, exceptionFloatingPoint);
	end
	a = 32'b11000001010001000000000000000000; // -12.25
    b = 32'b11000000100100000000000000000000; // -4.5
	#50;
	#50;
	if (floatingPointResult === 32'b01000010010111001000000000000000) begin  // 55.125
		passed = passed + 1; 
		$display("TestCase#3: success");
	end else begin
		failed = failed +1;
		$display("TestCase#3: failed with Input %f, %f, Output floatingPointResult: %f, Overflow Floating Multiplier: %b, Exception Floating Multiplier: %b", a, b, floatingPointResult, overflowFloatingPoint, exceptionFloatingPoint);
	end
	a = 32'b11000001000100000000000000000000; // -9.0
    b = 32'b01000000101000100000000000000000; // 5.0625
	#50;
	#50;
	if (floatingPointResult === 32'b11000010001101100100000000000000) begin  // -45.5625
		passed = passed + 1;
		$display("TestCase#4: success");
	end else begin
		failed = failed +1;
		$display("TestCase#4: failed with Input %f, %f, Output floatingPointResult: %f, Overflow Floating Multiplier: %b, Exception Floating Multiplier: %b", a, b, floatingPointResult, overflowFloatingPoint, exceptionFloatingPoint);
	end
	a = 32'b00111101000000000000000000000000; // 0.03125
    b = 0;
	#50;
	#50;
	if (floatingPointResult === 0) begin  
		passed = passed + 1;
		$display("TestCase#5: success");
	end else begin
		failed = failed +1;
		$display("TestCase#5: failed with Input %f, %f, Output floatingPointResult: %f, Overflow Floating Multiplier: %b, Exception Floating Multiplier: %b", a, b, floatingPointResult, overflowFloatingPoint, exceptionFloatingPoint);
	end
	a = 32'b00111101000000000000000000000000; // 0.03125
    b = 32'b00111111100000000000000000000000;
	#50;
	#50;
	if (floatingPointResult === 32'b00111101000000000000000000000000) begin  // 0.03125
		passed = passed + 1;
		$display("TestCase#6: success");
	end else begin
		failed = failed +1;
		$display("TestCase#6: failed with Input %f, %f, Output floatingPointResult: %f, Overflow Floating Multiplier: %b, Exception Floating Multiplier: %b", a, b, floatingPointResult, overflowFloatingPoint, exceptionFloatingPoint);
	end
	a = 32'b00111100100000000000000000000000; // 0.015625
    b = 32'b01000010110010000000000000000000; // 100
	#50;
	#50;
	if (floatingPointResult === 32'b00111111110010000000000000000000) begin  // 1.5625
		passed = passed + 1;
		$display("TestCase#7: success");
	end else begin
		failed = failed +1;
		$display("TestCase#7: failed with Input %f, %f, Output floatingPointResult: %f, Overflow Floating Multiplier: %b, Exception Floating Multiplier: %b", a, b, floatingPointResult, overflowFloatingPoint, exceptionFloatingPoint);
	end
	a = 32'b10111111100000000000000000000000; // -1
    b = 32'b11000000111000000000000000000000; // -7
	#50;
	#50;
	if (floatingPointResult === 32'b01000000111000000000000000000000) begin  // 7 
		passed = passed + 1;
		$display("TestCase#8: success");
	end else begin
		failed = failed +1;
		$display("TestCase#8: failed with Input %f, %f, Output floatingPointResult: %f, Overflow Floating Multiplier: %b, Exception Floating Multiplier: %b", a, b, floatingPointResult, overflowFloatingPoint, exceptionFloatingPoint);
	end
	$display("Total passed tests: %d and Total failed tests: %d", passed, failed);
end
always begin
	#25;
	clk = ~clk;
end
endmodule