module tb_ram_4x4;

    reg clk;
    reg we;
    reg [1:0] addr;
    reg [3:0] data_in;
    wire [3:0] data_out;

    ram_4x4 uut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        we = 0;
        addr = 0;
        data_in = 4'b0000;

        // Escribir 1010 en dirección 1
        @(posedge clk); #1;
        addr = 2'd1;
        data_in = 4'b1010;
        we = 1;

        @(posedge clk); #1;
        we = 0;

        // Leer dirección 1 (debe mostrar 1010)
        @(posedge clk); #1;
        addr = 2'd1;

        // Escribir 0110 en dirección 2
        @(posedge clk); #1;
        addr = 2'd2;
        data_in = 4'b0110;
        we = 1;

        @(posedge clk); #1;
        we = 0;

        // Leer dirección 2 (debe mostrar 0110)
        @(posedge clk); #1;
        addr = 2'd2;

        // Leer dirección 0 (debe estar en 0000, no escrita)
        @(posedge clk); #1;
        addr = 2'd0;

        // Leer dirección 3 (debe estar en 0000, no escrita)
        @(posedge clk); #1;
        addr = 2'd3;

        $stop;
    end

endmodule
