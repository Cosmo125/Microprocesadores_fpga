module smaforo(clk, rst, lr, lg);
	input clk, rst;
	output reg lr, lg;
	
	reg [3:0] y;

always @(posedge clk or posedge rst)
begin
	if(rst) begin
	y <= 4'd0;
	end else if (y == 4'd7) begin	
	y <= 4'd0;
	end else
	y <= y + 1;
end

always @(*)
begin
	case(y)
		4'b000: begin lr = 1; lg = 0; end
		4'b001: begin lr = 1; lg = 0; end
		4'b010: begin lr = 1; lg = 0; end
		4'b011: begin lr = 1; lg = 0; end
		4'b100: begin lr = 1; lg = 0; end
		4'b101: begin lr = 0; lg = 1; end
		4'b110: begin lr = 0; lg = 1; end
		4'b111: begin lr = 0; lg = 1; end
		default: begin lr = 1'bx; lg = 1'bx; end
	endcase
end

endmodule 
