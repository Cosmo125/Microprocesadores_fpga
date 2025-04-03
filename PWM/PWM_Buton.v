module pwm_1khz_duty_static (rst, clk, pwm_out, bar);

input clk, rst, bar;
output reg pwm_out;

parameter MAX_COUNT = 27000;       // 1 ms = 27000 ciclos a 27MHz

wire rest;
assign rest = ~rst;

reg [14:0] counter;
reg [14:0] DUTY_CYCLE;   


always @(posedge clk or posedge rest) 
begin
    if (rest)
        counter <= 15'd0;
    else if (counter >= MAX_COUNT - 1)
        counter <= 15'd0;
    else
        counter <= counter + 1;
end

always @(*)
begin  
    if (bar)
       DUTY_CYCLE = 15'd7000;
    else 
       DUTY_CYCLE = 15'd27000;

end
    

always @(posedge clk) 
begin
    pwm_out <= (counter < DUTY_CYCLE) ? 1'b1 : 1'b0;
end

endmodule
