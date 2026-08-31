# Ejercicio 1 — Complejidad de doble bucle

> Tema: Algoritmia Básica — Eficiencia (cálculo de T(n)). Ver
> [../temas organisados/1 Algoritmia Básica/02_Eficiencia_de_Algoritmia.md](../temas%20organisados/1%20Algoritmia%20B%C3%A1sica/02_Eficiencia_de_Algoritmia.md).

```
for (int i = 0; i ≤ n-1; i += 2)
    for (int j = i+1; j ≤ n-1; j++)
        c = i * j
```

$$
\frac{n-1-(i+1)}{1} + 2
$$

$$
\frac{n-1-0}{2} + 2 = \frac{n-1+4}{2} = \frac{n+3}{2}
$$

$$
\frac{n+3}{2} + \sum_{i=0}^{\frac{n+1}{2}} 4n - \sum_{i=0}^{\frac{n+1}{2}} 2i - \sum_{i=0}^{\frac{n+1}{2}} 3
= \frac{n+3}{2} + 4n + \frac{n+1}{2}(4n) - 2\left(\frac{n+1}{2}\left(\frac{n+1}{2}+1\right)\Big/2\right) - 3\left(\frac{n+1}{2}+1\right)
$$

$$
= \frac{n+3}{2} + 2n^2 + 6n - \frac{n^2}{4} - n - \frac{3}{4} - \frac{3n}{2} - \frac{9}{2}
$$

$$
= \frac{7}{4}n^2 + \frac{n}{2} + 6n - n - \frac{3n}{2} + \frac{3}{2} - \frac{3}{4} - \frac{9}{2}
$$

$$
= \frac{7}{4}n^2 + \frac{13n}{2} - \frac{5n}{2} - \frac{15}{4}
$$

$$
\boxed{= \frac{7}{4}n^2 + 4n - \frac{15}{4}}
$$

$$
T(n) =
\begin{cases}
1 & n = 0 \\[6pt]
\dfrac{7}{4}n^2 + 4n - \dfrac{15}{4} & n > 0
\end{cases}
$$
