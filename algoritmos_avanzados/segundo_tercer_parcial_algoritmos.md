# Segundo y Tercer Parcial - Algoritmos Avanzados

---

## (SP) Segundo Parcial (13 de mayo del 2025)

**Materia:** Algoritmos Avanzados
**Fecha:** 13 de mayo del 2025

> Leer las preguntas con cuidado antes de responder

### 1. (20 ptos.)
Considera el problema del fraccionamiento de dinero, desarrolla una solución con programación dinámica que permita resolver el problema de manera eficiente.

### 2. (15 ptos.)
El problema de decidir cuál de 8 monedas es la más liviana, dado que las restantes 7 pesan igual y todas son ligeramente más pesadas que la que se busca; es un problema de divide para vencer, una solución es dividir las monedas en dos partes de cuatro, pesarlas y quedarse con la porción de 4 monedas más livianas, a su vez éstas monedas se divide en dos grupos de a dos, se realiza el pesaje y nuevamente nos quedamos con las dos monedas más livianas, el último paso consiste en pesar una moneda contra la otra y así decidimos cuál es la más liviana. En este algoritmo se requieren de 3 pesadas para determinar la moneda más liviana.

¿Es posible hacerlo en menos pesadas? Si encuentras una versión más rápida ¿es posible generalizar el procedimiento para n monedas? Si fuera así, ¿qué restricciones y/o condiciones se deben cumplir?

### 3. (15 ptos.)
¿Cuál es la diferencia de plantear un algoritmo dinámico Bottom UP contra uno Top Down?

---

## (SP) Segundo Parcial (11 de Noviembre del 2025)

**Materia:** Algoritmos Avanzados
**Fecha:** 11 de Noviembre del 2025

> Leer las preguntas con cuidado antes de responder

### 1. (15 ptos)
Indica 2 diferencias entre los algoritmos voraces y la programación dinámica, explica de manera detallada la diferencia.

### 2. (20 ptos.)
Considera el algoritmo de la subsecuencia incremental más larga LIS, sobre un arreglo. Por ejemplo: si la secuencia es {4,6,2,8,3,9,4,5}, la subsecuencia sería: {4,6,8,9}. Explica qué modificaciones podrías hacer al algoritmo si quisieras encontrar la subsecuencia incremental más larga en una matriz, dado que la subsecuencia se define en un recorrido de la matriz por filas. Calcula su complejidad O.

Por ejemplo, si la matriz es:

| 2 | 4 | 1 | 8 |
|---|---|---|---|
| 5 | 2 | 7 | 0 |
| 1 | 5 | 9 | 8 |
| 7 | 9 | 1 | 2 |

La subsecuencia es de 6 elementos:

| 2 | 4 | 1 | 8 |
|---|---|---|---|
| 5 | 2 | 7 | 0 |
| 1 | 5 | 9 | 8 |
| 7 | 9 | 1 | 2 |

### 3. (15 ptos.)
En algoritmos voraces se dice que se debe tener tres funciones para lograr definir de manera correcta una solución. Describe estas tres funciones. Como dato: una de las funciones a las que se hace referencia es la selección del "mejor" candidato.

---

## (SP) Segundo Parcial (5 de noviembre del 2024)

**Materia:** Algoritmos Avanzados
**Fecha:** 5 de noviembre del 2024

> Leer las preguntas con cuidado antes de responder

### 1. (15 ptos.)
Considera el problema de encontrar el k-ésimo número menor de una secuencia de valores. Hay varias maneras de resolver el problema, puede ser: ordenando la secuencia, recursivamente, con estrategia divide para vencer, etc. En esta ocasión se pide usar divide para vencer, puedes explicar y plantear un algoritmo que permita hacer este cometido? Indica la complejidad de tu propuesta de solución.

### 2. (15 ptos.)
En el problema del knapsack (mochila) sin repetición, al aplicar programación dinámica, se utiliza una matriz, la cual, si se revisa por columnas puede existir mucha repetición de los valores que se van generando.

Es posible, reducir de alguna manera el tamaño de la matriz? Explica tu respuesta ya sea positiva o negativa. Usa un ejemplo.

### 3. (10 ptos.)
¿Cuál es el concepto principal que se debe cumplir para decir que una solución usa divide para vencer?

### 4. (10 ptos.)
¿Cuál es la diferencia de plantear un algoritmo dinámico Bottom UP contra uno Top Down?

---

## (TP) Tercer Parcial (10 de diciembre de 2024)

**Materia:** Algoritmos Avanzados
**Fecha:** 10 de diciembre de 2024

### 1.
¿Cuál es la diferencia entre las estructuras auxiliares que se utilizan para emparejamiento de cadenas, considerando el algoritmo basado en autómatas finitos y el algoritmo de KMP - Knuth Morris Pratt? Enumera 3 diferencias.

### 2.
Describe algún algoritmo de emparejado aproximado de cadenas.

### 3.
Se tiene una nube de puntos, y se quiere determinar la mínima cantidad de triángulos que se requieren para encerrar todos los puntos, explica tu razonamiento.

---

## Nota

Las capturas del "(PPT) Primer Parcial Teórico" del 7 de octubre de 2025 y del 8 de abril de 2025 ya fueron transcritas previamente en el archivo `examenes_algoritmos_avanzados.md`.
