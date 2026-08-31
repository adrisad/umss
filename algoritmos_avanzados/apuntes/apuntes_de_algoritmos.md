# Apuntes de Algoritmos
 
> Nota: apuntes de un compañero, del semestre pasado.
 
## 1) Búsqueda Exhaustiva
Explorar todas las soluciones posibles hasta encontrar la respuesta correcta.
 
- **Fuerza bruta**: se prueba todos los casos posibles y es más simple que "Búsqueda exhaustiva".
- **Backtracking**: explora posibilidades y va construyendo la solución paso a paso; si detecta que una solución no funciona, retrocede.
  - Diferencia del Backtracking: "puede podar ramas" inválidas antes de construirlas.
- **Espacio de búsqueda**: es el conjunto de soluciones posibles. Mientras más grande, más lento será el algoritmo.
- **Subconjunto que suma X**: dada una lista de enteros N, saber si hay una subsecuencia cuyo elemento suma "X".
## 2) Divide para Vencer
Consiste en dividir un problema grande en uno más pequeño, resolverlos y luego combinar sus resultados.
 
- Dividir → Resolver → Unir resultados
- **MergeSort**: divide el arreglo en mitades, ordena cada mitad y luego mezcla.
- **QuickSort**: elige un pivote, separa menores y mayores, y ordena recursivamente.
- **Bisección**: se usa para encontrar una raíz o valor en una función monótona.
### Diferencias
- Búsqueda Exhaustiva → prueba todas las soluciones posibles.
- Divide para Vencer → divide el problema en subproblemas más pequeños.
- Programación Dinámica → divide, pero guarda resultados repetidos.
- Avaro (Greedy) → toma la mejor decisión en cada paso.
## 3) Algoritmo Avaro (Greedy)
Toma la mejor decisión que pertenece en ese momento.
 
- **MST → Árbol de Recubrimiento Mínimo**: busca conectar todos los vértices de un grafo con la menor suma de peso posible. Usa la menor cantidad de aristas y mantiene el grafo conexo.
- **Kruskal**: construye el MST eligiendo aristas con el menor peso, siempre que no forme ciclo.
- **Prim**: empieza desde un vértice y va agarrando el vértice más barato que conecta el árbol parcial con un nuevo vértice.
- **Set Cover**: consiste en cubrir todos los elementos de un conjunto X usando la menor cantidad de subconjuntos posibles.
- **Huffman**: almacena información en código binario de longitud variable.
  - Símbolo frecuente → código más corto.
  - Símbolo poco frecuente → código más largo.
  - Ningún código debe ser prefijo del otro.
## 4) Algoritmo Avaro 2
- **Cambio de dinero**: fraccionar usando la menor cantidad de contes o monedas posibles.
- **Balanceo de carga**: el problema consiste en distribuir especímenes en contenedores de la forma más balanceada posible.
## 5) Programación Dinámica
Resuelve problemas dividiéndolos en subproblemas y evita recalcular subproblemas, guardándolos en una tabla de respuestas.
 
- **Causa**: subproblemas repetidos + subestructuras óptimas.
- **Top-Down**: es una solución recursiva que empieza desde el problema más grande.
- **Memorización**: es Top-Down, pero guarda resultados.
- **Bottom-Up**: empieza desde los problemas más pequeños hasta los problemas más grandes.
- **Fibonacci**: recursión, memorización y bottom-up.
### Resumen comparativo
- Búsqueda exhaustiva → probar todas las posibilidades.
- Backtracking → construir todas las soluciones paso a paso con restricciones.
- Divide para Vencer → divide en mitades.
- Avaro → elegir el mejor candidato.
- Programación Dinámica → máximo/mínimo con decisiones repetidas.
- Exhaustiva/Backtracking/DP → subconjuntos y permutaciones/combinaciones.
- TSP → exhaustiva o DP: camino mínimo visitando todos.
- Kruskal o Prim → árbol de recubrimiento mínimo.
- Huffman → código de frecuencia.
- Avaro → cubrir intervalos de segmento.
## 6) Programación Lineal
Busca maximizar y minimizar una función usando restricciones.
 
