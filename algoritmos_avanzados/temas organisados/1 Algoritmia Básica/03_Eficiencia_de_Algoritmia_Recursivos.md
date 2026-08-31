# Eficiencia de Algoritmia — Algoritmos Recursivos

**Leticia Blanco** — Departamento de Informática - Sistemas, UMSS — 21 de agosto de 2024

## Contenido
- Antecedentes
- Método de sustitución
- Teorema Maestro
- Ejercicios

---

## Antecedentes

Procesos recursivos, ¿cómo se mide su complejidad?
- Sustitución
- Teorema maestro

---

## Método de sustitución

Reemplazar las llamadas recursivas por su tiempo de ejecución.

**Forma general**
$$proc(n) = proc(n')$$
$$T_{proc}(n) = T_{proc}(n')$$

### Caso 1: una llamada recursiva

$$
proc(n) =
\begin{cases}
x & si\ n \le 1 \\
proc(n-1)+y & si\ n>1
\end{cases}
\qquad
T_{proc}(n) =
\begin{cases}
c1 & si\ n \le 1 \\
T_{proc}(n-1)+c2 & si\ n>1
\end{cases}
$$

Desarrollo (con $c1 = \Theta(1)$):

$$
\begin{aligned}
T_{proc}(n) &\equiv T_{proc}(n-1) + c2 \\
&\equiv T_{proc}(n-2) + 2*c2 \\
&\equiv T_{proc}(n-3) + 3*c2 \\
&\equiv T_{proc}(n-4) + 4*c2 \\
&\ \ ... \\
&\equiv T_{proc}(n-(n-1)) + (n-1)*c2 \\
&\equiv c1 + (n-1)*c2 \\
&\equiv c1 + n*c2 - c2
\end{aligned}
$$

Por lo que: $T_{proc}(n) = O(n*c2)$

### Caso 2: dos llamadas recursivas

$$
proc(n) =
\begin{cases}
x & si\ n \le 1 \\
proc(n-1)+proc(n-1)+y & si\ n>1
\end{cases}
\qquad
T_{proc}(n) =
\begin{cases}
c1 & si\ n \le 1 \\
2*T_{proc}(n-1)+c2 & si\ n>1
\end{cases}
$$

Desarrollo (con $c1 = \Theta(1)$):

$$
\begin{aligned}
T_{proc}(n) &\equiv 2 T_{proc}(n-1) + c2 \\
&\equiv 2^2\, T_{proc}(n-2) + (2^2-1)c2 \\
&\ \ ...\text{(completar la sustitución)}
\end{aligned}
$$

Se demuestra que: $T_{proc}(n) = O(2^n * c2)$

### Caso 3: tres llamadas recursivas

$$
proc(n) =
\begin{cases}
x & si\ n \le 1 \\
proc(n-1)+proc(n-1)+proc(n-1)+y & si\ n>1
\end{cases}
\qquad
T_{proc}(n) =
\begin{cases}
c1 & si\ n \le 1 \\
3*T_{proc}(n-1)+c2 & si\ n>1
\end{cases}
$$

Desarrollo (con $c1 = \Theta(1)$):

$$
\begin{aligned}
T_{proc}(n) &\equiv 3\, T_{proc}(n-1) + c2 \\
&\equiv 3^2\, T_{proc}(n-2) + (3+1)c2 \\
&\ \ ...\text{(completar la sustitución)}
\end{aligned}
$$

Se demuestra que: $T_{proc}(n) = O(3^n * c2)$

### Caso general: $a_n$ llamadas recursivas

$$
proc(n) =
\begin{cases}
x & si\ n \le 1 \\
\underbrace{proc(n-1)+......+proc(n-1)}_{a_n}+y & si\ n>1
\end{cases}
\qquad
T_{proc}(n) =
\begin{cases}
c1 & si\ n \le 1 \\
a_n*T_{proc}(n-1)+c2 & si\ n>1
\end{cases}
$$

Desarrollo (con $c1 = \Theta(1)$):

$$
\begin{aligned}
T_{proc}(n) &\equiv a_n\, T_{proc}(n-1) + c2 \\
&\equiv a_n^2\, T_{proc}(n-2) + (a_n+1)c2 \\
&\ \ ...\text{(completar la sustitución)}
\end{aligned}
$$

Se demuestra que: $T_{proc}(n) = O(a_n^n * c2)$

---

## Teorema Maestro

Para valores $a \ge 1 \wedge b \ge 1$:

$$
proc(n) =
\begin{cases}
x & si\ n \le 1 \\
\underbrace{proc(\frac{n}{b})+......+proc(\frac{n}{b})}_{a}+y & si\ n>1
\end{cases}
\qquad
T_{proc}(n) =
\begin{cases}
\Theta(1) & si\ n \le 1 \\
a*T_{proc}(\frac{n}{b})+f(n) & si\ n>1
\end{cases}
$$

### Ejemplo (a=2, b=2)

$$
T_{proc}(n) =
\begin{cases}
\Theta(1) & si\ n \le 1 \\
2*T_{proc}(\frac{n}{2})+f(n) & si\ n>1
\end{cases}
$$

Desarrollo:

$$
\begin{aligned}
T_{proc}(n) &\equiv 2\, T_{proc}\left(\frac{n}{2}\right) + f(n) \\
&\equiv 2^2\, T_{proc}\left(\frac{n}{2^2}\right) + (2^2-1)f(n) \\
&\ \ ...\text{(completar la sustitución)}
\end{aligned}
$$

Se demuestra que:

$$T_{proc}(n) = O(2^k * f(n)) = O(2^{\log_2 n} * f(n)) = O(n * f(n))$$

Dado que: $\dfrac{n}{2^k}=1 \Rightarrow n=2^k \Rightarrow \log_2 n = k$

### Forma general (Teorema Maestro)

$$
T_{proc}(n) =
\begin{cases}
\Theta(1) & si\ n \le 1 \\
a*T_{proc}(\frac{n}{b})+f(n) & si\ n>1
\end{cases}
$$

Se demuestra que:

$$T(n) = a^{\log_b n} + f(n) * \dfrac{1-a^{\log_b n}}{1-a}$$

Propiedad: $a^{\log_b n} = n^{\log_b a}$

### Los tres casos del Teorema Maestro

**Caso 1:** Si $f(n) \equiv O(n^c)$; $c < \log_b a$
$$\Rightarrow T(n) = \Theta(n^{\log_b a})$$

**Caso 2:** Si $f(n) \equiv O(n^c * \log^k n)$; $c = \log_b a$; $k>0$
$$\Rightarrow T(n) = \Theta(n^{\log_b a} * \log^{k+1} n)$$

Ejemplo con $k=0$:
$$\Rightarrow T(n) = \Theta(n^1 * \log^1 n) = \Theta(n * \log n)$$

**Caso 3:** Si $f(n) \equiv \Omega(n^c) \wedge a*f(\frac{n}{b}) \le k*f(n)$; $c > \log_b a$; $k>1$
$$\Rightarrow T(n) = \Theta(f(n))$$

---

## Ejercicios

**Complejidad — Búsqueda recursiva**
```
boolean buscar(int[] a, int i, int n, int dato){
    boolean res;
    if (i == n)
        res = false;
    else
        if (a[i] == dato)
            res = true;
        else
            res = buscar(a, i+1, n, dato);
    return res;
}
```
Calcular la complejidad.

**Complejidad — Fibonacci recursivo**
```
int fib(int n){
    int res;
    if (n <= 2)
        res = 1;
    else
        res = fib(n-1) + fib(n-2);
    return res;
}
```
Calcular la complejidad.

**Complejidad — Algoritmo de Euclides (proceso iterativo)**
```
int proceso(int a, int b){
    while (a != b){
        if (a>b)
            a = a - b;
        else
            b = b - a;
    }
    return a;
}
```
Calcular la complejidad.

**Complejidad — proceso mixto (iterativo + recursivo)**
```
int proceso(int n){
    int res, x, i;
    if (n <= 1)
        res = 1;
    else {
        for (i = 1; i <= n; i++){
            x = 1;
            while (x<n){
                x = x*2;
            }
        }
        res = proceso(n/2) + proceso(n/2);
    }
    return res;
}
```
Calcular la complejidad.

---

## Referencias

- THOMAS H. CORMEN, CHARLES E. LEISERSON, RONALD L. RIVEST, CLIFFORD STEIN (2009), *Introduction to Algorithms, Third Edition*, The MIT Press.
