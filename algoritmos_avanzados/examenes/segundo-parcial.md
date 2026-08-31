# Segundo Parcial — Algoritmos Avanzados

Recopilación de exámenes del segundo parcial (teóricos y prácticos), transcritos a
partir de fotos de hojas de examen y capturas de la plataforma virtual.

- [Exámenes teóricos](#exámenes-teóricos)
- [Exámenes prácticos (SPP)](#exámenes-prácticos-spp)
- [Capturas de plataforma virtual](#capturas-de-plataforma-virtual)

---

## Exámenes teóricos

### (SP) Segundo Parcial (5 de noviembre de 2024)

> Leer las preguntas con cuidado antes de responder

#### 1. (15 ptos.)
Considera el problema de encontrar el k-ésimo número menor de una secuencia de valores. Hay varias maneras de resolver el problema, puede ser: ordenando la secuencia, recursivamente, con estrategia divide para vencer, etc. En esta ocasión se pide usar divide para vencer, ¿puedes explicar y plantear un algoritmo que permita hacer este cometido? Indica la complejidad de tu propuesta de solución.

#### 2. (15 ptos.)
En el problema del knapsack (mochila) sin repetición, al aplicar programación dinámica, se utiliza una matriz, la cual, si se revisa por columnas puede existir mucha repetición de los valores que se van generando.

¿Es posible reducir de alguna manera el tamaño de la matriz? Explica tu respuesta ya sea positiva o negativa. Usa un ejemplo.

#### 3. (10 ptos.)
¿Cuál es el concepto principal que se debe cumplir para decir que una solución usa divide para vencer?

#### 4. (10 ptos.)
¿Cuál es la diferencia de plantear un algoritmo dinámico Bottom UP contra uno Top Down?

---

### (SP) Segundo Parcial Teórico (13 de mayo de 2025)

> Leer las preguntas con cuidado antes de responder

#### 1. (20 ptos.)
Considera el problema del fraccionamiento de dinero, desarrolla una solución con programación dinámica que permita resolver el problema de manera eficiente.

#### 2. (15 ptos.)
El problema de decidir cuál de 8 monedas es la más liviana, dado que las restantes 7 pesan igual y todas son ligeramente más pesadas que la que se busca; es un problema de divide para vencer. Una solución es dividir las monedas en dos partes de cuatro, pesarlas y quedarse con la porción de 4 monedas más livianas, a su vez éstas monedas se divide en dos grupos de a dos, se realiza el pesaje y nuevamente nos quedamos con las dos monedas más livianas; el último paso consiste en pesar una moneda contra la otra y así decidimos cuál es la más liviana. En este algoritmo se requieren de 3 pesadas para determinar la moneda más liviana.

¿Es posible hacerlo en menos pesadas? Si encuentras una versión más rápida ¿es posible generalizar el procedimiento para n monedas? Si fuera así, ¿qué restricciones y/o condiciones se deben cumplir?

#### 3. (15 ptos.)
¿Cuál es la diferencia de plantear un algoritmo dinámico Bottom UP contra uno Top Down?

---

### (SP) Segundo Parcial (11 de noviembre de 2025)

> Leer las preguntas con cuidado antes de responder

#### 1. (15 ptos.)
Indica 2 diferencias entre los algoritmos voraces y la programación dinámica, explica de manera detallada la diferencia.

#### 2. (20 ptos.)
Considera el algoritmo de la subsecuencia incremental más larga (LIS), sobre un arreglo. Por ejemplo: si la secuencia es {4,6,2,8,3,9,4,5}, la subsecuencia sería {4,6,8,9}. Explica qué modificaciones podrías hacer al algoritmo si quisieras encontrar la subsecuencia incremental más larga en una matriz, dado que la subsecuencia se define en un recorrido de la matriz por filas. Calcula su complejidad O.

Por ejemplo, si la matriz es:

```
2 4 1 8
5 2 7 0
1 5 9 8
7 9 1 2
```

La subsecuencia es de 6 elementos (marcados en la matriz, recorrido por filas).

#### 3. (15 ptos.)
En algoritmos voraces se dice que se debe tener tres funciones para lograr definir de manera correcta una solución. Describe estas tres funciones. Como dato: una de las funciones a las que se hace referencia es la selección del "mejor" candidato.

---

## Exámenes prácticos (SPP)

> El código debe poder imprimir el sample output a partir del sample input dado.
> Sin embargo, se ejecuta contra múltiples casos de prueba ocultos.

### Question 1 (25.00 pts) — Tienda

Se tiene una tienda de novias, en la que ofrecen servicios en combo que consisten de la vestimenta y de los accesorios. La tienda a su vez trabaja con empresas que ofrecen vestimenta por un lado y otras que ofrecen accesorios.

La tienda no stockea demasiada mercadería, por lo que hace las solicitudes a estas empresas en la medida de los pedidos que tiene. Por lo que, si tiene `n` pedidos, la tienda a su vez solicita a la empresa de vestimenta que le envíen `n` piezas, con sus respectivos precios; de la misma forma pide `n` juegos de accesorios de los cuales también se tiene los costos.

Por cada pedido se debe formar combo: vestimenta - accesorios, de tal manera que la distribución de costos sea lo más equilibrada posible. Sobre la base de esta distribución equilibrada se toma el combo más económico y el más costoso para sacar una media que se constituye en el precio base de cada combo.

La tarea es dado `n` pedidos, los precios de las vestimentas v1, v2, ... vn, los costos de los accesorios a1, a2, .. an, se quiere encontrar una distribución balanceada y equilibrada, que asegure que la diferencia entre los combos sea la mínima. Cada combo consta de una pieza de vestimenta y un juego de accesorios.

Por ejemplo, si se tiene 6 pedidos y la empresa de las vestimentas entrega productos con valor 100, 34, 67, 23, 19, 23 y la de accesorios ofrece conjuntos con los siguientes precios 20, 7, 39, 12, 32, 32; después de hacer una distribución balanceada y equilibrada, se tiene el combo más costoso de 107 y el combo de menor costo de 54, por lo que el costo base de todo combo es 80.5, que se obtiene de la media aritmética de estos dos combos.

**Entrada.** La entrada consta de varios casos de prueba. Cada caso de prueba se escribe en tres líneas: la primera línea tiene un número `n` que especifica los pedidos que la tienda tiene, la segunda línea consta de `n` números enteros positivos vi separados por un espacio (costo de la vestimenta i-ésima), la tercera línea consta de `n` valores enteros positivos aj (costos de los accesorios), separados por un espacio en blanco. La entrada de datos termina cuando `n` es 0, el mismo que no debe ser procesado. `1 <= n <= 1000`; `1 <= vi, aj <= 1000000`

**Salida.** Por cada caso de prueba se imprime en una línea la leyenda "Caso #:" seguido del costo base de los pedidos, con un decimal de precisión.

**Sample input 1**
```
6
100 34 67 23 19 23
20 7 39 12 32 32
2
200 344
58 24
0
```

**Sample output 1**
```
Caso 1: 80.5
Caso 2: 313.0
```

### Question 2 (25.00 pts) — Suma de cubos

Los números enteros positivos tienen varias propiedades, estos se pueden representar a través de la suma de otros valores. En esta ocasión se analiza la representación a través de la suma de uno o varios términos, donde cada término es algún valor elevado al cubo.

Por ejemplo: el 1 se puede representar como 1^3 (un término); el 8 se puede representar como la suma de ocho 1^3, o también como 2^3 (un término). El 99 se puede representar de varias maneras, entre ellas: 99 veces 1^3; o como diez 2^3 más tres 1^3 (13 términos); o como 4^3 + 3^3 + 2^3 (3 términos).

La tarea es dado un número, encontrar la menor cantidad de términos elevados al cubo, que sumados den un número entero positivo.

**Entrada.** La primera línea contiene un entero `c`, `1 <= c <= 1000`, que identifica la cantidad de casos. Le siguen `c` líneas, en cada una de ellas se tiene un número `n` entero positivo comprendido entre `[1, 10000]`.

**Salida.** Por cada caso de prueba se debe imprimir en una línea, la mínima cantidad de términos elevados al cubo que sumados den el número.

**Sample input 1**
```
3
1
8
99
```

**Sample output 1**
```
1
1
3
```

---

## Capturas de plataforma virtual

Preguntas teóricas de las notas del segundo parcial (SP).

### Pregunta 1 (14,00 / 16,00)

Considera los **algoritmos avaros** (voraces) y **programación dinámica**. Enumera tres diferencias entre estas dos técnicas de resolución de problemas.

> La captura muestra una respuesta parcial en bloque de código (recortada):
> ```
> * Algoritmos voraces
>
> - Una vez que toma un subconjunto [...]
> - Este algoritmo busca optimiza[r ...]
> - Es necesario tener una función [...]
> ```

### Pregunta 2 (12,00 / 17,00)

¿Es posible utilizar la técnica **divide para vencer** si se quiere encontrar el n-ésimo número de la serie de Fibonacci? Explica por qué.

### Pregunta 3 (14,00 / 17,00)

Dado el algoritmo voraz que dado una secuencia de números enteros, permite encontrar la subsecuencia consecutiva de mayor suma.

1. Indica qué adaptaciones se debería hacer para encontrar la subsecuencia consecutiva de menor suma. Explica qué conjetura usas para asegurar que el resultado sea el mejor.
2. ¿La solución sigue siendo voraz? Explica.
