# Eficiencia de Algoritmia

**Leticia Blanco** — Departamento de Informática - Sistemas, UMSS — 21 de agosto de 2024

## Contenido
- Antecedentes
- Análisis de eficiencia
- Tiempo de ejecución (Definición, Ejemplos, Resumen)
- Complejidad (Definición, Propiedades)

---

## Antecedentes

- Correctitud
- Eficiencia

La solución que se presenta debe ser eficiente. Por lo que, las preguntas son:
- ¿Cuánto tardan?
- ¿Es posible medir la lógica de pensamiento?

---

## Análisis de eficiencia

¿Por qué hacer análisis de eficiencia?
- Hay varias soluciones para un problema.
- ¿Cuál es mejor?
- ¿Cómo elegimos?

Uso de recursos: procesador/memoria
Presunción del mundo ideal

Se analiza mediante:
- Tiempo de ejecución
- Complejidad

---

## Tiempo de ejecución

### Definición

Cuenta cada paso primitivo de un algoritmo.

$T_A(n)$: tiempo de ejecución del algoritmo A para una entrada de tamaño n

- Tiempo de ejecución: $T_A(n) \equiv f(n)$
- $T_A(n) \equiv \sum_{i=1}^{k} T_{p_i}(n)$
- $T_{p_i}(n) \equiv$ tiempo de ejecución del paso $p_i$

Expresado como una función matemática, para fines de comparación.

Medir:
- Expresiones (calcular/comparar)
- Instrucciones (pasos)

**Expresiones:**

$$
E =
\begin{cases}
var & \Rightarrow T_E(n) = 1 \\
ctte & \Rightarrow T_E(n) = 1 \\
E_1\ op\ E_2 & \Rightarrow T_E(n) = T_{E1}(n) + T_{E2}(n) + 1 \\
op\ E_1 & \Rightarrow T_E(n) = T_{E1}(n) + 1 \\
(E_1) & \Rightarrow T_E(n) = T_{E1}(n) \\
fn() & \Rightarrow T_E(n) = T_{fn()}(n)
\end{cases}
$$

**Instrucciones:**

- Declaración: `tipo var` → $T(n) \equiv 0$
- Lectura: `leer var` → $T_{in}(n) \equiv 1$
- Escritura: `mostrar E` → $T_{out}(n) \equiv T_E(n)$
- Retorno: `return E` → $T_{ret}(n) \equiv T_E(n)$
- Asignación: `var = E` → $T_{asig}(n) \equiv T_E(n) + 1 \equiv T_E(n)$

Condicional: `if_then_else`
```
if (expBool){
    cuerpoSI
} else {
    cuerpoNO
}
```
$T_{if}(n) \equiv T_{expBool}(n) + max(T_{cuerpoSI}(n), T_{cuerpoNO}(n))$

Repetición por conteo: `for`
```
for (cont = valorIni; cont <= valorFin; cont+=k){
    cuerpo
}
```
$valorIni \le cont \le valorFin;\ +k$

$T_{for}(n) \equiv \dfrac{valorFin-valorIni}{k} + 2 + \left(\dfrac{valorFin-valorIni}{k} + 1\right) * T_{cuerpo}(n)$

Repetición por condición: `while_do`
```
while (expBool){
    cuerpo
}
```
$m \equiv$ número de veces que la expBool se hace verdadera

$T_{while}(n) \equiv (m+1) * T_{expBool}(n) + m * T_{cuerpo}(n)$

Repetición por condición: `do_while`
```
do{
    cuerpo
} while (expBool);
```
$m \equiv$ número de veces que la expBool se hace verdadera

$T_{do}(n) \equiv (m+1) * (T_{expBool}(n) + T_{cuerpo}(n))$

### Ejemplos

**Ejemplo 1**
```
int mayor(int a, int b){
    int c, d;
    c = |a-b|;      // 4
    d = a+b;        // 3
    d = (c+d)/2;    // 5
    return d;       // 1
}                    // total = 13
```
¿Cuál es el T(n)? → $T(n) \equiv 13$; es una función constante, independiente de n.

**Ejemplo 2**
```
int menor(int a, int b, int c){
    int m;
    if (a<b){
        if (a<c){
            m = a;
        } else {
            m = c;
        }
    } else {
        if (b<c){
            m = b;
        } else {
            m = c;
        }
    }
    return m;
}
```
$T(n) \equiv 8$; es una función constante, independiente de n.

**Ejemplo 3**
```
int sumarDig(int n){
    int s;
    s = 0;
    while (n > 0){
        s = s + n%10;
        n = n/10;
    }
    return s;
}
```
Análisis del while: $m \equiv$ número de veces que $n>0$ se cumple:

| n | n>0 | nro veces True |
|---|-----|-----------------|
| n | True | 1 |
| $n/10^1$ | True | 2 |
| $n/10^2$ | True | 3 |
| ... | ... | ... |
| $n/10^{m-1}$ | True | m |
| $n/10^m$ | False | m+1 |

