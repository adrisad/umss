# Problemas de Programacion - PPP

---

## Question 1 (25.00 pts) - La rana que estaba cantando debajo del agua

Hay un cantico infantil que dice:

> La rana que estaba sentada cantando debajo del agua,
> cuando la rana salio a cantar vino una mosca y la hizo callar
> cuando la mosca salio a cantar vino un raton y le hizo callar
> cuando el raton salio a cantar vino el gato y le hizo callar
> ....

Este cantico puede ser tan largo como se quiera, lo unico que se necesita es establecer los personajes que participan en ella, que ademas tienen al parecer una relacion de poder-sometimiento entre ellos. Por ejemplo, el gato al raton, el raton a la mosca y asi... Por cada relacion de poder-sometimiento se tiene una linea en el cantico. Como podras apreciar el cantico tiene tantas lineas como personajes mantienen esa relacion de poder-sometimiento.

La tarea es encontrar cual seria el cantico mas largo que se puede construir dado que se tiene un conjunto de personajes y sus relaciones de poder-sometimiento.

### Entrada

La entrada puede contener varios casos. Cada caso inicia con dos enteros N y R:
- N: numero de personajes
- R: numero de relaciones de poder-sometimiento

A continuacion se tienen N lineas con los personajes que puede tener el cantico; cada personaje esta descrito por su nombre, el mismo que esta escrito en minusculas y es solo una palabra; los nombres a lo sumo tienen 20 caracteres.

Luego le siguen R lineas, cada una de ellas tiene dos nombres de personajes separados por un espacio, donde el primer personaje identifica al sometido y el segundo al que tiene el poder. Ningun personaje se somete a si mismo.

Los casos terminan cuando se encuentran dos 0's.

**Restricciones:** (1 <= N <= 5000); (0 <= R <= 5000)

### Salida

Por cada caso de entrada se debe emitir en una linea, el numero de lineas que contendra el cantico mas largo.

### Sample input 1
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

### Sample output 1
```
4
```

---

## Question 2 (25.00 pts) - Relacion de cubos

Los numeros tienen propiedades muy interesantes. La representacion de un numero sobre la base de otros sometiendolos a operaciones matematicas es muy comun. En esta ocasion observamos esta relacion: que indica que algunos numeros al cubo pueden ser representados por la suma de tres numeros distintos al cubo. En algunos casos incluso puede tener mas de una equivalencia.

Por ejemplo, el 41, tiene dos posibles relaciones de equivalencia:

41^3 = 2^3 + 17^3 + 40^3

41^3 = 6^3 + 32^3 + 33^3

La tarea consiste en encontrar todos aquellos numeros menores a N que tienen esta equivalencia.

### Entrada

Se pueden tener varios casos de entrada. Cada caso tiene un numero entero M que indica el limite del rango de valores [1,M] en el cual hay que buscar cuales tienen la relacion de equivalencia descrita. (1 <= M <= 400)

El conjunto de casos termina cuando M es 0.

### Salida

Por cada caso de entrada se debe emitir todos los posibles numeros que tienen la relacion de equivalencia antes descrita, en el rango [1,M]. El formato de la respuesta debe ser:

```
n = a,b,c
```

donde n es el numero que elevado al cubo, puede ser representado por la suma de los cubos de los tres numeros a, b, c; donde a,b,c > 1. Si n tiene mas de una posible respuesta se deben emitir todas, ordenadas a su vez por los valores de las triplas a,b,c.

### Sample input 1
```
10
20
0
```

### Sample output 1
```
6 = 3,4,5
6 = 3,4,5
12 = 6,8,10
18 = 2,12,16
18 = 9,12,15
19 = 3,10,18
20 = 7,14,17
```

> **Nota:** El codigo debe poder imprimir el sample output a partir del sample input dado. Sin embargo, el codigo se ejecuta contra multiples casos de prueba ocultos, por lo que debe pasar tambien esos casos ocultos.

---

## Preguntas teoricas (ya incluidas en examenes_algoritmos_avanzados.md)

Las siguientes preguntas de estas capturas ya fueron transcritas en el archivo `examenes_algoritmos_avanzados.md`:

- Pregunta sobre INVARIANTE y funcion de TIEMPO del algoritmo `cifras(int n)` (triple de Hoare).
- Pregunta sobre tiempo de ejecucion T(n) del algoritmo `misterio(int n)` con bucles anidados `i` y `j`.
