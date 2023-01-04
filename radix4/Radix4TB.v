
module Radix4TB;

	// Inputs
	reg start;
	reg clk=0;
	reg [31:0] en1;
	reg [31:0] en2;

	// Outputs
	wire [63:0] out;
	integer count_failure = 0, count_success = 0;

	Radix4 mult (
		.start(start), 
		.clk(clk), 
		.inputA(en1), 
		.inputB(en2), 
		.out(out)
	);
always begin #1 clk = ~ clk ;end  //clock
	initial begin
		// +ve * +ve
		start = 1;
		en1 = 32'd553524;
		en2 = 32'd840; //result = 14
		#5 
								start =0;
								#100

								if(out != 64'd464960160)begin
					$display("TestCase#1: failed %d , %d %d", en1 , en2 , out);
					count_failure = count_failure +1;
								end
					else begin
								$display("TestCase#1: success %d , %d %d", en1 , en2 , out);                
					count_success= count_success+1;
					end
								// -ve * +ve
		
								start = 1;
					en1 = 32'd1348760118;
					en2 = 32'd1348543286; //result = -21
		#5 
								start = 0;
								#100 

								if(out != 64'd1818861401553467748)
begin
					$display("TestCase#2: failed %d , %d %d", en1 , en2 , out);
					count_failure = count_failure +1;
								end
					else begin
								$display("TestCase#2: success %d , %d %d", en1 , en2 , out);                
					count_success= count_success+1;
					end

								// 0 * -ve
		
								start = 1;
					en1 = 32'd553524;
					en2 = -32'd259; //result = 0
		#5 
								start =0;
								#100 

								if(out != -64'd143362716)
begin
					$display("TestCase#3: failed %d , %d %d", en1 , en2 , out);
					count_failure = count_failure +1;
								end
					else begin
								$display("TestCase#3: success %d , %d %d", en1 , en2 , out);                
					count_success= count_success+1;
					end               

								// +ve * -ve
								start = 1;
					en1 = 32'd1348760118;
					en2 = -32'd1199060305; //result = -200
		#5 
								start =0;
								#100 

								if(out != -64'd1617244718460915990)
begin
					$display("TestCase#4: failed %d , %d %d", en1 , en2 , out);
					count_failure = count_failure +1;
								end
					else begin
								$display("TestCase#4: success %d , %d %d", en1 , en2 , out);                
					count_success= count_success+1;
					end  

								// -ve * 0
		
								start = 1;
					en1 = -32'd259;
					en2 = 32'd553524; //result = 0
		#5 
								start =0;  
								#100 

								if(out != -64'd143362716)
begin
					$display("TestCase#5: failed %d , %d %d", en1 , en2 , out);
					count_failure = count_failure +1;
								end
					else begin
								$display("TestCase#5: success %d , %d %d", en1 , en2 , out);                
					count_success= count_success+1;
					end            

								// -ve * -ve
		
								start = 1;
					en1 = -32'd2;
					en2 = -32'd2; //result = 2
		#5 
								start =0;
								#100 

								if(out != 64'd4)
begin
					$display("TestCase#6: failed %d , %d %d", en1 , en2 , out);
					count_failure = count_failure +1;
								end
					else begin
								$display("TestCase#6: success %d , %d %d", en1 , en2 , out);                
					count_success= count_success+1;
					end

								// 0 * +ve
								
								start = 1;
					en1 = -32'd1199060305;
					en2 = 32'd1348760118; //result = 0
		#5 
								start = 0;
								#100 

								if(out != -64'd1617244718460915990)
begin
					$display("TestCase#7: failed %d , %d %d", en1 , en2 , out);
					count_failure = count_failure +1;
								end
					else begin
								$display("TestCase#7: success %d , %d %d", en1 , en2 , out);                
					count_success= count_success+1;
					end
								// +ve * 0
								
								start = 1;
					en1 = 32'd5;
					en2 = 32'd0; //result = 0
		#5 
								start = 0;    
								#100 

								if(out != 64'd0)
begin
					$display("TestCase#8: failed %d , %d %d", en1 , en2 , out);
					count_failure = count_failure +1;
								end
					else begin
								$display("TestCase#8: success %d , %d %d", en1 , en2 , out);                
					count_success= count_success+1;
					end               

								// -ve * +ve
								
								start = 1;
					en1 = -32'd259;
					en2 = -32'd259; //result = -57
		#5 
								start = 0;
								#100 

								if(out != 64'd67081)
begin
					$display("TestCase#9: failed %d , %d %d", en1 , en2 , out);
					count_failure = count_failure +1;
								end
					else begin
								$display("TestCase#9: success %d , %d %d", en1 , en2 , out);                
					count_success= count_success+1;
					end
								// +ve * -ve
								
								start = 1;
					en1 = -32'd1199060305;
					en2 = -32'd2005095693; //result = -250 
		#5 
								start = 0;     
								#100 

								if(out != 64'd2404230653202766365)
begin
					$display("TestCase#10: failed %d , %d %d", en1 , en2 , out);
					count_failure = count_failure +1;
								end
					else begin
								$display("TestCase#10: success %d , %d %d", en1 , en2 , out);                
					count_success= count_success+1;
					end
				// +ve * +ve
								
								start = 1;
					en1 = 32'd1;
					en2 = 32'd1348760118; //result =10
		#5 
								start = 0;     
								#100 

								if(out != 64'd1348760118)
begin
					$display("TestCase#11: failed %d , %d %d", en1 , en2 , out);
					count_failure = count_failure +1;
								end
					else begin
								$display("TestCase#11: success %d , %d %d", en1 , en2 , out);                
					count_success= count_success+1;
					end
		
				// +ve * +ve
								
								start = 1;
					en1 = -32'd1199060305;
					en2 = 32'd1; //result =10
		#5 
								start = 0;     
								#100 

								if(out != -64'd1199060305)
begin
					$display("TestCase#12: failed %d , %d %d", en1 , en2 , out);
					count_failure = count_failure +1;
								end
					else begin
								$display("TestCase#12: success %d , %d %d", en1 , en2 , out);                
					count_success= count_success+1;
					end
		
		
				// +ve * +ve
								
								start = 1;
					en1 = 32'd0;
					en2 = 32'd1348760118; //result =10
		#5 
								start = 0;     
								#100 

								if(out != 64'd0)
begin
					$display("TestCase#13: failed %d , %d %d", en1 , en2 , out);
					count_failure = count_failure +1;
								end
					else begin
								$display("TestCase#13: success %d , %d %d", en1 , en2 , out);                
					count_success= count_success+1;
					end
		
				// +ve * +ve
								
								start = 1;
					en1 = -32'd1199060305;
					en2 = 32'd0; //result =10
		#5 
								start = 0;     
								#100 

								if(out != 64'd0)
begin
					$display("TestCase#14: failed %d , %d %d", en1 , en2 , out);
					count_failure = count_failure +1;
								end
					else begin
								$display("TestCase#14: success %d , %d %d", en1 , en2 , out);                
					count_success= count_success+1;
					end
		
		$display("Total number of Success: %0d", count_success);
		$display("Total number of Failure: %0d", count_failure);

	end
			
endmodule

