
# 🔧 Divisor de Frecuencia en Verilog – Tang Nano 9K

Este proyecto implementa un **divisor de frecuencia** utilizando Verilog en la FPGA **Tang Nano 9K**, que cuenta con una señal de reloj de entrada de **27 MHz**. Se incluye un módulo sencillo llamado `divi`, diseñado para reducir esta frecuencia de reloj a una frecuencia más baja útil para aplicaciones digitales como temporizadores, controladores y parpadeo de LEDs.

---

## 📘 ¿Qué es un divisor de frecuencia?

Un **divisor de frecuencia** es un circuito digital que toma una señal de reloj de alta frecuencia como entrada y produce una señal de menor frecuencia como salida. Esto se hace contando ciclos del reloj de entrada y alternando la salida una vez se alcanza un conteo específico.

### 🔍 ¿Para qué se usa?

- Generar relojes más lentos desde una fuente más rápida.
- Control de velocidad en temporizadores y animaciones LED.
- Sincronización de componentes digitales que no soportan altas frecuencias.
- Reducir consumo energético en sistemas donde no se necesita operar a máxima velocidad.

---

## ⚙️ Tang Nano 9K y los 27 MHz

La **Tang Nano 9K** es una FPGA de bajo costo que ofrece una frecuencia de entrada estándar de **27 MHz**. Esta frecuencia puede ser demasiado rápida para algunos periféricos o pruebas visuales (como ver parpadear un LED), por lo que necesitamos dividirla para obtener una señal visible y útil.

---

## 🧠 Explicación del código

```verilog
module divi(CLK_IN, CLK_OUT, rst);
input CLK_IN, rst;
output reg CLK_OUT;

reg [23:0] contador;

always @(posedge CLK_IN or posedge rst)
begin 
    if (rst) begin
        CLK_OUT <= 0;
        contador <= 0;
    end else if (contador == 13500000 - 1) begin
        CLK_OUT <= ~CLK_OUT;
        contador <= 0;
    end else
        contador <= contador + 1;
end
endmodule
```

- `CLK_IN`: Señal de reloj de entrada (27 MHz).
- `rst`: Señal de reinicio, útil para resetear el contador.
- `CLK_OUT`: Reloj de salida dividido.
- `contador`: Registro de 24 bits que llevará la cuenta de ciclos del reloj.

---

### Lógica del divisor

#### Desglose:

- **`always @(posedge CLK_IN or posedge rst)`**: Se ejecuta en cada flanco de subida del reloj o cuando se activa el reset.
- **`if (rst)`**: Si se activa el reinicio, la salida se pone en 0 y el contador se reinicia.
- **`else if (contador == 13500000 - 1)`**: Cuando el contador llega a 13,500,000 ciclos, se invierte (`toggle`) la señal de salida y el contador se reinicia.
- **`else`**: Mientras tanto, el contador simplemente se incrementa.

### 🧮 ¿Por qué 13,500,000?

La salida se invierte cada 13.5 millones de ciclos. Como hay una inversión cada mitad de ciclo, la frecuencia de salida final será:

```
f_out = f_in / (2 × 13,500,000)
      = 27,000,000 / 27,000,000
      = 1 Hz
```

Es decir, el módulo genera una señal de **1 Hz**, ideal para hacer parpadear un LED cada segundo.

---

## 🧪 Aplicación práctica

Puedes conectar `CLK_OUT` a un LED en tu placa Tang Nano 9K para visualizar cómo parpadea una vez por segundo. Este ejemplo es ideal para comprender cómo controlar dispositivos visuales a partir de un reloj rápido.

---

## 📂 Archivos

- `divi.v`: Código fuente del módulo divisor.
- `README.md`: Este archivo de documentación.

---

## 📌 Requisitos

- Tang Nano 9K
- Entorno de desarrollo compatible con FPGA (como GOWIN IDE)
- Simulador Verilog opcional (como GTKWave o ModelSim)

---

## 🧾 Licencia

Este proyecto es de código abierto bajo la licencia MIT.
