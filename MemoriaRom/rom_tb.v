`timescale 1ns/1ps

module tb_rom_7seg;

    reg clk;
    reg [3:0] addr;
    wire [6:0] data_out;

    // Instancia del DUT (Device Under Test)
    rom_7seg uut (
        .clk(clk),
        .addr(addr),
        .data_out(data_out)
    );

    // Generación de reloj: periodo de 20ns (50MHz aprox)
    always #10 clk = ~clk;

    initial begin
        clk = 0;
        addr = 0;

        #5;

        @(posedge clk); 
        addr = 1;

        @(posedge clk); 
        addr = 2;

        @(posedge clk); 
        addr = 3;

        @(posedge clk); 
        addr = 4;

        @(posedge clk); 
        addr = 5;

        @(posedge clk);
        addr = 6;

        @(posedge clk);
        addr = 7;

        @(posedge clk);
        addr = 8;

        @(posedge clk); 
        addr = 9;

        @(posedge clk); 

        #20;
        $stop;

    end

endmodule