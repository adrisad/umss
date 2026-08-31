# Correctitud de Algoritmia

**Autora:** Leticia Blanco
**Departamento:** Informática - Sistemas, UMSS
**Fecha:** 21 de agosto de 2024
**Materia:** Algoritmos Avanzados

---

## Contenido

- Antecedentes
- Propiedades de Algoritmo
- Correctitud

---

## Antecedentes

- **Algoritmo:** proceso bien definido para resolver problemas, planteado a través de un conjunto *finito* de pasos *lógicamente secuenciados* que transforman entradas en salidas. Debe brindar solución *general* a un problema "bien especificado" [Cormen et. al., 2009]

---

## Propiedades de un Algoritmo

- **correcto:** que haga lo que tiene que hacer, para todo conjunto de entradas válidas debe generar una salida válida
- **eficiente:** que haga buen uso de los recursos, tanto de procesamiento como de espacio

---

## Correctitud de Algoritmos

### Varias formas

- **assert:** construcciones que permiten verificar el cumplimiento de una condición (programa)
- **casos de prueba:** escenarios específicos en los cuales se ejecuta el programa

### Sistema formal

Definida por **Charles Antony Richard Hoare** (1969), premio Turing 1980.

La Lógica de Hoare proporciona una serie de reglas de inferencia para razonar sobre la corrección de programas imperativos con el rigor de la lógica matemática.

La principal característica de esta lógica es la **terna** o **triplete**:

$$\{P\} \ S \ \{Q\}$$

donde $P$ y $Q$ son predicados lógicos que deben cumplirse.

Se inicia en un estado válido descrito por $P$, el programa $S$ se ejecuta y al terminar lo hace en un estado válido descrito por $Q$. Este método de precondición(P) - postcondición(Q) es la base del diseño de software por contrato.

Es importante tomar conciencia de las condiciones sobre las cuales se describe el problema:

- **Previas:** usualmente son las condiciones para las entradas y/o contextos previos $\{P\}$
- **Posteriores:** usualmente son las condiciones que debe cumplir salidas y/o contextos posteriores $\{Q\}$

---

## Propiedades

### Reforzamiento

$$\frac{\{P\} \ S \ \{Q\}; \ P' \Rightarrow P}{\vdash \{P'\} \ S \ \{Q\}}$$

### Debilitamiento

$$\frac{\{P\} \ S \ \{Q\}; \ Q \Rightarrow Q'}{\vdash \{P\} \ S \ \{Q'\}}$$

### Composición

$$\frac{\{P_1\} \ S \ \{Q_1\}; \ \{P_2\} \ S \ \{Q_2\}}{\vdash \{P_1 \land P_2\} \ S \ \{Q_1 \land Q_2\}}$$

$$\frac{\{P_1\} \ S \ \{Q_1\}; \ \{P_2\} \ S \ \{Q_2\}}{\vdash \{P_1 \lor P_2\} \ S \ \{Q_1 \lor Q_2\}}$$

$$\frac{\vdash \{P\} \ \alpha \ \{R\}, \ \vdash \{R\} \ \beta \ \{Q\}}{\vdash \{P\} \ \alpha, \beta \ \{Q\}}$$

$\vdash \{P\} \ \alpha \ \{R\}, \ \vdash \{R\} \ \beta \ \{Q\}$ compone correcciones parciales, si $Q$ es la postcondición total y $R$ es una postcondición parcial, $\alpha$ y $\beta$ son porciones más pequeñas de proceso.

---

## Formalidad

### Asignación

$$\vdash \{P^t_x\} \ x := t \ \{P\}$$

Después de la asignación, x cumple la misma condición que t antes de ejecutarse la instrucción.

$$\frac{P \Rightarrow Q^t_x}{\{P\} \ x := t \ \{Q\}}$$

en este caso se refuerza la postcondición.

### Condicional

$$\frac{\vdash \{P \land B\} \alpha \{Q\}; \vdash \{P \land \sim B\} \beta \{Q\}}{\vdash \{P\} \ \text{if } B \text{ then } \alpha \text{ else } \beta \ \{Q\}}$$