$n/10^{m-1}=1 \Rightarrow n = 10^{m-1} \Rightarrow \log_{10} n = m-1 \Rightarrow \log_{10} n + 1 = m$

$T(n) \equiv 11m + 5$
$T(n) \equiv 11 * (\log_{10} n + 1) + 5$
$T(n) \equiv 11 * \log_{10} n + 16$ — función logarítmica, dependiente de n.

$$
T(n) =
\begin{cases}
11 * \log_{10}n + 16 & \Leftrightarrow n > 0 \\
5 & \Leftrightarrow \text{caso contrario}
\end{cases}
$$

**Ejemplo 4**
```
int sumar(int[] a){
    int n, s;
    n = a.length;
    s = 0;
    for (int i = 0; i < n; i++){
        s = s + a[i];
    }
    return s;
}
```
$T(n) \equiv 4 + 4n$; es una función lineal, dependiente del tamaño de entrada.

**Ejemplo 5 (capicúa)**
```
boolean capicua(int x){
    int c = 1;
    boolean res = true;
    while (x > 9){
        c++;
        x = x/10;
    }
    for (int i = 1; i <= c/2; i++){
        res = res && (x/Math.pow(10,i-1))%10
                  == (x/Math.pow(10,c-i))%10;
    }
    return res;
}
```
$m = \log_{10}x$; $c = \log_{10}x + 1$

$T_{capicua}(x) \equiv 1+1+9m+3+7c+1+1 \equiv 7+9m+7c$
$T_{capicua}(x) \equiv 7 + 9(\log_{10}x) + 7(\log_{10}x+1) \equiv 14 + 16*\log_{10}x$

$$
T(n) =
\begin{cases}
14 + 16 * \log_{10}x & \Leftrightarrow x > 0 \\
7 & \Leftrightarrow \text{caso contrario}
\end{cases}
$$

**Ejemplo 6 (Tarea, sin resolver en el PDF)**
```
int sumaLenta(int a, int b){
    while (a > 0){
        a = a-1;
        b = b+1;
    }
    return b;
}
```

```
void swap(int a, int b){
    int aux;
    aux = a;
    a = b;
    b = aux;
}
```

```
int triangulares(int n){
    int suma;
    int contador;
    suma = 0;
    contador = 1;
    while (contador <= n){
        suma = suma + contador;
        contador = contador + 1;
    }
    return suma;
}
```

### Resumen

Todo proceso puede ser "medido" mediante una función matemática que determina el Tiempo de Ejecución del proceso.

¿Pero es necesario encontrar el T(n)?, ¿por lo menos a este nivel de detalle?

Pues no, lo único que interesa saber es cuán complejo es el proceso.

---

## Complejidad

### Definición

- Abstracción para representar funciones.
- Abstracción asintótica.
- Función representativa.

**O (Big-O)**
Para $c, n_0$ constantes positivas:
$O(g(n)) \equiv \{f(n) / 0 \le f(n) \le c*g(n), \forall n \ge n_0\}$
$f(n) = O(g(n)) \simeq f(n) \le g(n)$

**Ω (Omega)**
Para $c, n_0$ constantes positivas:
$\Omega(g(n)) \equiv \{f(n) / 0 \le c*g(n) \le f(n), \forall n \ge n_0\}$
$f(n) = \Omega(g(n)) \simeq g(n) \le f(n)$

**Θ (Theta)**
Para $c_1, c_2, n_0$ constantes positivas:
$\Theta(g(n)) \equiv \{f(n) / 0 \le c_1*g(n) \le f(n) \le c_2*g(n), \forall n \ge n_0\}$
$f(n) = \Theta(g(n)) \simeq g(n) \le f(n) \le g(n)$

### Propiedades

- $f(n) = \Theta(g(n)) \Rightarrow f(n) = O(g(n))$
- $f(n) = \Theta(g(n)) \Rightarrow f(n) = \Omega(g(n))$

**Teorema:** $f(n) = \Theta(g(n)) \Leftrightarrow f(n) = O(g(n)) \wedge f(n) = \Omega(g(n))$

- $f(n) = f_1(n)+f_2(n) \simeq f(n) = f_1(n) + \Theta(g(n))$, dado que $f_2(n) = \Theta(g(n))$
- $f(n) = f_1(n)+f_2(n) \simeq f(n) = \Theta(max(g_1(n), g_2(n)))$, dado que $f_1(n) = \Theta(g_1(n)) \wedge f_2(n)=\Theta(g_2(n))$

**Transitividad**
- $f(n)=\Theta(g(n)) \wedge g(n)=\Theta(h(n)) \Rightarrow f(n)=\Theta(h(n))$
- $f(n)=O(g(n)) \wedge g(n)=O(h(n)) \Rightarrow f(n)=O(h(n))$
- $f(n)=\Omega(g(n)) \wedge g(n)=\Omega(h(n)) \Rightarrow f(n)=\Omega(h(n))$

**Reflexiva**
- $f(n)=\Theta(f(n))$
- $f(n)=O(f(n))$
- $f(n)=\Omega(f(n))$

