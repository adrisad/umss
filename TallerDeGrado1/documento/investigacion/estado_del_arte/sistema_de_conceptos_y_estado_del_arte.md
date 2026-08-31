# Sistema de Conceptos y Estado del Arte

> Documento de Taller de Grado I — UMSS · Proyecto **Wordglow**
> Insumo de trabajo para el Capítulo 2 (Marco Teórico).

_Última actualización: 2026-08-30_

---

## 1. Objeto de estudio

El **aprendizaje de vocabulario de una lengua extranjera (inglés) apoyado por una
aplicación móvil**, en la que la lectura de textos breves con palabras interactivas y
un mecanismo de **repetición espaciada** constituyen el núcleo del proceso de
aprendizaje, y en la que el contenido de lectura se produce mediante **modelos
generativos de lenguaje**.

Dentro de las categorías admitidas por la guía de la materia (algoritmos, técnicas,
tecnología emergente, métodos), el objeto se sitúa principalmente en **algoritmos y
técnicas de aprendizaje asistido por computadora**, con un componente de **tecnología
emergente** (IA generativa).

### Preguntas que ordenan el marco teórico

| Pregunta guía | Concepto que responde |
|---|---|
| ¿Qué quiero conocer? | Aprendizaje de vocabulario en L2 mediado por app móvil |
| ¿Con qué otros elementos se relaciona? | Lectura en L2, memoria y olvido, MALL, TTS, NLG, gamificación |
| ¿Cómo se clasifica? | Aprendizaje incidental/intencional; algoritmos de repetición espaciada (Leitner, SM-2, media-vida) |
| ¿Qué estudios previos existen? | Estado del arte (sección 4) |
| ¿Cómo se aplica? | Flashcards, resaltado por estado, cuento diario, lectura en voz alta |
| ¿Qué debe saber el lector? | Conceptos 2.1 a 2.10 del marco teórico |

---

## 2. Sistema de conceptos (mapa)

```
                         Aprendizaje de vocabulario en L2 (Nation, 2013)
                                        │
        ┌───────────────┬──────────────┼──────────────┬─────────────────┐
        ▼               ▼              ▼              ▼                 ▼
  Lectura en L2   Aprendizaje    Memoria y        Aprendizaje      Gamificación y
  y recon. de     incidental vs. curva del        móvil de         motivación
  palabras        intencional /  olvido           lenguas (MALL)   (SDT, rachas)
  (LaBerge &      input          (Ebbinghaus;     (Kukulska-       (Ryan & Deci;
  Samuels;        comprensible   Cepeda et al.;   Hulme & Shield;  Deterding et al.;
  Grabe)          (Krashen;      Roediger &       Godwin-Jones)    Hamari et al.)
                  Laufer &       Butler)                │
                  Hulstijn)            │                │
                                       ▼                ▼
                             Repetición espaciada   Aprendizaje multimedia
                             y sus algoritmos       + síntesis de voz (TTS)
                             (Leitner; SM-2,        (Mayer; Sweller)
                             Woźniak; Settles &            │
                             Meeder)                       ▼
                                       │          Generación de lenguaje
                                       │          natural con LLM y
                                       ▼          traducción automática
                             Estados de conocimiento   (Vaswani et al.;
                             de la palabra             Brown et al.)
                             (nuevo/aprendiendo/
                             dominado/ignorado)
                                       │
                                       ▼
                             Soporte de software:
                             arquitectura cliente-servidor,
                             API REST, calidad ISO/IEC 25010
                             (Fielding; Sommerville)
```

### 2.1. Conceptos que SÍ forman parte del Capítulo 2

1. Aprendizaje y adquisición de vocabulario en una lengua extranjera (L2).
2. Lectura en L2 y reconocimiento automático de palabras.
3. Aprendizaje incidental vs. intencional de vocabulario e *input* comprensible.
4. Memoria, curva del olvido y práctica distribuida.
5. Repetición espaciada y sus algoritmos (Leitner, SM-2, modelos de media-vida).
6. Estados de conocimiento de una palabra (modelo de niveles).
7. Aprendizaje móvil de lenguas (MALL).
8. Aprendizaje multimedia y síntesis de voz (texto a voz).
9. Generación de lenguaje natural y traducción automática con modelos de lenguaje.
10. Gamificación y motivación (teoría de la autodeterminación, rachas).
11. Soporte de software: arquitectura cliente-servidor, API REST y calidad (ISO/IEC 25010).

