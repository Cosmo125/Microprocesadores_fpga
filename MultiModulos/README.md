# Proyecto Verilog: Multiplexor 2 a 1 y Decodificador de 4 bits a 7 segmentos

Este proyecto tiene como objetivo mostrar la conexión de un **mux 2 a 1** con un **decodificador de 4 bits a 7 segmentos**. La finalidad de esta conexión es contar de 0 a 9 mientras se aprende y explora la **función de módulos múltiples en Verilog**. 

Este ejercicio es útil para familiarizarse con la implementación de sistemas más complejos que combinan múltiples módulos, como un multiplexor y un decodificador, en el contexto de la programación en Verilog.

## Diagrama de conexión

A continuación se muestra un diagrama que explica cómo se realiza la conexión entre los módulos:

![](https://github.com/Cosmo125/Microprocesadores_fpga/blob/main/MultiModulos/Captura%20de%20pantalla%202025-06-20%20161632.png)

## Descripción del código

El código Verilog que se encuentra en este repositorio contiene los siguientes módulos:

### 1. **mux 2 a 1**

Este módulo selecciona entre dos entradas (A y B) según el valor de un **señal de selección** (`sell`). Si `sell` es 0, se selecciona la entrada A; si `sell` es 1, se selecciona la entrada B. La salida del mux es enviada al decodificador.

```verilog
module topmux(A1, B1, sell1, Y1);
    input [3:0] A1, B1;
    input sell1;
    output [6:0] Y1;
    wire [3:0] con_l;

    mux2x1 M1 (
        .A(A1),
        .B(B1),
        .sell(sell1),
        .out(con_l)
    );

    decodi4x6 D1 (
        .A(con_l),
        .Y(Y1)
    );
endmodule
