module ALU(
	input [4:0] opcode,
	input [31:0] A, B,
	output reg [63:0] Zin
);


wire [31:0] addresult, andresult, orresult, notresult, negresult, rorresult, rolresult, shlresult, shrresult, shraresult, subresult;

wire [63:0] mulresult, divresult;


ADD addinst(A, B, addresult);
AND andinst(A, B, andresult);
OR orinst(A, B, orresult);
NOT notinst(A, notresult);
NEG neginst(A, negresult);
MUL mulinst(A, B, mulresult);
ROR rorinst(A, B, rorresult);
ROL rolinst(A, B, rolresult);
SHL shlinst(A, B, shlresult);
SHR shrinst(A, B, shrresult);
SHRA shrainst(A, B, shraresult);
SUB subinst(A, B, subresult);
DIV divinst(A, B, divresult);

always @(*) begin

	case(opcode)
		
		5'b01100: Zin = addresult;
		5'b01010: Zin = andresult; 
		5'b01011: Zin = orresult;
		5'b10010: Zin = notresult;
		5'b10001: Zin = negresult;
		5'b01111: Zin = mulresult;
		5'b01000: Zin = rorresult;
		5'b01001: Zin = rolresult;
		5'b00111: Zin = shlresult;
		5'b00101: Zin = shrresult;
		5'b00110: Zin = shraresult;
		5'b00001: Zin = divresult;
		5'b00100: Zin = subresult;
		default: Zin = 32'b0; // A default value for Zin when none of the cases match
		
		endcase 
		
end

endmodule
