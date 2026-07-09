# RAM 4x4 en Verilog — Electrónica Secuencial / Microprocesadores

Proyecto de práctica para la clase de **Electrónica Secuencial y Microprocesadores**, implementando una memoria RAM simple en Verilog, simulada en ModelSim y sintetizable en la Tang Nano 9K (Gowin GW1NR-9C).

## ¿Qué es una memoria RAM?

**RAM** (Random Access Memory - Memoria de Acceso Aleatorio) es un tipo de memoria de **lectura y escritura** que almacena datos de forma **volátil**: pierde su contenido al cortar la alimentación eléctrica.

### Características principales

- **Acceso aleatorio**: se puede leer o escribir en cualquier dirección en tiempo constante, sin recorrer secuencialmente la memoria.
- **Lectura y escritura (R/W)**: a diferencia de la ROM (solo lectura), la RAM permite modificar su contenido en tiempo de ejecución mediante una señal de **Write Enable (`we`)**.
- **Volátil**: al apagar el sistema se pierde toda la información.
- **Uso típico**: variables, resultados intermedios, pila (stack) y cualquier dato que el procesador necesite manipular durante la ejecución de un programa.

### RAM vs ROM

| | RAM | ROM |
|---|---|---|
| Operación | Lectura y escritura | Solo lectura (generalmente) |
| Volatilidad | Volátil | No volátil |
| Uso típico | Variables, datos temporales | Programa/firmware, tablas fijas |

### Comportamiento síncrono (read-old-data)

En este diseño, la RAM es de **puerto único** con lectura y escritura sincronizadas al mismo flanco de reloj (`posedge clk`). Esto significa que si se escribe y se lee la misma dirección en el mismo ciclo, la salida (`data_out`) muestra el **valor anterior** (el que había antes de la escritura), no el nuevo dato. Este es un comportamiento típico de las memorias síncronas y un buen punto de discusión en clase frente al modelo "write-first".

## Estructura del proyecto

```
├── ram_4x4.v                  # RAM 4x4 con inicialización en 0 (registro for)
├── ram_4x4_readmemh.v         # RAM 4x4 con inicialización vía $readmemh
├── ram_4x4.mem                # Archivo de datos iniciales (hexadecimal)
├── tb_ram_4x4.v                # Testbench para ram_4x4.v
├── tb_ram_4x4_readmemh.v       # Testbench para ram_4x4_readmemh.v
└── README.md
```

## Descripción de los módulos

### `ram_4x4.v`

Memoria de 4 posiciones x 4 bits, inicializada en `0000` mediante un bucle `for` en un bloque `initial`.

- `addr[1:0]`: dirección (0 a 3)
- `data_in[3:0]`: dato a escribir
- `we`: habilita escritura
- `data_out[3:0]`: dato leído, conectado a 4 LEDs

### `ram_4x4_readmemh.v`

Misma funcionalidad, pero la memoria se inicializa cargando valores predefinidos desde un archivo externo `ram_4x4.mem` usando `$readmemh`, en vez de arrancar en ceros. Esto permite mostrar un patrón de prueba desde el inicio, que luego puede sobrescribirse con los DIP switches.

Valores iniciales cargados (`ram_4x4.mem`):

| Dirección | Valor (hex) | Valor (bin) |
|---|---|---|
| 0 | 1 | 0001 |
| 1 | A | 1010 |
| 2 | 6 | 0110 |
| 3 | F | 1111 |

> **Nota:** `$readmemh` solo carga los datos **una vez**, al inicio de la simulación o al momento de la configuración del FPGA. No vuelve a leer el archivo durante la ejecución.

## Simulación en ModelSim

```
vlib work
vlog ram_4x4_readmemh.v tb_ram_4x4_readmemh.v
vsim tb_ram_4x4_readmemh
run -all
```

> **Importante:** el archivo `.mem` debe estar en la carpeta desde donde se ejecuta `vsim` (el directorio de trabajo de la simulación), no necesariamente junto al `.v`.

## Síntesis en Tang Nano 9K (Gowin EDA)

Mapeo sugerido de pines en el archivo de restricciones (`.cst`):

- `addr[1:0]` → 2 DIP switches
- `data_in[3:0]` → 4 DIP switches
- `we` → 1 switch o botón
- `clk` → botón con debounce (recomendado para escritura/lectura manual en clase) o el reloj de 27 MHz
- `data_out[3:0]` → 4 LEDs

El diseño se sintetiza automáticamente mapeándose a **BSRAM** en la GW1NR-9C.

## Posibles extensiones

- Agregar módulo de **debounce** para usar un botón como reloj manual.
- Migrar a RAM de doble puerto (lectura y escritura independientes).
- Ampliar a 8x8 o más posiciones para mayor capacidad de práctica.