### Repetición

$$\frac{\vdash \{P \land B\} \alpha \{Q\}}{\vdash \{P\} \ \text{while } B \text{ do } \alpha \text{ elihw} \ \{P \land \sim B\}}$$

La repetición puede generar ejecuciones infinitas, por lo que se introduce un método que permita mostrar la evolución hacia el incumplimiento de la condición de control, a través de una **función de progreso**.

```
while B do α elihw
1. ⊢ I ∧ B ⇒ f ≥ 0
2. ⊢ {I ∧ B ∧ f = A} α {f < A}
```

donde A es algún valor positivo.

---

## Pre y Pos condiciones

Formula las pre y pos condiciones para los siguientes ejercicios.

### Ejemplo 1 — Suma de dos números

$$P \equiv \{x, y \in \mathbb{Z}; x = A; y = B\}$$
$$Q \equiv \{s \in \mathbb{Z}; s = A + B\}$$

Otra opción más general:

$$P \equiv \{x, y \in \text{Numero}; x = A; y = B\}$$
$$Q \equiv \{s \in \text{Numero}; s = A + B\}$$

### Ejemplo 2 — División de dos números

$$P \equiv \{x, y \in \mathbb{Z}; x = A; y = B; y \neq 0\}$$
$$Q \equiv \{c \in \mathbb{Z}; c = A/B\}$$

Otra opción más general:

$$P \equiv \{x, y \in \text{Numero}; x = A; y = B; y \neq 0\}$$
$$Q \equiv \{c \in \text{Numero}; c = A/B\}$$

### Ejemplo 3 — Intercambio de valores

$$P \equiv \{x, y \in \mathbb{Z}; x = A; y = B\}$$
$$Q \equiv \{x = B; y = A\}$$

### Ejemplo 4 — Raíz cuadrada entera

Se desea encontrar la raíz cuadrada entera de un número entero positivo x. Considera que siempre es posible encontrar la respuesta.

$$P \equiv \{x \in \mathbb{Z}; x = A * A; x \geq 0\}$$
$$Q \equiv \{r \in \mathbb{Z}; r = A\}$$

### Ejemplo 5 — Ordenar dos números ascendentemente

$$P \equiv \{x, y \in \mathbb{Z}; x = A; y = B\}$$
$$Q \equiv \{x = \min(A,B); y = \max(A,B)\}$$

### Ejemplo 6 — Ordenar tres números ascendentemente

$$P \equiv \{x, y, z \in \mathbb{Z}; x = A; y = B; z = C\}$$
$$Q \equiv \{(a,b,c) = \text{perm}(A,B,C) \text{ tal que} : a \leq b \leq c\}$$

---

## Verificar

### Ejemplo 1 — Suma

$$P \equiv \{x, y \in \mathbb{Z}; x = A; y = B\}$$

```
sumar(x, y: entero)
inicio
  s: entero
  s = x+y
  retornar s
fin
```

$$Q \equiv \{s \in \mathbb{Z}; s = A + B\}$$

### Ejemplo 4 — Raíz cuadrada entera

$$P \equiv \{x \in \mathbb{Z}; x = A*A; x \geq 0\}$$

```
raizEntera(x: entero)
inicio
  r: entero
  r = sqrt(x)
  retornar r
fin
```

$$Q \equiv \{r \in \mathbb{Z}; r = A\}$$

### Ejemplo 2 — Ordenar tres números enteros ascendentemente

$$P \equiv \{x, y, z \in \mathbb{Z}; x = A; y = B; z = C\}$$

```
ordenar(x, y, z: entero)
inicio
  a, b, c: entero
  si (x < y)
    entonces si (y < z)
              entonces a = x, b = y, c = z
              sino si (x < z)
                   entonces a = x, b = z, c = y
                   sino a = z, b = x, c = y
    sino si (x < z)
         entonces a = y, b = x, c = z
         sino si (y < z)
              entonces a = y, b = z, c = x
              sino a = z, b = y, c = x
  retornar a, b, c
fin
```

