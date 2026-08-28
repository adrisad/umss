# Exámenes - Algoritmos Avanzados

---

## Primer Parcial (1 de octubre de 2024)

**Materia:** Algoritmos Avanzados
**Fecha:** 1 de octubre de 2024

> Leer las preguntas con cuidado antes de responder

### 1. (20 ptos.)
Plantea un algoritmo que permita de manera eficiente calcular x, cuando se tiene la siguiente relación:

$$x^2 + x - 2 \equiv 0 \pmod{10}$$

Se sugiere usar propiedades de aritmética modular; indica la complejidad de tu solución y justifica. Siempre debes razonar de manera general, es decir, que el valor del módulo puede ser abstraído por n.

### 2. (10 ptos.)
Indica cuál es la relación que existe entre la función f(n) con g(n). Demuestra la relación.

| f(n)         | g(n)        |
|--------------|-------------|
| 10 + log n   | n - log n   |
| n^(5/2)      | n^(log n)   |

Se dice que $f_2 = O(f_1)$ si $\dfrac{f_2(n)}{f_1(n)} \le K$

### 3. (20 ptos.)
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

## (PPT) Primer Parcial Teórico (7 de octubre de 2025)

**Materia:** Algoritmos Avanzados
**Fecha:** 7 de octubre de 2025

> Leer las preguntas con cuidado antes de responder

### 1. (10 ptos.)
¿Qué significa que un algoritmo sea polinómico?

### 2. (20 ptos.)
¿Cuál es la diferencia entre un árbol de segmentos y un árbol binario de búsqueda?

### 3. (20 ptos.)
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

## (PPT) Primer Parcial Teórico (8 de abril de 2025)

**Materia:** Algoritmos Avanzados
**Fecha:** 8 de abril de 2025

> Leer las preguntas con cuidado antes de responder

### 1. (10 ptos.)
Un árbol de segmentos organiza los datos en un árbol binario balanceado. Se tienen muchos datos y en el afán de reducir la altura del árbol se ha pensado en manejar un árbol ternario como base de razonamiento. Indica cómo se modificarían las estrategias para buscar la información en un rango y las modificaciones en el conjunto de datos. Analiza tu respuesta en términos de complejidad algorítmica.

### 2. (20 ptos.)
Considera el problema de encontrar el mínimo elemento de una secuencia de n valores. Determina con claridad el conjunto de precondiciones P, el conjunto de poscondiciones Q, el proceso que lo resuelve y demuestra que es correcto. Para ello utiliza el método formal de correctitud planteada por Hoare.

### 3. (20 ptos.)
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

## Examen (captura de plataforma virtual) - Pregunta 3

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

## Examen (captura de plataforma virtual) - Pregunta 1

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
