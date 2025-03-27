module semaforo3(clkin, rst, lr, la, lg);
input clkin, rst;
output reg lr, la, lg;

reg [3:0] y;

always @(posedge clkin or posedge rst)
begin
	if (rst) begin
		y <= 0;
	end else if (y == 9) begin
		y <= 0;
	end else
		y <= y + 1;
end

always @(y)
begin
	case(y)
	4'b0000: begin lr = 1; la = 0; lg = 0; end
	4'b0001: begin lr = 1; la = 0; lg = 0; end
	4'b0010: begin lr = 1; la = 0; lg = 0; end
	4'b0011: begin lr = 1; la = 0; lg = 0; end
	4'b0100: begin lr = 1; la = 0; lg = 0; end
	4'b0101: begin lr = 0; la = 1; lg = 0; end
	4'b0110: begin lr = 0; la = 1; lg = 0; end
	4'b0111: begin lr = 0; la = 0; lg = 1; end
	4'b1000: begin lr = 0; la = 0; lg = 1; end
	4'b1001: begin lr = 0; la = 0; lg = 1; end
	default: begin lr = 0; la = 0; lg = 0; end
	endcase
end
	
endmodule