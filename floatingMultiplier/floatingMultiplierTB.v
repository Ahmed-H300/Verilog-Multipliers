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
	a = 32'h49072340;
    b = 32'h44520000; 
	#50;
	#50;
	if (floatingPointResult === 32'h4DDDB5D5) begin
		passed = passed + 1;
		$display("TestCase#1: success");
	end else begin
		failed = failed +1;
		$display("TestCase#1: failed with Input %f, %f, Output floatingPointResult: %f, Overflow Floating Multiplier: %b, Exception Floating Multiplier: %b", a, b, floatingPointResult, overflowFloatingPoint, exceptionFloatingPoint);
	end
	a = 32'h4EA0C8E4;
    b = 32'h4EA0C246; 
	#50;
	#50;
	if (floatingPointResult === 32'h5DC9EF25) begin
		passed = passed + 1;
		$display("TestCase#2: success");
	end else begin
		failed = failed +1;
		$display("TestCase#2: failed with Input %f, %f, Output floatingPointResult: %f, Overflow Floating Multiplier: %b, Exception Floating Multiplier: %b", a, b, floatingPointResult, overflowFloatingPoint, exceptionFloatingPoint);
	end
	a = 32'h49072340;
    b = 32'hC3818000; 
	#50;
	#50;
	if (floatingPointResult === 32'hCD08B8A9) begin
		passed = passed + 1; 
		$display("TestCase#3: success");
	end else begin
		failed = failed +1;
		$display("TestCase#3: failed with Input %f, %f, Output floatingPointResult: %f, Overflow Floating Multiplier: %b, Exception Floating Multiplier: %b", a, b, floatingPointResult, overflowFloatingPoint, exceptionFloatingPoint);
	end
	a = 32'h4EA0C8E4;
    b = 32'hCE8EF06B; 
	#50;
	#50;
	if (floatingPointResult === 32'hDDB38CDC) begin
		passed = passed + 1;
		$display("TestCase#4: success");
	end else begin
		failed = failed +1;
		$display("TestCase#4: failed with Input %f, %f, Output floatingPointResult: %f, Overflow Floating Multiplier: %b, Exception Floating Multiplier: %b", a, b, floatingPointResult, overflowFloatingPoint, exceptionFloatingPoint);
	end
	a = 32'hC3818000;
    b = 32'h49072340; 
	#50;
	#50;
	if (floatingPointResult === 32'hCD08B8A9) begin
		passed = passed + 1;
		$display("TestCase#5: success");
	end else begin
		failed = failed +1;
		$display("TestCase#5: failed with Input %f, %f, Output floatingPointResult: %f, Overflow Floating Multiplier: %b, Exception Floating Multiplier: %b", a, b, floatingPointResult, overflowFloatingPoint, exceptionFloatingPoint);
	end
	a = 32'hCE8EF06B;
    b = 32'h4EA0C8E4; 
	#50;
	#50;
	if (floatingPointResult === 32'hDDB38CDC) begin
		passed = passed + 1;
		$display("TestCase#6: success");
	end else begin
		failed = failed +1;
		$display("TestCase#6: failed with Input %f, %f, Output floatingPointResult: %f, Overflow Floating Multiplier: %b, Exception Floating Multiplier: %b", a, b, floatingPointResult, overflowFloatingPoint, exceptionFloatingPoint);
	end
	a = 32'hC3818000;
    b = 32'hC3818000; 
	#50;
	#50;
	if (floatingPointResult === 32'h47830480) begin
		passed = passed + 1;
		$display("TestCase#7: success");
	end else begin
		failed = failed +1;
		$display("TestCase#7: failed with Input %f, %f, Output floatingPointResult: %f, Overflow Floating Multiplier: %b, Exception Floating Multiplier: %b", a, b, floatingPointResult, overflowFloatingPoint, exceptionFloatingPoint);
	end
	a = 32'hCE8EF06B;
    b = 32'hCEEF06AA; 
	#50;
	#50;
	if (floatingPointResult === 32'h5E05762C) begin 
		passed = passed + 1;
		$display("TestCase#8: success");
	end else begin
		failed = failed +1;
		$display("TestCase#8: failed with Input %f, %f, Output floatingPointResult: %f, Overflow Floating Multiplier: %b, Exception Floating Multiplier: %b", a, b, floatingPointResult, overflowFloatingPoint, exceptionFloatingPoint);
	end
	a = 32'h3F800000;
    b = 32'h4EA0C8E4; 
	#50;
	#50;
	if (floatingPointResult === 32'h4EA0C8E4) begin 
		passed = passed + 1;
		$display("TestCase#9: success");
	end else begin
		failed = failed +1;
		$display("TestCase#9: failed with Input %f, %f, Output floatingPointResult: %f, Overflow Floating Multiplier: %b, Exception Floating Multiplier: %b", a, b, floatingPointResult, overflowFloatingPoint, exceptionFloatingPoint);
	end
	a = 32'hCE8EF06B;
    b = 32'h3F800000; 
	#50;
	#50;
	if (floatingPointResult === 32'hCE8EF06B) begin 
		passed = passed + 1;
		$display("TestCase#10: success");
	end else begin
		failed = failed +1;
		$display("TestCase#10: failed with Input %f, %f, Output floatingPointResult: %f, Overflow Floating Multiplier: %b, Exception Floating Multiplier: %b", a, b, floatingPointResult, overflowFloatingPoint, exceptionFloatingPoint);
	end
	a = 0;
    b = 32'h4EA0C8E4; 
	#50;
	#50;
	if (floatingPointResult === 0) begin 
		passed = passed + 1;
		$display("TestCase#11: success");
	end else begin
		failed = failed +1;
		$display("TestCase#11: failed with Input %f, %f, Output floatingPointResult: %f, Overflow Floating Multiplier: %b, Exception Floating Multiplier: %b", a, b, floatingPointResult, overflowFloatingPoint, exceptionFloatingPoint);
	end
	a = 32'hCE8EF06B;
    b = 0; 
	#50;
	#50;
	if (floatingPointResult === 0) begin 
		passed = passed + 1;
		$display("TestCase#12: success");
	end else begin
		failed = failed +1;
		$display("TestCase#12: failed with Input %f, %f, Output floatingPointResult: %f, Overflow Floating Multiplier: %b, Exception Floating Multiplier: %b", a, b, floatingPointResult, overflowFloatingPoint, exceptionFloatingPoint);
	end
	a = 32'h3FFFFFF0;
    b = 32'h41A00000; 
	#50;
	#50;
	if (floatingPointResult === 32'b01111111100000000000000000000000) begin  // overflow = 1, sign = 0
		passed = passed + 1;
		$display("TestCase#13: success");
	end else begin
		failed = failed +1;
		$display("TestCase#13: failed with Input %f, %f, Output floatingPointResult: %f, Overflow Floating Multiplier: %b, Exception Floating Multiplier: %b", a, b, floatingPointResult, overflowFloatingPoint, exceptionFloatingPoint);
	end
	a = 32'hBFFFFFFF;
    b = 32'h41A00000; 
	#50;
	#50;
	if (floatingPointResult === 32'b11111111100000000000000000000000) begin // overflow = 1, sign = 1
		passed = passed + 1;
		$display("TestCase#14: success");
	end else begin
		failed = failed +1;
		$display("TestCase#14: failed with Input %f, %f, Output floatingPointResult: %f, Overflow Floating Multiplier: %b, Exception Floating Multiplier: %b", a, b, floatingPointResult, overflowFloatingPoint, exceptionFloatingPoint);
	end
	a = 32'h35D00998;
    b = 32'h800000; 
	#50;
	#50;
	if (floatingPointResult === 32'h0000000D) begin 
		passed = passed + 1;
		$display("TestCase#15: success");
	end else begin
		failed = failed +1;
		$display("TestCase#15: failed with Input %f, %f, Output floatingPointResult: %f, Overflow Floating Multiplier: %b, Exception Floating Multiplier: %b", a, b, floatingPointResult, overflowFloatingPoint, exceptionFloatingPoint);
	end
	$display("Total passed tests: %d and Total failed tests: %d", passed, failed);
end
always begin
	#25;
	clk = ~clk;
end
/* initial begin
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
end */
endmodule