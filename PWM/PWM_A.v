module pwm_1khz_duty_static (rst, clk, pwm_out);

input clk, rst;
output reg pwm_out;

parameter MAX_COUNT = 27000;       // 1 ms = 27000 ciclos a 27MHz

// CAMBIA ESTE VALOR PARA VARIAR EL DUTY CYCLE
parameter DUTY_CYCLE = 7000;      // 50% de 27000 → puedes cambiar este número
wire rest;
assign rest = ~rst;
reg [14:0] counter;


always @(posedge clk or posedge rest) 
begin
    if (rest)
        counter <= 15'd0;
    else if (counter >= MAX_COUNT - 1)
        counter <= 15'd0;
    else
        counter <= counter + 1;
end

always @(posedge clk) 
begin
    pwm_out <= (counter < DUTY_CYCLE) ? 1'b1 : 1'b0;
end

endmodule