- **Sirve**: para tomar mejores decisiones con recursos limitados.
- **Se usa**: cuando tienes variables, límites y quieres optimizar algo.
### 6.1) Variables de decisión
Son valores que quieres encontrar.
- Ej: x1 = cant. mesas, x2 = cant. sillas.
### 6.2) Función objetivo
Es lo que quieres maximizar y minimizar.
- Ej: máxima ganancia, mínimo costo.
### 6.3) Restricción
Son límites del problema.
- Ej: solo tienes cierta cantidad de madera, tiempo o dinero.
### 6.4) Región factible
Es el conjunto de soluciones que cumplen todas las restricciones.
- Solo dentro de esa zona puede estar la respuesta.
- Ej: tengo 100, solo puedo gastar menos o igual, no mayor.
### 6.5) Método gráfico
Se usa cuando hay 2 variables.
- Dibujar restricciones y encontrar la mejor solución.
- Ayuda a ver el problema visualmente.
### 6.6) Vértices
Son las esquinas de la región factible.
- La mejor solución suele estar en el vértice.
- No existe solución / Existen muchas soluciones / La solución sea no acotable.
Símbolos: `≤`, `≥`, `=`
 
## 6) Geometría Computacional
Cómo resolver problemas geométricos usando algoritmos.
 
- Se trabaja con puntos, líneas, segmentos, polígonos, distancias.
### 6.1) Punto
Representa un espacio. Ej: P = (3,5) → (x, y)
 
### 6.2) Comparación de puntos
Permite ordenar puntos según sus coordenadas.
- Muchos algoritmos necesitan ordenar sus puntos.
### 6.3) Distancia Euclidiana
Mide qué tan lejos están 2 puntos.
 
### 6.4) Producto Cruzado
Sirve para saber si un "giro" va hacia la izquierda y a la derecha, o si los puntos están en la misma recta.
- Se usa en intersecciones segmentadas y Convex Hull.
### 6.5) Orientación
Indica la posición relativa de 3 puntos.
- Giro izquierdo
- Giro derecho
- Colineal
### 6.6) Segmento
Es una línea limitada por 2 puntos (A, B).
 
### 6.7) Intersección de segmento
Determina si dos segmentos se cruzan.
 
### 6.8) Convex Hull
Es el polígono más pequeño que encierra un conjunto de puntos.
 
### 6.9) Graham Scan
Es un algoritmo para construir el Convex Hull.
- Sirve para encontrar el borde exterior de un conjunto de puntos.
- Usa ordenamiento, pila y producto cruzado.
### 6.10) Cercanía entre puntos
Busca los puntos más cercanos entre sí.
- Ej: encontrar las tiendas más cercanas (4-5, 6).
---
 
## 1) Caminos en Grafos
 
### 1.1
Estudia cómo moverse de un nodo a otro dentro de un grafo. Representa ciudades, PC, personas, rutas o conexiones.
- Sirve para encontrar el camino mínimo.
**Distancia entre nodos**: es el camino más corto entre 2 nodos y permite saber qué ruta es mejor.
 
- **BFS (Búsqueda por amplitud)**: recorre el grafo por niveles: primero los vértices más cercanos y luego los más lejanos. Cuando todas las conexiones valen igual.
- **Dijkstra**: encuentra el camino más corto cuando las aristas tienen pesos positivos. Es más útil cuando no todas las conexiones cuestan lo mismo.
- **Bellman-Ford**: encuentra el camino más corto incluso si tienen peso negativo. Sirve cuando quieres reducir el costo, también detecta ciclos negativos.
- **Caminos en DAG**: es un grafo dirigido sin ciclos. Es útil cuando hay orden y dependencia. Usa orden topológico.
## 2) String Matching
Sirve para encontrar pequeños patrones en un texto.
 
