module SHR(

input [31:0] A, B,
output reg [31:0] shrresult

);

always @(A or B)
	begin
		shrresult = A >> B; 
	end
endmodule
