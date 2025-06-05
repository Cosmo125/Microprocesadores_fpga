module mux(A,B,C,sell,out);
  input [7:0]A,B,C;
	inout [1:0]sell;
	output reg [7:0]out;
	
always @(*)
	begin
	case(sell)
		2'b00 : out = A;
		2'b01 : out = B;
		2'b10 : out = C;
		default : out = 1'bx;
	endcase
	end
endmodule
