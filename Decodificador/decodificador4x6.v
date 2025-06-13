module decodi4x6(A,Y);
  input [3:0]A;
  output reg [5:0]Y;
  
  always @(A)
    begin
      if (A == 4'd0) Y = 15;
      else if (A == 4'd1) Y = 14;
      else if (A == 4'd2) Y = 13;
    	else if (A == 4'd3) Y = 12;
    	else if (A == 4'd4) Y = 11;
    	else if (A == 4'd5) Y = 10;
    	else if (A == 4'd6) Y = 9;
    	else if (A == 4'd7) Y = 8;
    	else if (A == 4'd8) Y = 7;
    	else if (A == 4'd9) Y = 6;
    	else if (A == 4'd10) Y = 5;
    	else if (A == 4'd11) Y = 4;
    	else if (A == 4'd12) Y = 3;
    	else if (A == 4'd13) Y = 2;
    	else if (A == 4'd14) Y = 1;
    	else if (A == 4'd15) Y = 0;
    	else Y = 6'b111111;
    end
endmodule 
