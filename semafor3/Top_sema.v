module top_semaforo(clk_in, rest, lr, lg, la);

input clk_in, rest;
output lr, lg, la;

wire clk_r, rst;
assign rst = ~rest;

divi r1(
.CLK_OUT(clk_r),
.rst(rst),
.CLK_IN(clk_in)
);

semaforo3 s1(
.clkin(clk_r),
.rst(rst),
.lr(lr),
.lg(lg),
.la(la)
);
endmodule