`timescale 1ns / 1ps

module semaforo_tb;

    // Señales
    reg  clk;
    reg  rst;
    wire lr;
    wire lg;

    // Instancia del DUT
    smaforo uut (
        .clk(clk),
        .rst(rst),
        .lr(lr),
        .lg(lg)
    );

    // Reloj: periodo 10ns
    initial clk = 0;
    always #5 clk = ~clk;

    // Estímulos
    initial begin
        // Reset
        rst = 1;
        #20;
        rst = 0;

        // Dejar correr dos ciclos completos (16 flancos = 160ns)
        #160;

        $stop;
    end

endmodule