### 2.2. Elementos que se usarán pero NO son parte del Capítulo 2

- Lenguajes, frameworks y servicios concretos de implementación (app móvil, backend,
  proveedor de TTS, proveedor de LLM, API de traducción).
- Metodología de desarrollo de software y gestión del proyecto.
- Diseño de interfaz, sistema de diseño visual y accesibilidad de la UI.
- Gramática, escritura, producción oral y comprensión auditiva (fuera de alcance del
  producto).

---

## 3. Definiciones operativas (glosario preliminar del área)

| Término | Definición operativa para el proyecto | Fuente base |
|---|---|---|
| Vocabulario receptivo | Palabras que el aprendiz reconoce y comprende al leer o escuchar, sin necesidad de producirlas. | Nation (2013) |
| Aprendizaje incidental | Adquisición de vocabulario como subproducto de una actividad centrada en el significado (leer un cuento). | Laufer y Hulstijn (2001) |
| *Input* comprensible | Texto ligeramente por encima del nivel actual del aprendiz (i+1) que puede entenderse con apoyo del contexto. | Krashen (1989) |
| Curva del olvido | Descenso aproximadamente exponencial de la retención en función del tiempo transcurrido sin repaso. | Ebbinghaus (1913) |
| Práctica distribuida (*spacing effect*) | Ventaja de retención al separar en el tiempo las repeticiones de un mismo ítem frente a agruparlas. | Cepeda et al. (2006) |
| Práctica de recuperación (*testing effect*) | Mejora de la retención a largo plazo al recuperar activamente la información en lugar de releerla. | Roediger y Butler (2011) |
| Repetición espaciada | Programación algorítmica de los repasos de cada ítem en intervalos crecientes, ajustados al desempeño del aprendiz. | Woźniak y Gorzelańczyk (1994) |
| Sistema de Leitner | Esquema de cajas: el ítem acertado avanza de caja (mayor intervalo) y el fallado retrocede a la primera. | Leitner (1972) |
| Algoritmo SM-2 | Regla de SuperMemo que actualiza el intervalo y un "factor de facilidad" por ítem según una calificación de 0 a 5. | Woźniak y Gorzelańczyk (1994) |
| Modelo de media-vida (*half-life regression*) | Estimación estadística del tiempo en que la probabilidad de recordar una palabra cae a 0,5, a partir del historial del usuario. | Settles y Meeder (2016) |
| MALL | Aprendizaje de lenguas asistido por dispositivos móviles, con contenido y práctica ubicuos y personalizados. | Kukulska-Hulme y Shield (2008) |
| Síntesis de voz (TTS) | Conversión automática de texto escrito en habla; en el proyecto, lectura en voz alta del cuento. | Mayer (2009) |
| Modelo grande de lenguaje (LLM) | Red neuronal de tipo *transformer* entrenada sobre grandes corpus, capaz de generar texto coherente a partir de una instrucción. | Vaswani et al. (2017); Brown et al. (2020) |
| Gamificación | Uso de elementos de diseño de juego (rachas, niveles, celebraciones) en contextos no lúdicos para sostener el compromiso. | Deterding et al. (2011) |
| Motivación intrínseca | Realizar una actividad por la satisfacción inherente; se apoya en competencia, autonomía y relación. | Ryan y Deci (2000) |
| Estado de palabra | Etiqueta del conocimiento del aprendiz sobre una palabra: *nuevo*, *aprendiendo*, *dominado* o *ignorado*. | Elaboración propia a partir de Nation (2013) |

---

## 4. Estado del Arte

### 4.1. ¿Qué se ha dicho y quiénes son los autores de referencia?

- **Adquisición de vocabulario en L2.** Nation (2013) sistematiza qué implica "conocer
  una palabra" (forma, significado, uso) y defiende la combinación de aprendizaje
  intencional y exposición extensiva. Schmitt (2008) revisa la enseñanza explícita y
  concluye que el vocabulario requiere encuentros repetidos y espaciados.
- **Lectura extensiva e *input*.** Krashen (1989) y Day y Bamford (1998) argumentan que
  la lectura abundante de textos comprensibles produce crecimiento incidental de
  vocabulario. Grabe (2009) y LaBerge y Samuels (1974) explican que la fluidez lectora
  depende del reconocimiento automático de palabras, lo que justifica reducir la
  fricción de consulta (traducción y audio inmediatos al tocar una palabra).
