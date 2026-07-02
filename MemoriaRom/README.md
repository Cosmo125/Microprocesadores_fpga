# ROM en Verilog — Display de 7 Segmentos

Repositorio con el diseño e implementación de una memoria ROM (Read-Only Memory) en Verilog, orientada a la conversión de dígitos decimales a códigos de segmentos para un display de 7 segmentos.

## ¿Qué es una memoria ROM?

Una **ROM (Read-Only Memory)** es un tipo de memoria de solo lectura cuyo contenido se define en el momento del diseño (o fabricación) y no cambia durante la operación normal del circuito. A diferencia de una RAM, no se puede escribir sobre ella en tiempo de ejecución; su función es almacenar datos fijos que el sistema necesita consultar repetidamente.

En el contexto de FPGA/ASIC, una ROM se implementa comúnmente como una **tabla de búsqueda (LUT — Look-Up Table)**: dado un valor de dirección de entrada (`addr`), la memoria responde con un dato predefinido (`data_out`). Es una técnica muy utilizada para:

- Conversión de códigos (como decimal a 7 segmentos, BCD, ASCII, etc.)
- Tablas matemáticas precalculadas (senos, cosenos, coeficientes de filtros)
- Microcódigo o secuencias de control fijas
- Generación de formas de onda o patrones predefinidos

En Verilog, una ROM se describe típicamente como un arreglo de registros (`reg [N:0] mem [0:DEPTH-1]`) que se inicializa mediante las directivas de sistema `$readmemh` (valores en hexadecimal) o `$readmemb` (valores en binario), leyendo un archivo de texto externo (`.mem`) que contiene los datos.

## Proyecto: ROM para display de 7 segmentos

Este proyecto implementa una ROM que traduce un dígito decimal (0-9) en su patrón de segmentos correspondiente (`gfedcba`), pensada para un display de 7 segmentos de **ánodo común** (activo en bajo).

- **Dirección de entrada:** 4 bits (`addr`), permite direccionar 16 posiciones (0-15)
- **Dato de salida:** 7 bits (`data_out`), un bit por segmento
- **Dígitos activos:** 0 al 9 (posiciones 10-15 reservadas/sin uso)
- **Salida registrada:** sincronizada con flanco de subida del reloj (`posedge clk`)

## Estructura del repositorio

```
├── rom_7seg.v          # Módulo principal de la ROM
├── tb_rom_7seg.v        # Testbench para simulación
├── rom_7seg.mem         # Archivo de datos (contenido de la ROM)
├── run.do               # Script de ModelSim (compilación + simulación)
└── README.md
```

## Herramientas utilizadas

- **Simulación:** ModelSim (compilación con `vlog`, simulación con `vsim`, inspección de señales en la ventana Wave)
- **Síntesis / implementación:** Gowin EDA, orientado a la FPGA **Tang Nano 9K** (GW1NR-9C)

## Cómo simular

```tcl
vlib work
vlog rom_7seg.v tb_rom_7seg.v
vsim tb_rom_7seg
run -all
```

Asegúrate de que `rom_7seg.mem` esté en la misma carpeta desde donde se ejecuta `vsim`.

## Próximos pasos / uso previsto

Este repositorio se irá ampliando con los distintos módulos y pruebas desarrollados como parte del curso de **Electrónica Secuencial**, incluyendo diseños adicionales basados en máquinas de estado finito (FSM) y su implementación en el Tang Nano 9K.
