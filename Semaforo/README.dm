# Proyecto Semáforo Digital en Verilog

Este proyecto implementa un sistema de semáforo utilizando tres módulos escritos en Verilog: un módulo principal (`top_semaforo`), un divisor de frecuencia (`divi`) y el controlador del semáforo (`smaforo`). El objetivo es simular un ciclo de luces verde y roja en función de un reloj dividido.

## Estructura de los Módulos

### 1. `top_semaforo`

Este es el módulo principal que conecta los módulos secundarios `divi` y `smaforo`.

#### Entradas:
- `clk_in`: Reloj principal del sistema.
- `rest`: Señal de reset (activa en alto).

#### Salidas:
- `lr`: Luz roja del semáforo.
- `lg`: Luz verde del semáforo.

#### Conexiones:
- Invierte la señal `rest` (con `~rest`) para usarla en los módulos internos.
- Usa `divi` para dividir la frecuencia del reloj.
- Usa `smaforo` para controlar el estado del semáforo según el reloj dividido.

---

### 2. `divi`

Este módulo divide la frecuencia del reloj de entrada (`CLK_IN`) y genera una nueva señal de reloj más lenta (`CLK_OUT`).

#### Entradas:
- `CLK_IN`: Reloj original de alta frecuencia.
- `rst`: Señal de reset.

#### Salida:
- `CLK_OUT`: Reloj de baja frecuencia (dividido).

#### Funcionamiento:
- Tiene un contador de 24 bits (`contador`).
- Cuando `contador` llega a 13,499,999, invierte `CLK_OUT` y reinicia el contador.
- Esto permite generar una señal de reloj de salida con menor frecuencia, útil para visualizar los cambios del semáforo.

---

### 3. `smaforo`

Este módulo implementa la lógica del semáforo.

#### Entradas:
- `clk`: Reloj (reducido) proveniente de `divi`.
- `rst`: Señal de reset.

#### Salidas:
- `lr`: Luz roja (Red).
- `lg`: Luz verde (Green).

#### Funcionamiento:
- Usa un contador de 4 bits (`y`) para llevar la cuenta de los estados del semáforo.
- En cada flanco positivo del reloj, incrementa `y`, reseteando a 0 cuando llega a 7.
- Según el valor de `y`, activa `lr` o `lg` con base en el siguiente patrón:

```verilog
  0: Rojo (lr=1, lg=0)
  1: Rojo
  2: Rojo
  3: Rojo
  4: Rojo
  5: Verde (lr=0, lg=1)
  6: Verde
  7: Verde
