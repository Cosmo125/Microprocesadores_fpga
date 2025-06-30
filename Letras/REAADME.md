# Proyecto Corto 1 - Microprocesadores

Este repositorio contiene una **versión funcional del proyecto de la tarea asignada** para la materia de Microprocesadores, en la carrera de Ingeniería Biomédica.

## Descripción del Proyecto

El sistema implementa la estructura completa solicitada en el enunciado del proyecto:

- **Multiplexor 1:2 de 4 bits**: Selecciona entre dos entradas de 4 bits según una señal de control.
- **Dos decodificadores personalizados**: Cada uno interpreta combinaciones de 4 bits y las convierte en caracteres que simulan letras para visualización en un display de 7 segmentos. Uno corresponde a **nombres** y otro a **apellidos**.
- **Demultiplexor 2:1**: Dirige la salida decodificada al display de 7 segmentos dependiendo de la misma señal de control (`S`).
- **Display de 7 segmentos**: Muestra el nombre cuando `S = 0` y el apellido cuando `S = 1`.

## Finalidad del Repositorio

Este repositorio fue creado con la intención de servir como **referencia educativa**. Aquí se muestra **cómo debería verse una implementación completa y organizada del proyecto**.

> Si tienes dudas sobre cómo estructurar tu propio proyecto, puedes apoyarte en este repositorio para entender el flujo lógico y la distribución de módulos.

## Recomendaciones

- Revisa cómo se organizaron los módulos para separar el MUX, los decodificadores y el DMUX.
- Observa cómo se manejan las combinaciones para representar letras en un display de 7 segmentos.
- Asegúrate de adaptar los nombres y apellidos con tus propios datos al momento de codificar tus letras.

---

Para cualquier duda adicional, puedes dejar comentarios en el repositorio o consultar con tus compañeros. ¡Mucho éxito con tu proyecto!
