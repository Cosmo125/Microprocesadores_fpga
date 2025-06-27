module mux1x2(A,sell,y1,y2);
    input [3:0]A;
	inout sell;
	output reg [3:0]y1,y2;
	
always @(*)
	begin
	case(sell)
		1'b1 : begin
			y1 = A;
			y2 = 4'bz;
		end
		1'b0 : begin
			y2 = A;
			y1 = 4'bz;
		end
		default: begin 
			y1 = 4'bx; 
			y2 = 4'bx;
		end
	endcase
	end
endmodule