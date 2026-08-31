# Primer Parcial — Algoritmos Avanzados

Recopilación de exámenes del primer parcial (teóricos y prácticos), transcritos a
partir de fotos de hojas de examen y capturas de la plataforma virtual.

- [Exámenes teóricos](#exámenes-teóricos)
- [Exámenes prácticos (PPP)](#exámenes-prácticos-ppp)
- [Capturas de plataforma virtual](#capturas-de-plataforma-virtual)

---

## Exámenes teóricos

### Primer Parcial (1 de octubre de 2024)

> Leer las preguntas con cuidado antes de responder

#### 1. (20 ptos.)
Plantea un algoritmo que permita de manera eficiente calcular x, cuando se tiene la siguiente relación:

$$x^2 + x - 2 \equiv 0 \pmod{10}$$

Se sugiere usar propiedades de aritmética modular; indica la complejidad de tu solución y justifica. Siempre debes razonar de manera general, es decir, que el valor del módulo puede ser abstraído por n.

#### 2. (10 ptos.)
Indica cuál es la relación que existe entre la función f(n) con g(n). Demuestra la relación.

| f(n)         | g(n)        |
|--------------|-------------|
| 10 + log n   | n - log n   |
| n^(5/2)      | n^(log n)   |

Se dice que $f_2 = O(f_1)$ si $\dfrac{f_2(n)}{f_1(n)} \le K$

#### 3. (20 ptos.)
Dado el siguiente código:

```c
void prueba(int n){
    int i, j, a;
    i = 0;
    a = 0;
    while(i < n){
        j = i;
        while(j < n){
            a = a*2;
            j++;
        }
        a = a+1;
        i++;
    }
}
```

Calcula el tiempo de ejecución, el mismo debe estar en función de n.

---

### (PPT) Primer Parcial Teórico (7 de octubre de 2025)

> Leer las preguntas con cuidado antes de responder

#### 1. (10 ptos.)
¿Qué significa que un algoritmo sea polinómico?

#### 2. (20 ptos.)
¿Cuál es la diferencia entre un árbol de segmentos y un árbol binario de búsqueda?

#### 3. (20 ptos.)
Dado el siguiente algoritmo, encuentra el tiempo de ejecución.

```c
// ini <= fin = |col|
int misterio(int ini, int fin, int[] col){
    int res, mitad;
    if(ini == fin)
        res = col[ini];
    else{
        mitad = (ini+fin)/2;
        res = min(misterio(ini, mitad, col), misterio(mitad+1, fin, col));
    }
    return res;
}
```

---

### (PPT) Primer Parcial Teórico (8 de abril de 2025)

> Leer las preguntas con cuidado antes de responder

#### 1. (10 ptos.)
Un árbol de segmentos organiza los datos en un árbol binario balanceado. Se tienen muchos datos y en el afán de reducir la altura del árbol se ha pensado en manejar un árbol ternario como base de razonamiento. Indica cómo se modificarían las estrategias para buscar la información en un rango y las modificaciones en el conjunto de datos. Analiza tu respuesta en términos de complejidad algorítmica.

#### 2. (20 ptos.)
Considera el problema de encontrar el mínimo elemento de una secuencia de n valores. Determina con claridad el conjunto de precondiciones P, el conjunto de poscondiciones Q, el proceso que lo resuelve y demuestra que es correcto. Para ello utiliza el método formal de correctitud planteada por Hoare.

#### 3. (20 ptos.)
Dado el siguiente algoritmo, encuentra el tiempo de ejecución.

```c
int misterio(int n){
    int res;
    while(n < m){
        for(i = 1; i < n; i++){
            res = res + i;
        }
        n = n*2;
    }
    return res;
}
```

---

## Exámenes prácticos (PPP)

> El código debe poder imprimir el sample output a partir del sample input dado.
> Sin embargo, se ejecuta contra múltiples casos de prueba ocultos, por lo que debe
> pasar también esos casos ocultos.

### Question 1 (25.00 pts) — La rana que estaba cantando debajo del agua

Hay un cántico infantil que dice:

> La rana que estaba sentada cantando debajo del agua,
> cuando la rana salió a cantar vino una mosca y la hizo callar
> cuando la mosca salió a cantar vino un ratón y le hizo callar
> cuando el ratón salió a cantar vino el gato y le hizo callar
> ....

Este cántico puede ser tan largo como se quiera, lo único que se necesita es establecer los personajes que participan en ella, que además tienen al parecer una relación de poder-sometimiento entre ellos. Por ejemplo, el gato al ratón, el ratón a la mosca y así... Por cada relación de poder-sometimiento se tiene una línea en el cántico. Como podrás apreciar el cántico tiene tantas líneas como personajes mantienen esa relación de poder-sometimiento.

La tarea es encontrar cuál sería el cántico más largo que se puede construir dado que se tiene un conjunto de personajes y sus relaciones de poder-sometimiento.

**Entrada.** La entrada puede contener varios casos. Cada caso inicia con dos enteros N y R:
- N: número de personajes
- R: número de relaciones de poder-sometimiento

A continuación se tienen N líneas con los personajes que puede tener el cántico; cada personaje está descrito por su nombre, el mismo que está escrito en minúsculas y es solo una palabra; los nombres a lo sumo tienen 20 caracteres.

Luego le siguen R líneas, cada una de ellas tiene dos nombres de personajes separados por un espacio, donde el primer personaje identifica al sometido y el segundo al que tiene el poder. Ningún personaje se somete a sí mismo.

Los casos terminan cuando se encuentran dos 0's.

**Restricciones:** `1 <= N <= 5000`; `0 <= R <= 5000`

**Salida.** Por cada caso de entrada se debe emitir en una línea, el número de líneas que contendrá el cántico más largo.

**Sample input 1**
```
9 5
perro
rana
gato
mosca
raton
leon
tigre
oso
lagarto
raton gato
rana mosca
mosca raton
lagarto oso
tigre leon
```

**Sample output 1**
```
4
```

### Question 2 (25.00 pts) — Relación de cubos

Los números tienen propiedades muy interesantes. La representación de un número sobre la base de otros sometiéndolos a operaciones matemáticas es muy común. En esta ocasión observamos esta relación: que indica que algunos números al cubo pueden ser representados por la suma de tres números distintos al cubo. En algunos casos incluso puede tener más de una equivalencia.

Por ejemplo, el 41 tiene dos posibles relaciones de equivalencia:

$$41^3 = 2^3 + 17^3 + 40^3$$
$$41^3 = 6^3 + 32^3 + 33^3$$

La tarea consiste en encontrar todos aquellos números menores a N que tienen esta equivalencia.

**Entrada.** Se pueden tener varios casos de entrada. Cada caso tiene un número entero M que indica el límite del rango de valores [1,M] en el cual hay que buscar cuáles tienen la relación de equivalencia descrita. `1 <= M <= 400`. El conjunto de casos termina cuando M es 0.

**Salida.** Por cada caso de entrada se debe emitir todos los posibles números que tienen la relación de equivalencia antes descrita, en el rango [1,M]. El formato de la respuesta debe ser:

```
n = a,b,c
```

donde n es el número que elevado al cubo puede ser representado por la suma de los cubos de los tres números a, b, c; donde a,b,c > 1. Si n tiene más de una posible respuesta se deben emitir todas, ordenadas a su vez por los valores de las triplas a,b,c.

**Sample input 1**
```
10
20
0
```

**Sample output 1**
```
6 = 3,4,5
6 = 3,4,5
12 = 6,8,10
18 = 2,12,16
18 = 9,12,15
19 = 3,10,18
20 = 7,14,17
```

---

## Capturas de plataforma virtual

### Pregunta 1 — Tiempo de ejecución de `misterio(int n)`

Dado el siguiente algoritmo, determina el tiempo de ejecución (T(n)) del mismo.

```c
void misterio(int n){
    int i, j;
    i = 2;
    while(i <= n){
        j = 1;
        while(j <= i){
            j = j * 2;
            i = i + 1;
        }
        i = i * 2;
    }
}
```

**Anotaciones de la resolución (según captura):**
- `i = 2;` → 1
- `while(i <= n){` → (m + 1)*3 + ((p + 1)*3 + 6*p + 4) * m = 3*m + 3 + (9*p + 7)*m = 10*m + 9*p*m + 3
- `j = 1;` → 1
- `while(j <= i){` → (p + 1)*3 + 6*p
- `j = j * 2;` → 3
- `i = i + 1;` → 3
- `i = i * 2;` → 3

### Pregunta 3 — Invariante y función de tiempo de `cifras(int n)`

Dado el siguiente algoritmo, define el INVARIANTE y la función del TIEMPO, considerando las reglas de inferencia de la triple de Hoare.

```
P = {n E Z+0; n = N}

int cifras(int n){
    int nro;
    nro = 0;
    do{
        n = n/10;
        nro++;
    }while(n>0);
    return nro;
}

Q = {nro = |log10 N| + 1; nro E Z+}
```

---

## Referencias

- THOMAS H. CORMEN, CHARLES E. LEISERSON, RONALD L. RIVEST, CLIFFORD STEIN (2009), *Introduction to Algorithms, Third Edition*, The MIT Press.
