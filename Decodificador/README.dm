# 🔍 ¿Qué es un Decodificador?

Un **decodificador** es un circuito lógico que **traduce entradas binarias codificadas en salidas únicas**. Su propósito principal es **activar una única salida entre varias posibles**, dependiendo de la combinación binaria recibida como entrada.

## 🧠 Explicación simple

El decodificador convierte combinaciones de bits (por ejemplo, desde un contador o memoria) en señales que seleccionan dispositivos, acciones o rutas específicas dentro de un sistema digital.

---

## 📘 Ejemplo: Decodificador 2 a 4

Un decodificador **2 a 4** tiene:

- **Entradas**: 2 bits (`A1`, `A0`)
- **Salidas**: 4 líneas (`Y0`, `Y1`, `Y2`, `Y3`)

Solo **una salida estará activa** (en estado alto) según la entrada.

| A1 | A0 | Salida activa |
|----|----|----------------|
|  0 |  0 | Y0             |
|  0 |  1 | Y1             |
|  1 |  0 | Y2             |
|  1 |  1 | Y3             |

---

## ⚙️ Aplicaciones comunes

- Selección de líneas en memorias RAM o ROM.
- Control de displays (como pantallas de 7 segmentos).
- Decodificación de instrucciones en microprocesadores.
- Control de múltiples dispositivos desde un mismo bus.