$$Q \equiv \{(a,b,c) = \text{perm}(A,B,C) \text{ tal que} : a \leq b \leq c\}$$

---

## Correctitud de iteraciones "mientras"

Se pide realizar un proceso que permita multiplicar dos números enteros mediante sumas.

La especificación general será:

```
x, y, prod: entero
{x = X; y = Y; y ≥ 0}
S
{prod = XY}
```

### El proceso

$$P \equiv \{x = X; y = Y; y \geq 0; x, y \in \mathbb{Z}\}$$

```
multiplicar(x, y: entero)
inicio
  prod: entero
  prod = 0
  mientras (y != 0) hacer
    prod = prod + x
    y = y - 1
  fmientras
  retornar prod
fin
```

$$Q \equiv \{prod = XY; prod \in \mathbb{Z}\}$$

### Correctitud — Tiempo (T)

¿T? Se requiere definir tiempo estimado de realización de la repetición (marcado justo antes del `mientras`).

$$T \equiv Y; \ t \equiv T; \text{ ira disminuyendo hasta llegar a 0}$$

### Correctitud — Invariante (I)

¿INVARIANTE ≡ I? Se requiere definir predicados que permitan ser válidos: antes, mientras y al final de la iteración (marcado antes del `mientras`, dentro del ciclo, y después de `fmientras`).

$$I: \{XY = prod + xy; \ y \geq 0\}$$

Verificar cumplimiento, verificar fin de ejecución....

---

## Práctica 1 — Potencia

Determina el invariante y la función del tiempo de:

$$P \equiv \{x = X; y = Y; y \geq 0; y = 0 \Rightarrow x \neq 0; x, y: \text{entero}\}$$

```
potencia(x, y: entero)
inicio
  z: entero
  z = 1
  mientras (y != 0) hacer
    z = z * x
    y = y - 1
  fmientras
  retornar z
fin
```

$$Q \equiv \{z = X^Y; z: \text{entero}\}$$

**Invariante:**

$$\{X^Y = z * x^y \land y \geq 0\}$$

---

## Práctica 2 — Contador

Determina el invariante y la función del tiempo de:

$$P \equiv \{x = X; x > 0; x: \text{entero}\}$$

```
sumar(x: entero)
inicio
  n: entero
  n = 1
  mientras (n < x) hacer
    n = n + 1
  fmientras
  retornar n
fin
```

$$Q \equiv \{n = X; n: \text{entero}\}$$

---

## Ejemplo — Fibonacci

Dada la serie de Fibonacci:

```
1, 1, 2, 3, 5, 8, 13, 21, 34, ...
```

Definición recursiva:

$$fib(n) = \begin{cases} 1 & \text{si } n = 1 \\ 1 & \text{si } n = 2 \\ fib(n-1) + fib(n-2) & \text{otro caso} \end{cases}$$

### Versión iterativa

```
fibonacci(n: entero)
inicio
  prim, seg, i: entero
  i = 3
  prim = seg = 1
  mientras (i <= n) hacer
    seg = prim + seg
    prim = seg - prim
    i = i + 1
  fmientras
  retornar seg
fin
```

**Preguntas para resolver (20 min):**
- ¿Es correcto?
- ¿Cómo formalizas?

---

## Resumiendo

### Estructura general de correctitud

1. $P$
2. $\{P\}$ Instrucción $\{Q\}$

### Para condicionales (if-else)

1. $P$
2. $\{P \land B\}$ CuerpoSI $\{Q\}$
3. $\{P \land \sim B\}$ CuerpoNO $\{Q\}$

### Para repeticiones (while) — verificación completa

1. $P \Rightarrow I$
2. $\{I \land B\} \ S \ \{I\}$
3. $\{I \land \sim B\} \Rightarrow \{Q\}$
4. $\{I \land B\} \Rightarrow t > 0$
5. $\{I \land B \land t = T\} \ S \ \{t < T\}$

---

## Referencias

- THOMAS H. CORMEN, CHARLES E. LEISERSON, RONALD L. RIVEST, CLIFFORD STEIN (2009), *Introduction to Algorithms, Third Edition*, The MIT Press.