- **Memoria y repaso.** Desde Ebbinghaus (1913), la investigación sobre el *spacing
  effect* (Cepeda et al., 2006) y el *testing effect* (Roediger y Butler, 2011; Brown
  et al., 2014) sostiene que repasos espaciados con recuperación activa maximizan la
  retención: es la base psicológica de las flashcards.
- **Algoritmos de repetición espaciada.** El sistema de cajas de Leitner (1972) y el
  algoritmo SM-2 de SuperMemo (Woźniak y Gorzelańczyk, 1994) son los esquemas
  clásicos. Settles y Meeder (2016), con datos de Duolingo, proponen la *half-life
  regression*, un modelo entrenable que supera a SM-2 en predicción de recuerdo.
- **Aprendizaje móvil de lenguas.** Kukulska-Hulme y Shield (2008) y Godwin-Jones
  (2011) describen la evolución del MALL. Vesselinov y Grego (2012) y Loewen et al.
  (2019) reportan evidencia de efectividad y de patrones de uso reales de Duolingo,
  incluida la deserción.
- **Multimedia y voz.** Mayer (2009) y Sweller (1988) fundamentan el diseño de
  materiales que combinan texto, imagen y audio sin sobrecargar la memoria de trabajo,
  lo que respalda incluir imagen del cuento y lectura en voz alta con seguimiento
  visual.
- **IA generativa.** La arquitectura *transformer* (Vaswani et al., 2017) y los modelos
  de pocos ejemplos (Brown et al., 2020) hacen viable generar cuentos graduados por
  nivel bajo demanda; es un uso reciente y poco documentado en la literatura académica
  de didáctica de lenguas.
- **Gamificación.** Deterding et al. (2011), Hamari et al. (2014) y Ryan y Deci (2000)
  encuadran las rachas y celebraciones: pueden aumentar el compromiso, pero su efecto
  es contingente al contexto y al diseño.

### 4.2. Soluciones existentes comparables

| Solución | Contenido de lectura | Repetición espaciada | Palabras interactivas en texto | TTS con seguimiento | Rachas |
|---|---|---|---|---|---|
| Duolingo | Frases y lecciones fijas | Sí (modelo de media-vida) | Parcial | Parcial | Sí |
| Anki | Definido por el usuario | Sí (SM-2 y sucesores) | No | Complementos | No |
| LingQ | Textos reales importados | Sí (estados de palabra) | Sí | Sí, sin resaltado fino | Limitado |
| Readlang | Textos web + traducción al tocar | Flashcards básicas | Sí | Parcial | No |
| **Wordglow (propuesta)** | Cuento diario generado con IA y graduado por nivel | Sí (SM-2/Leitner, prioriza "aprendiendo" y vencidas) | Sí, con 4 estados por color | Objetivo: resaltado palabra a palabra con marcas de tiempo | Sí |

### 4.3. Aspectos analizados y vacío que aborda el proyecto

- La literatura respalda por separado la lectura extensiva, la repetición espaciada y
  el MALL, pero hay **poca evidencia sobre su integración en una sola herramienta**
  donde el propio texto de lectura sea la fuente de las tarjetas de repaso.
- El **contenido de lectura generado con LLM y graduado automáticamente por nivel** es
  una posibilidad muy reciente y aún poco estudiada en didáctica del vocabulario.
- El **resaltado sincronizado palabra por palabra** durante el TTS sigue siendo un
  problema técnico abierto en entornos móviles (eventos de límite de palabra poco
  fiables); requiere marcas de tiempo del proveedor de voz.
- Wordglow se ubica en esa intersección: lectura incidental + repaso espaciado
  explícito + contenido generado + acompañamiento multimodal.

### 4.4. Proceso de elaboración seguido

1. Se identificaron las áreas implicadas a partir de las funcionalidades del producto
   (`README.md`).
2. Se seleccionaron obras primarias canónicas de cada área (manuales y artículos
   revisados por pares) y se descartaron fuentes sin autoría verificable.
3. Se priorizaron las fuentes por cercanía al objeto de estudio (repetición espaciada
   y vocabulario en L2 primero).
4. Pendiente: lectura activa y crítica de cada fuente, y registro en
   `contexto_ia/fuentes_verificadas/`.