- Texto → es donde quieres buscar.
- Patrón → es lo que quieres buscar.
- Alfabeto → los símbolos permitidos.
- Ej: Algoritmos avanzados → texto; ritmo → patrón.
**Prefijo**: al inicio de una palabra.
**Sufijo**: al final de una palabra.
- Ej: Palabra: camino
  - Prefijos: c, ca, cam, cami
  - Sufijos: minog, ino, no, o
### 2.1) Algoritmo inocente o naive
Compara el patrón en cada posición del texto.
- Sirve para búsquedas simples. Fácil de entender pero es lento.
- Ej: "ana" en "banana" prueba posición en posición hasta encontrar el que se parece.
### 2.2) Rabin-Karp
Convierte el patrón y partes del texto en números usando hash.
- Sirve para comparar más rápido.
- Evita comparar letra por letra todo el tiempo.
- Ej: en vez de revisar palabras completas, primero revisa su "código", y si el código coincide, recién verifica la palabra.
### 2.3) Colisiones
Una colisión ocurre cuando 2 cadenas diferentes tienen el mismo hash.
- Por eso Rabin-Karp debe verificar la coincidencia real.
- Pueden tener el mismo número pero no el mismo patrón.
### 2.4) KMP
Es una tabla para no repetir comparaciones.
- Busca patrones de forma eficiente.
- Tiene tiempo lineal y no revisa lo mismo muchas veces.
- Si sabes que coincide, no empiezas desde cero, aprovechas lo que ya sabes.
### 2.5) Distancia de edición
Mide cuántos cambios se necesitan para convertir una palabra en otra.
- Ej: compara palabras parecidas: casa → cama → 1 → Distancia de edición.
## 3) Estructuras para cadenas
Estudia estructuras de datos para guardar datos y buscar palabras o patrones.
- Búsquedas rápidas en textos y diccionarios.
- Se usa cuando hay muchas palabras o consultas que buscar.
### 3.1) Trie
Es un árbol donde se guarda letra por letra.
- Sirve: palabras y prefijos.
- Permite búsquedas rápidas.
- Ej: ca → como
  - raba? es como una auto
  - camino → completado
### 3.2) Trie compacto
Es una versión más reducida del "Trie".
- Junta partes de caminos para ahorrar espacio.
- Guarda palabras usando menos memoria.
- Evita tener nodos innecesarios.
### 3.3) Suffix Tree
Es un árbol que guarda todos los sufijos de un texto.
- Busca patrones dentro de textos largos.
- Es potente para búsquedas repetidas.
### 3.4) Suffix Array
Es un arreglo que guarda todos los sufijos ordenados.
- Busca patrones usando menos memoria que un Suffix Tree.
- Es más compacto.
## 4) Flujos Máximos y Mínimos
Estudia cuánto flujo máximo y mínimo puede pasar desde el punto inicial hasta un punto final dentro de una red.
- Calcula capacidad máxima.
- Tiene caminos con límites de capacidad.
### 4.1) Red de Flujo
Es un grafo dirigido donde cada arista tiene una suma que representa cómo se mueve.
 
### 4.2) Fuente y Sumidero
Fuente es el inicio y el sumidero el final.
- Ej: S = fábrica, T = tienda.
### 4.3) Capacidad
Es el máximo que puede pasar por una arista.
 
### 4.4) Flujo
Es la capacidad real que está pasando.
- Ej: capacidad 10 litros, pasan 6 → flujo = 6.
### 4.5) Conservación de flujo
Es un nodo intermedio: lo que entra debe salir, y evita que aparezcan o desaparezcan mágicamente.
 
### 4.6) Red residual
Muestra cuánto flujo adicional puede pasar.
- Ej: 10 dan salida y entraron 6, todavía hay espacio.
### 4.7) Camino de aumento
Es un camino donde todavía se puede enviar más flujo.
- Ford-Fulkerson usa esto para aumentar su camino.
### 4.8) Ford-Fulkerson
Método que aumenta la cantidad de flujos mientras existan caminos disponibles.
- Sirve para encontrar el flujo máximo.
### 4.9) Teorema MAX-FLOW MIN-CUT
Dice que el flujo máximo es la capacidad del corte mínimo.
- Encuentra el cuello de botella.