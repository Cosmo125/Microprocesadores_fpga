//-----------------------------------------------------------------------------
// Module: divi
// Description: Frequency Divider
// 
// This module divides the input clock frequency by toggling the output clock
// (CLK_OUT) every 13,500,000 input clock cycles. It includes a synchronous
// reset (rst) that initializes the output and counter.
//
// Ports:
//   - CLK_IN  : Input clock signal.
//   - rst     : Asynchronous reset signal. When high, resets the counter and output.
//   - CLK_OUT : Output clock signal, toggles after the specified count.
//
// Internal Signals:
//   - contador [23:0]: 24-bit counter used to count input clock cycles.
//
// Operation:
//   - On each rising edge of CLK_IN or when rst is asserted:
//       * If rst is high, reset CLK_OUT and contador to 0.
//       * If contador reaches 13,499,999, toggle CLK_OUT and reset contador.
//       * Otherwise, increment contador by 1.
//-----------------------------------------------------------------------------
module divi(CLK_IN, CLK_OUT, rst);
input CLK_IN, rst;
output reg CLK_OUT;
wire rest;
assign rest  = ~rst;
reg [23:0]contador;

always @(posedge CLK_IN or posedge rest)
begin 
	if(rest) begin
	CLK_OUT <= 0;
	contador <= 0;
	end else if (contador == 13500000-1) begin
	CLK_OUT <= ~CLK_OUT;
	contador <= 0;
	end else
	contador <= contador + 1;
end
endmodule 
