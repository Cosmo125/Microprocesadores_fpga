module demux2x1(A,B,sell,out);
    input [6:0]A,B;
	inout sell;
	output reg [6:0]out;
	
always @(*)
	begin
	case(sell)
		1'b1 : out = A;
		1'b0 : out = B;
		default: out = 7'bx;
	endcase
	end
endmodule