module top_semaforo(clk_in, rest, lr, lg, seg7);

input clk_in, rest;
output lr, lg;
output [6:0] seg7;

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

tiempo t1(
.clk(clk_r),
.rst(rst),
.seg7(seg7)
);
endmodule
