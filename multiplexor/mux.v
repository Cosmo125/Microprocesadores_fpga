module mux(A,B,C,sell,out);
	input [7:0]A,B,C;
	input [1:0]sell;
	output reg [7:0]out;
	
always @(*)
	begin
	case(sell)
		8'b00000001 : out = A;
		8'b00000001 : out = B;
		8'b10000000 : out = C;
		default : out = 8'bx;
	endcase
	end
endmodule