**Simetría**
- $f(n)=\Theta(g(n)) \Leftrightarrow g(n)=\Theta(f(n))$

**Simetría transpuesta**
- $f(n)=O(g(n)) \Rightarrow g(n)=\Omega(f(n))$

**Relación de orden**
- $f(n)=O(g(n))$; $a \le b$
- $f(n)=\Theta(g(n))$; $a = b$
- $f(n)=\Omega(g(n))$; $a \ge b$

Para fines de comparación y determinación de eficiencia, usualmente se considera O; para determinar la optimalidad se utiliza Θ.

**¿Cómo determinar g(n) dado f(n)?**

Si $f(n) = t_1+t_2+t_3+...t_k$, se identifica el término $t_j$ que sea el mayor de todos; ese término es el candidato a ser $g(n)$.

**Ejemplo:** Si $f(n) = \dfrac{9n}{10}+13$, el término más pesado es $\dfrac{9n}{10}$. Como $\dfrac{9}{10}$ es constante, se descarta y el candidato es $g(n) = n$.

Se demuestra: $f(n) = O(g(n))$ con $c=2$, $n_0=12$, cumpliendo $f(n) \le c*g(n)$ para $n \ge n_0$.

$$
f(n) = O(g(n)) \iff \exists c, n_0 \text{ tal que } \forall n \ge n_0,\ f(n) \le c*g(n)
$$

**Ejemplo con $T_{capicua}(x) = 14 + 16*\log_{10}x$:**
Término más pesado: $16*\log_{10}x$ → candidato $g(x)=\log_{10}x$.

Se demuestra: $14+16*\log x = O(\log n)$ con $c=23$, $n_0=100$.

### Funciones (propiedades matemáticas útiles)

**Monotonicidad**
- $f(n)$ monótonamente incremental ssi $m \le n \Rightarrow f(m) \le f(n)$
- $f(n)$ monótonamente decremental ssi $m \ge n \Rightarrow f(m) \ge f(n)$
- $f(n)$ estrictamente incremental ssi $m < n \Rightarrow f(m) < f(n)$
- $f(n)$ estrictamente decremental ssi $m > n \Rightarrow f(m) > f(n)$

**Piso/Techo**
$x-1 \le \lfloor x \rfloor \le x \le \lceil x \rceil \le x+1$
$\forall n \in \mathbb{Z}, \lfloor n/2 \rfloor + \lceil n/2 \rceil = n$
$\forall n \in \mathbb{R}_0^+, \wedge a,b \in \mathbb{Z}^+$:
- $\lceil \lceil n/a \rceil /b \rceil = \lceil n/ab \rceil$
- $\lfloor \lfloor n/a \rfloor /b \rfloor = \lfloor n/ab \rfloor$
- $\lceil a/b \rceil \le (a+(b-1))/b$
- $\lfloor a/b \rfloor \ge (a-(b-1))/b$

**Polinomial**
Dado un polinomio de grado d, $p(n) = \sum_{i=0}^{d} a_i * n^i$ ⇒ $p(n) = \Theta(n^d) \Rightarrow O(n^d)$

**Exponencial**
$\forall a \in \mathbb{R}^+$:
- $a^0=1$, $a^1=a$, $a^{-1}=1/a$
- $(a^m)^n = a^{mn} = (a^n)^m$
- $a^m * a^n = a^{m+n}$
- $\forall n \wedge a \ge 1 \Rightarrow a^n$ es monótonamente incremental en n

**Logaritmos**
$\forall a \in \mathbb{R}, b>0, c>0$ (bases $>1$):
- $a = b^{\log_b a}$
- $\log_c(ab) = \log_c a + \log_c b$
- $\log_b a^n = n*\log_b a$
- $\log_b a = \dfrac{\log_c a}{\log_c b}$
- $\log_b \dfrac{1}{a} = -\log_b a$
- $a^{\log_b c} = c^{\log_b a}$
- $\dfrac{x}{1+x} \le \ln(1+x) \le x$
- $\forall b>1 \wedge n>0 \Rightarrow \log_b n$ es estrictamente incremental en n

### Ejercicio propuesto

Indica si $f(n) = O(g)$ o $f = \Omega(g)$ o ambos:

| f(n) | g(n) |
|---|---|
| $n-100$ | $n-200$ |
| $n^{1/2}$ | $n^{2/3}$ |
| $100n+\log n$ | $n+(\log n)^2$ |
| $n\log n$ | $10n\log 10n$ |
| $\log 2n$ | $\log 3n$ |
| $10\log n$ | $\log(n^2)$ |
| $n^{1,01}$ | $n\log^2 n$ |
| $n^2/\log n$ | $n(\log n)^2$ |
| $n^{0,1}$ | $(\log n)^{10}$ |

---

## Referencias

- THOMAS H. CORMEN, CHARLES E. LEISERSON, RONALD L. RIVEST, CLIFFORD STEIN (2009), *Introduction to Algorithms, Third Edition*, The MIT Press.
