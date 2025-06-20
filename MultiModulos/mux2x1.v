module mux2x1(A,B,sell,out);
	input [3:0]A,B;
	inout sell;
	output reg [3:0]out;
	
always @(*)
	begin
	  case(sell)
		  0 : out = A;
		  1 : out = B;
		  default : out = 1'bx;
	  endcase
	end
endmodule 
