module ram_4x4 (
    input wire clk,
    input wire we,              // Write enable (DIP switch o botón)
    input wire [1:0] addr,      // Dirección (2 DIP switches, 0-3)
    input wire [3:0] data_in,   // Dato a escribir (4 DIP switches)
    output reg [3:0] data_out   // Salida hacia los 4 LEDs
);

    // Memoria de 4 posiciones x 4 bits
    reg [3:0] mem [0:3];

    integer i;
    initial begin
        for (i = 0; i < 4; i = i + 1)
            mem[i] = 4'b0000;
    end

    always @(posedge clk) begin
        if (we)
            mem[addr] <= data_in;   // Escritura
        data_out <= mem[addr];      // Lectura
    end

endmodule
