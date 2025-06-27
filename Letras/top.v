module topA(A1, sell, Y1);
    input [3:0]A1;
    input sell;
    output [6:0]Y1;
    wire[3:0]con1, con2;
    wire [6:0]con3, con4; 

mux1x2 m1(
    .A(A1),
    .sell(sell),
    .y1(con1),
    .y2(con2)
);
decodi1 d1(
    .A(con1),
    .Y(con3)
);
decodi2 d2(
    .A(con2),
    .Y(con4)
);
demux2x1 d3(
    .A(con3),
    .B(con4),
    .sell(sell),
    .out(Y1)
);

endmodule 
