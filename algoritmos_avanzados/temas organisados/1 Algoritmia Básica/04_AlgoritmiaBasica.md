# Algoritmia Básica

**Leticia Blanco**
Departamento de Informática - Sistemas
UMSS
30 de agosto de 2024

---

## Algoritmos de aritmética básica

Las operaciones básicas de aritmética tienen explicaciones fundamentales de realización, las mismas que tienen asociadas su T(n).

Esto depende mucho de las especificaciones sobre las cuales la operación se define.

Es correcto pensar que las operaciones aritméticas básicas toman 1 tiempo de ejecución. Esto si los datos "caben" en representaciones básicas de numeración.

Si no fuera así, entonces hay que entender las operaciones en su naturaleza más primitiva, que es a nivel de bits y considerando leyes fundamentales de los Sistemas de Numeración.

---

## Suma

Suma se realiza dígito a dígito, y es una operación de cuatro partes: *carry, sum1, sum2, suma*.

Por ejemplo, sumar dos números binarios:

```
Carry:      1   1 1 1
          1 1 0 1 0 1   (53)
        +  1 0 0 0 1 1  (35)
        -------------------
          1 0 1 1 0 0 0  (88)
```

### Ejercicio: Suma

¿Qué pasaría si la condición sobre los números de entrada cambia a que:

> la cantidad de dígitos que tienen los números enteros sin signo son menores iguales que 1000?

En este caso, la suma tomaría un **T(n) = n**, donde n es la cantidad de dígitos de los números.

Por lo tanto: **O(n)**

---

## Multiplicación

Multiplicación se realiza dígito a dígito, y genera productos parciales y luego adición.

```
            1 1 0 1
        ×   1 0 1 1
        -----------
            1 1 0 1     (1101 times 1)
          1 1 0 1        (1101 times 1, shifted once)
        0 0 0 0           (1101 times 0, shifted twice)
    + 1 1 0 1               (1101 times 1, shifted thrice)
    -----------------------
    1 0 0 0 1 1 1 1    (binary 143)
```

**Costo es O(n²)** cuando las entradas son grandes.

Si se observa con cuidado la definición de la multiplicación a nivel de bits, se encuentra una relación muy interesante, la misma fue explicada por Al Khwarizmi:

| Doblando | Duplicando | |
|---|---|---|
| 11 | 13 | |
| 5 | 26 | |
| 2 | 52 | (strike out) |
| 1 | 104 | |
| | **143** | (answer) |

Lo interesante es que todo número par en binario termina en 0, y eso no genera producto parcial.

---

## División

División se realiza a través de restas sucesivas.

Ejemplo: 10101 (21) ÷ 101 (5)

```
10101
- 101      1
-------
10000
- 101      10
-------
01011
- 101      11
-------
00110
- 101      100
-------
00001      → resto = 1, cociente = 0100 (4)
```

**Costo es O(n²)** cuando las entradas son grandes.
