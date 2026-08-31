# Teoría de números

**Leticia Blanco**
Departamento de Informática - Sistemas
UMSS
30 de agosto de 2024

---

## Teoría de números

Estudio de los números enteros y funciones con valores enteros.

Importancia --> Eficiencia

---

## Números primos

Un numero natural ≥ 2, se considera primo, s.s.i. es divisible por 1 y por sí mismo.

### Algoritmo 1

Intervalo de divisores excepto 1 y n, [2, n − 1]

```java
boolean esPrimo1(int n){
    boolean primo;
    int div;
    primo = false;
    if (n > 1){
        primo = true;
        div = 2;
        while (div <= n-1 && primo){
            primo = n % div != 0;
            div++;
        }
    }
    return primo;
}
```

**O(n)**

### Algoritmo 2

Se reduce el intervalo de divisores [2, √n]

```java
boolean esPrimo2(int n){
    boolean primo;
    int div;
    int lim;
    primo = false;
    if (n > 1){
        primo = true;
        div = 2;
        lim = (int)Math.sqrt(n);
        while (div <= lim && primo){
            primo = n % div != 0;
            div++;
        }
    }
    return primo;
}
```

**O(√n)**

### Algoritmo 3

Se reduce el intervalo de divisores impares [3, √n], el único primo par es 2

```java
boolean esPrimo3(int n){
    boolean primo;
    int div;
    int lim;
    if (n == 2)
        primo = true;
    else if (n == 1 || n % 2 == 0)
        primo = false;
    else {
        primo = true;
        div = 3;
        while (div <= Math.sqrt(n) && primo){
            primo = n % div != 0;
            div += 2;
        }
    }
    return primo;
}
```

### Algoritmo 4

Se reduce el intervalo de divisores primos [2, √n]

```java
boolean esPrimo4(int n){
    boolean primo;
    int ind;
    int[] divs = primos((int)Math.sqrt(n));
    primo = false;
    if (n >= 2){
        ind = 0;
        primo = true;
        while (ind < divs.length && primo){
            primo = n % divs[ind] != 0;
            ind++;
        }
    }
    return primo;
}
```

**O(√n / ln √n)**

---

## Criba de Eratóstenes

Encuentra la lista de números primos menores o iguales a n.
Consiste en eliminar todos los múltiplos de números primos.

**Ejemplo:** Primos ≤ 59

Se van marcando (*) los múltiplos de cada primo encontrado, comenzando por 2, luego 3, 5, 7 (hasta √59 ≈ 7.68), quedando finalmente como primos:

```
2  3  5  7  11 13 17 19 23 29
31 37 41 43 47 49* 53 59
```

(Nota: en la lista final del documento, 49 aparece por error; realmente 49 = 7² no es primo)

La cantidad de operaciones es:

```
n * (1/2 + 1/3 + 1/5 + 1/7 + ... + 1/ultimoPrimo)
```

Donde *ultimoPrimo* es el último del rango acotado por √n.

Por lo que este algoritmo tiene una complejidad: **O(n * log log n)**

---

## Números compuestos

Son aquellos que no son primos.
Se pueden representar de manera única como la multiplicación de sus factores primos.

**Teorema fundamental de la aritmética:**

Todo numero entero se construye como la multiplicación de algún conjunto de números primos.

```
n = 4896 = 2*2*2*2*2*3*3*17 = 2⁵ * 3² * 17   (factorización en potencias de primos)
```

### Factores primos

```java
List<Integer> factores(int n){
    List<Integer> facts;
    int[] primos = primos((int)Math.sqrt(n));
    facts = new ArrayList<Integer>();
    for (int i = 0; i < primos.length; i++){
        while (n % primos[i] == 0){
            n = n / primos[i];
            facts.add(primos[i]);
        }
    }
    return facts;
}
```

**O(√n / ln √n)**

Similar a este es contar los factores primos.

---

## Divisores

¿Cuántos divisores hay?

```java
int nroDivisores(int n){
    int cantidad;
    cantidad = 2; // 1 y n
    for (int i = 2; i <= n/2; i++){
        if (n % i == 0)
            cantidad++;
    }
    return cantidad;
}
```

**O(n/2)**

Otra opción es usando los factores primos, si:

```
n = a^i * b^j * c^k * ... n^z
```

El número de divisores de n es:

```
(i+1) * (j+1) * (k+1) * ... * (z+1)
```

Por ejemplo:

```
60 = 2² * 3¹ * 5¹
```

El número de divisores es:

```
(2+1) * (1+1) * (1+1) = 12
```

**O(√n / ln √n)**

---

## Suma de divisores

¿Cuál es la suma de los divisores de n?

