module tiempo(clk, rst, seg7);
	input clk, rst;
	output reg [6:0]seg7;
	
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
		4'd0: seg7 = 7'b1111110;
            	4'd1: seg7 = 7'b0110000;
            	4'd2: seg7 = 7'b1101101;
            	4'd3: seg7 = 7'b1111001;
            	4'd4: seg7 = 7'b0110011;
            	4'd5: seg7 = 7'b1011011;
            	4'd6: seg7 = 7'b1011111;
            	4'd7: seg7 = 7'b1110000;
            	4'd8: seg7 = 7'b1111111;
            	4'd9: seg7 = 7'b1111011;
            	default: seg7 = 7'b0000000;
	endcase
end

endmodule 
