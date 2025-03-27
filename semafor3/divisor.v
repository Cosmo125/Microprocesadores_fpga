module divi(CLK_IN, CLK_OUT, rst);
input CLK_IN, rst;
output reg CLK_OUT;

reg [23:0]contador;

always @(posedge CLK_IN or posedge rst)
begin 
	if(rst) begin
	CLK_OUT <= 0;
	contador <= 0;
	end else if (contador == 13499) begin
	CLK_OUT <= ~CLK_OUT;
	contador <= 0;
	end else
	contador <= contador + 1;
end
endmodule 