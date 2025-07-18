# 🚦 Proyecto Semáforo en Verilog con Display de 7 Segmentos

Este proyecto implementa un sistema de semáforo utilizando diseño jerárquico en Verilog. El sistema incluye un contador de tiempo que se muestra en un display de 7 segmentos. El diseño está dividido en módulos para mejorar la legibilidad, la reutilización y la organización del código.

## 📁 Estructura de módulos

### 1. `top_semaforo.v`

Este es el módulo principal que integra todos los submódulos:

- `divi`: divisor de frecuencia.
- `semaforo`: controlador de luces (rojo y verde).
- `tiempo`: controlador del display de 7 segmentos.

```verilog
module top_semaforo(clk_in, rest, lr, lg, seg7);
```

- `clk_in`: reloj principal del sistema.
- `rest`: señal de reset.
- `lr`, `lg`: salidas del semáforo (luces roja y verde).
- `seg7`: salida del display de 7 segmentos.

---

### 2. `divi.v`

Este módulo divide la frecuencia del reloj de entrada (`clk_in`) para reducir su velocidad y hacerlo usable por los otros módulos.

```verilog
module divi(CLK_IN, CLK_OUT, rst);
```

- Divide la frecuencia del reloj con un contador de 24 bits.
- Invierte `CLK_OUT` cada vez que el contador llega a 13_499_999.

---

### 3. `semaforo.v`

Controla las salidas de las luces del semáforo (`lr`, `lg`) según el estado del contador `y`.

```verilog
module smaforo(clk, rst, lr, lg);
```

- Usa un contador de 4 bits (`y`) que avanza en cada pulso de reloj.
- Controla cuándo debe estar la luz roja (`lr`) o la verde (`lg`) activada.
- El ciclo se reinicia después de 8 estados.

---

### 4. `tiempo.v`

Controla el valor que se muestra en el display de 7 segmentos, representando el tiempo transcurrido en números del 0 al 9.

```verilog
module tiempo(clk, rst, seg7);
```

- Usa el mismo contador de 4 bits que `smaforo.v`.
- Mapea cada valor del contador a un patrón binario correspondiente a un dígito decimal en el display de 7 segmentos.

---

## 💡 Ejecución del sistema

1. La señal de reloj (`clk_in`) se divide usando `divi.v`.
2. El reloj reducido se usa para avanzar un contador en los módulos `smaforo` y `tiempo`.
3. `smaforo` controla las salidas del semáforo (luces).
4. `tiempo` visualiza el estado del contador en un display de 7 segmentos.

---

## 🧪 Simulación y prueba

- El sistema puede probarse en entornos como **ModelSim**, **Vivado**, o **Icarus Verilog**.
- Se recomienda simular cada módulo por separado antes de integrar.

---

## 🔧 Posibles mejoras

- Agregar luz amarilla (LED adicional).
- Incluir control manual o automático de cambio.
- Añadir tiempo configurable mediante switches externos.

---

## 📁 Archivos

- `top_semaforo.v` – módulo principal.
- `divi.v` – divisor de reloj.
- `smaforo.v` – controlador del semáforo.
- `tiempo.v` – visualización de tiempo en display de 7 segmentos.

---

## 📝 Licencia

Este proyecto es libre de uso académico y educativo. Si lo usas en un proyecto más grande, por favor proporciona crédito.
