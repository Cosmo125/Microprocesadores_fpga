module top_semaforo(clk_in, rest, lr, lg);

input clk_in, rest;
output lr, lg;

wire clk_r, rst;
assign rst = ~rest;

divi r1(
.CLK_OUT(clk_r),
.rst(rst),
.CLK_IN(clk_in)
);

smaforo s1(
.clk(clk_r),
.rst(rst),
.lr(lr),
.lg(lg)
);
endmodule