# Tercer Parcial — Algoritmos Avanzados

Recopilación de exámenes del tercer parcial (teóricos y prácticos), transcritos a
partir de fotos de hojas de examen y capturas de la plataforma virtual.

- [Exámenes teóricos](#exámenes-teóricos)
- [Exámenes prácticos (TPP)](#exámenes-prácticos-tpp)
- [Capturas de plataforma virtual](#capturas-de-plataforma-virtual)

---

## Exámenes teóricos

### (TP) Tercer Parcial (10 de diciembre de 2024)

#### 1.
¿Cuál es la diferencia entre las estructuras auxiliares que se utilizan para emparejamiento de cadenas, considerando el algoritmo basado en autómatas finitos y el algoritmo de KMP - Knuth Morris Pratt? Enumera 3 diferencias.

#### 2.
Describe algún algoritmo de emparejado aproximado de cadenas.

#### 3.
Se tiene una nube de puntos, y se quiere determinar la mínima cantidad de triángulos que se requieren para encerrar todos los puntos, explica tu razonamiento.

---

## Exámenes prácticos (TPP)

> El código debe poder imprimir el sample output a partir del sample input dado.
> Sin embargo, se ejecuta contra múltiples casos de prueba ocultos.

### Question 1 (25.00 pts) — Lista de Navidad

Es navidad y Mina ha hecho una lista de las personas a las cuales ha pensado enviar presentes. Mina ha decidido utilizar una empresa que se encargue de sus entregas y ha enviado la lista en un orden específico que no puede cambiar.

Ayer Mina ha recibido un mensaje de la empresa, con la lista de las personas a las cuales se debe entregar los presentes, para sorpresa de Mina la lista que le enviaron no coincide con la que ella envió. En la lista que le enviaron aparecen nuevos nombres y desaparecieron otros!!!.

Mina es una apasionada por los retos, no quiere mandar la lista de nuevo sino más bien ha decidido enviar el número mínimo de diferencias que existen entre las listas y las instrucciones que la empresa debe hacer para reconstruir la lista original.

Las instrucciones que Mina puede enviar a la empresa son:

- **Insertar pos, nombre** que pide insertar en la posición *pos* el *nombre*
- **Borrar pos** que pide eliminar el nombre de la posición *pos*
- **Cambiar pos, nombre** que indica reemplazar el nombre de la posición *pos* con *nombre*

en todos los casos la posición *pos* está entre 1 y la longitud de la lista que tiene la empresa después de hacer cada operación, es decir la longitud actual. Excepcionalmente la *pos* en la instrucción insertar puede eventualmente ser mayor que la longitud de la lista.

La tarea es ayudar a Mina a generar la lista de instrucciones que se requieren hacer para poder emparejar las listas. Lo mejor que puede pasar es que existan 0 diferencias, lo que implicaría que no tiene que generar instrucciones, pero sí informar que hay 0 diferencias.

**Entrada.** La entrada tiene varios casos de prueba, cada caso consta de dos líneas: la primera tiene la lista que la empresa ha enviado a Mina (la que posiblemente tiene errores) b1 b2 b3 ... bn, la segunda línea tiene la lista original de Mina a1 a2 a3 ... am. Donde bi, aj son cadenas todas escritas en minúsculas de longitud no mayor a 10. Cada cadena está separada por un espacio en blanco. La entrada de datos termina con dos líneas que tienen `*`, las que no deben ser procesadas. `m` y `n` son enteros positivos menores o iguales a 100.

**Salida.** La salida por cada caso de entrada tiene varias líneas, la primera debe mostrar la cantidad mínima de diferencias X que existe entre las listas, seguida de X filas, cada una de ellas indicando paso a paso las instrucciones que se deben seguir para poder emparejar las dos listas. Utilizando en cada paso, el número del paso y la instrucción que corresponda: Insertar, Borrar o Cambiar, de acuerdo al formato descrito.

**Sample input**
```
ali adri cami yas
ali adri cami yas leo
ali adri cami yas lio
ali adri mateo cami leo yas
ali adri mateo cami
ali adri leo cami javi
ali adri mario luis cami
ali adri cami
ali adri cami
ali adri cami
```
> (la captura muestra "View more"; la entrada real termina con dos líneas `*`)

**Sample output**
```
1
1 Insertar 5, leo
3
1 Insertar 3, mateo
2 Insertar 5, leo
3 Borrar 7
2
1 Cambiar 3, leo
2 Insertar 5, javi
2
```

**Limits:** Time Limit 3.0 s por archivo · Memory Limit 256 MB · Source Limit 1024 KB

### Question 2 (25.00 pts) — La estrella de navidad

Se quiere saber cuánto espacio ocuparía una estrella de navidad, considerando el área total que ocupa.

La estrella con la que se cuenta es de 5 puntas, que se ha formado sobre la base de triángulos isósceles, de los cuales se conoce la longitud del lado que se repite (`a`) y del lado diferente (`b`). Todas las puntas de la estrella son iguales.

**Entrada.** Hay varios casos de prueba, cada uno de ellos tiene dos números enteros `a` y `b`, separados por un espacio en blanco; que representan los lados del triángulo isósceles, donde `a` es la dimensión de los lados iguales y `b` del lado diferente `4 <= a,b <= 100`. La entrada termina con una pareja de 0s, la misma que no debe ser procesada.

**Salida.** La salida se imprime en una línea por cada caso, que representa el área de la estrella con una precisión de 2 cifras después del punto decimal.

**Sample input 1**
```
5 5
5 6
6 7
0 0
```

**Sample output 1**
```
57.57
64.14
90.11
```

**Limits:** Time Limit 1.0 s por archivo · Memory Limit 256 MB · Source Limit 1024 KB

---

## Capturas de plataforma virtual

### Examen Teórico de TP (cuestionario de 4 preguntas)

#### 1. (Puntúa como 8,00) — Verdadero / Falso
"Toda línea tiene magnitud."

> Respuesta marcada en la captura: **Falso**

#### 2. (Puntúa como 7,00) — Verdadero / Falso
"Los puntos se pueden ordenar."

> Respuesta marcada en la captura: **Verdadero**

#### 3. (Puntúa como 25,00)
Si se tiene un conjunto de puntos sin orden alguno, se quiere encontrar el perímetro del polígono convexo de cuatro lados más pequeño. Para ello debes considerar los puntos que se te dan como datos.

1. Diseña un algoritmo que permita hacer el trabajo requerido.
2. Cataloga tu diseño dentro de las estrategias conocidas: fuerza bruta, divide para vencer, algoritmo voraz, programación dinámica.
3. Calcula la complejidad de tu algoritmo.

#### 4. (Puntúa como 10,00)
¿Cuál es la diferencia entre un TRIE y un Suffix Tree?
