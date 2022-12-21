module boothmultiplierTB;
reg [31:0] a, b;
wire signed [63:0] boothmultiplierResult;
reg clk, reset, en;
boothmultiplier_withregs BMTB(a, b, clk, reset, en, boothmultiplierResult);
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
	#20;
	reset = 0;
	#20;
	#640;
	a = 2;
    b = 3;
	#20;
	if (boothmultiplierResult === -35) begin  
		passed = passed + 1;
		$display("TestCase#1: success");
	end else begin
		failed = failed +1;
		$display("TestCase#1: failed with Input %d, %d, Output boothmultiplier: %d", a, b, boothmultiplierResult);
	end
	#640;
	a = -12;
    b = -4;
	#20;
	if (boothmultiplierResult === 6) begin  
		passed = passed + 1;
		$display("TestCase#2: success");
	end else begin
		failed = failed +1;
		$display("TestCase#2: failed with Input %d, %d, Output boothmultiplier: %d", a, b, boothmultiplierResult);
	end
	#640;
	a = -9;
    b = 5;
	#20;
	if (boothmultiplierResult === 48) begin 
		passed = passed + 1; 
		$display("TestCase#3: success");
	end else begin
		failed = failed +1;
		$display("TestCase#3: failed with Input %d, %d, Output boothmultiplier: %d", a, b, boothmultiplierResult);
	end
	#640;
	a = 11;
    b = 0;
	#20;
	if (boothmultiplierResult === -45) begin  
		passed = passed + 1;
		$display("TestCase#4: success");
	end else begin
		failed = failed +1;
		$display("TestCase#4: failed with Input %d, %d, Output boothmultiplier: %d", a, b, boothmultiplierResult);
	end
	#640;
	a = 10;
    b = 1;
	#20;
	if (boothmultiplierResult === 0) begin  
		passed = passed + 1;
		$display("TestCase#5: success");
	end else begin
		failed = failed +1;
		$display("TestCase#5: failed with Input %d, %d, Output boothmultiplier: %d", a, b, boothmultiplierResult);
	end
	#640;
	a = 4;
    b = 6;
	#20;
	if (boothmultiplierResult === 10) begin  
		passed = passed + 1;
		$display("TestCase#6: success");
	end else begin
		failed = failed +1;
		$display("TestCase#6: failed with Input %d, %d, Output boothmultiplier: %d", a, b, boothmultiplierResult);
	end
	#640;
	a = -1;
    b = -7;
	#20;
	if (boothmultiplierResult === 24) begin  
		passed = passed + 1;
		$display("TestCase#7: success");
	end else begin
		failed = failed +1;
		$display("TestCase#7: failed with Input %d, %d, Output boothmultiplier: %d", a, b, boothmultiplierResult);
	end
	#640;
	#20;
	if (boothmultiplierResult === 7) begin  
		passed = passed + 1;
		$display("TestCase#8: success");
	end else begin
		failed = failed +1;
		$display("TestCase#8: failed with Input %d, %d, Output boothmultiplier: %d", a, b, boothmultiplierResult);
	end
	$display("Total passed tests: %d and Total failed tests: %d", passed, failed);
end
always begin
	#10;
	clk = ~clk;
end
endmodule

