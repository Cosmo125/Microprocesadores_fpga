module rom_7seg (
    input  wire clk,
    input  wire [3:0] addr,       // dirección: 0-9 (dígito a mostrar)
    output reg  [6:0] data_out    // segmentos: {g,f,e,d,c,b,a}
);

    reg [6:0] mem [0:15];

    initial begin
        $readmemh("rom_7seg.mem", mem);//mh para hx, mb para bits
    end

    always @(posedge clk) begin
        data_out <= mem[addr];
    end

endmodule