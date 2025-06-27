module decodi2(A,Y);
  input [3:0]A;
  output reg [6:0]Y;
  
  always @(A)
    begin
      	if (A == 4'd0) Y = 7'b1100111;
      	else if (A == 4'd1) Y = 7'b1111111;
      	else if (A == 4'd2) Y = 7'b1110000;
      	else if (A == 4'd3) Y = 7'b1011111;
      	else if (A == 4'd4) Y = 7'b1011011;
      	else if (A == 4'd5) Y = 7'b0110011;
      	else if (A == 4'd6) Y = 7'b1111001;
      	else if (A == 4'd7) Y = 7'b1101101;
      	else if (A == 4'd8) Y = 7'b0110000;
      	else if (A == 4'd9) Y = 7'b1111110;
      	else Y = 7'b0000000;
    end	
endmodule 