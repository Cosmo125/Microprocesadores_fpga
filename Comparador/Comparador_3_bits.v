module comparador(A,B,F);
input [2:0]A;
input [2:0]B;
output [2:0]F;

assign F =(A > B)? 3'b001:
	(A == B)? 3'b010:
	(A < B)? 3'b100:3'b000;
endmodule