```java
int nroDivisores(int n){
    int suma;
    suma = 1+n;
    for (int i = 2; i <= n/2; i++){
        if (n % i == 0)
            suma += i;
    }
    return suma;
}
```

**O(n/2)**

Otra opción es usando los factores primos, si:

```
n = a^i * b^j * c^k * ... n^z
```

La suma de divisores de n es:

```
(a^(i+1) - 1)/(a - 1) * (b^(j+1) - 1)/(b - 1) * (c^(k+1) - 1)/(c - 1) * ... * (n^(z+1) - 1)/(n - 1)
```

Por ejemplo:

```
60 = 2² * 3¹ * 5¹
```

La suma de los divisores es:

```
(2³-1)/1 * (3²-1)/2 * (5²-1)/4 = 7 * 4 * 6 = 168
```

**O(√n / ln √n)**

---

## Máximo común divisor - mcd

Algoritmo de Euclides:

```java
int mcd(int a, int b){
    return b == 0 ? a : mcd(b, a % b);
}
```

**O(log₁₀ n)** donde n = min(a, b)

---

## Mínimo común múltiplo - mcm

Algoritmo Euclidiano:

```java
int mcm(int a, int b){
    return a * (b / mcd(b, a));
}
```

**O(log₁₀ n)** donde n = min(a, b)

---

## Aritmética Modular

Entender la aritmética modular es importante:

**Definición:**

x módulo N es el residuo de dividir x entre N

```
x = q * N + r; 0 ≤ r < N
```

∴ x módulo N es igual a r

---

## Congruencia Modular

Se dice que x e y son congruentes modulares si:

**Definición:**

```
x ≡ y (mod N)  ⇔  N divide a (x − y)
```

**Ejemplo:**

```
−9 ≡ −6 (mod 3)
−19 ≡ −7 (mod 6)
```

Esto es muy útil, porque bajo algunas condiciones da lo mismo trabajar con -19 que con -7.

---

## Sustitución

**Definición:**

```
x ≡ x' (mod N) ∧ y ≡ y' (mod N)  →  x + y ≡ x' + y' (mod N) ∧ xy ≡ x'y' (mod N)
```

**Ejemplo:**

```
−9 ≡ −6 (mod 3)
−19 ≡ −7 (mod 3)
→ −9 + (−19) ≡ −6 + (−7) (mod 3)
```

**Ejemplo (aplicación):**

Hay 25 episodios de 3 horas, que se empezaron a ver a la medianoche, ¿a qué hora del día se terminará de ver la serie?

```
(25 * 3) mod 24
```

∧

25 ≡ 1 (mod 24), entonces puedo usar 1 en vez de 25 y queda:

1 * 3 = 3 mod 24, lo que significa que terminará de ver a las 3:00 a.m.

**Propiedades:**

```
Asociativa:      x + (y + z) ≡ (x + y) + z (mod N)
Conmutatividad:  xy ≡ yx (mod N)
Distributiva:    x(y + z) ≡ xy + yz (mod N)
```

**Ejemplo:**

¿A qué es equivalente 2³⁴⁵ (mod 31)?

```
2³⁴⁵ ≡ (2⁵)⁶⁹ ≡ 32⁶⁹ ≡ 1⁶⁹ ≡ 1 (mod 31)
```

---

## Costos

Para la forma `x op y (mod N)`:

- Suma modular => **O(n)**
- Resta modular => **O(n)**
- Multiplicación modular => **O(n²)**
- División modular => **O(n³)**

Donde **n = log(N)**

---

## Exponenciación

**Definición:**

```
x^y mod N
```

Se vuelve complejo si se tiene los números x, y, N grandes.

Existe una relación para la exponenciación de la siguiente manera:

```
x mod N → x² mod N → x³ mod N → ... → x^y mod N
```

Si se tiene que n ≡ log y, entonces la exponenciación se puede hacer en **O(n³)**, ya que encontrar toma log y, pero cada vez se hacen multiplicaciones de n-dígitos ≡ n².

---

## División modular

**Definición:**

x es el inverso multiplicativo de a mod N si:

```
ax ≡ 1 mod N
```

### mcd de Euclides extendido

Además de encontrar el mcd, el extendido encuentra los coeficientes x, y de la identidad de Bézout (lema).

**Definición:**

Si d es el mcd(a,b):

```
d = a*x + b*y
```

Aquí bastaría con encontrar los coeficientes x e y.

```java
int x, y;
int euclidesExt(int a, int b){
    int x1, y1, q, t;
    x1 = 0; y1 = 1; y = 0; x = 1;
    while (b != 0){
        q = a/b;
        t = b; b = a % b; a = t;
        t = x1; x1 = x - q * x1; x = t;
        t = y1; y1 = y - q * y1; y = t;
    }
}
```
