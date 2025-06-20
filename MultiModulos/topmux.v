module topmux(A1,B1,sell1,Y1);

input [3:0] A1,B1;
input sell1;
output [6:0] Y1;

wire [3:0]con_1;

mux2x1 M1(
.A(A1),
.B(B1),
.sell(sell1),
.out(con_1));

decodi4x6 D1(
.A(con_1),
.Y(Y1));


endmodule 
