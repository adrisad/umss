# Taller de Grado I

> Documento de Taller de Grado I — UMSS

_Última actualización: 2026-08-30_

## Contenido

- [Contexto del proyecto](#contexto-del-proyecto)
- [Funcionalidades principales](#funcionalidades-principales)
- [Funcionalidades definidas en la maqueta](#funcionalidades-definidas-en-la-maqueta)
- [Fuera de alcance](#fuera-de-alcance)
- [Notas de proceso](#notas-de-proceso)

## Contexto del proyecto

Aplicación móvil para aprender a leer en inglés mediante palabras clickeables que cambian de color según su estado de aprendizaje.

Nombre del producto: **Wordglow**.

## Funcionalidades principales

- Palabras clickeables en el texto que cambian de color según su estado: nuevo, aprendiendo, dominado.
- Traducción de palabras vía API al hacer click.
- Cuentos cortos generados automáticamente con IA cada día, ajustados al nivel del usuario.
- Cada cuento incluye una **imagen descriptiva** generada/asociada al contenido del cuento.
- **Función de lectura en voz alta (text-to-speech)** del cuento completo, con un **marco/resaltado de color** que sigue la palabra o línea que se está leyendo, para que el usuario pueda seguir la lectura visualmente mientras escucha.
- Progreso de palabras guardado en backend, con estado global (aplica a todos los cuentos, no por cuento individual).
- Sistema de login de usuarios.
- Sistema de racha (streak) tipo Duolingo.
- **Modo flashcard con repetición espaciada** para repasar palabras guardadas: tarjetas con la palabra en inglés que se voltean para mostrar traducción, fonética y audio; el intervalo de repaso de cada palabra se recalcula según el resultado (la marca el usuario como recordada o no) siguiendo un algoritmo tipo SM-2/Leitner, y prioriza primero las palabras en estado "aprendiendo" y las vencidas ese día.

## Funcionalidades definidas en la maqueta

Detalle de lo que quedó especificado al prototipar la interfaz.

### Estados de palabra

- Cuatro estados, no tres: **nuevo**, **aprendiendo**, **dominado** e **ignorado**.
- El estado *ignorado* es para nombres propios, marcas y topónimos: la palabra deja de contarse en las métricas de vocabulario y no vuelve a marcarse en ningún cuento.
- Codificación por color con fondo redondeado sobre la palabra:
  - Nueva — fondo `#FFCE9C`, texto `#8A3B0D`
  - Aprendiendo — fondo `#A6E9F2`, texto `#0B5568`
  - Dominada — fondo `#D1D5DB`, texto `#374151`
  - Ignorada — sin fondo, texto atenuado
- El estado dominado puede mostrarse sin resalte para no cansar la vista en textos largos.

### Panel de palabra (popover)

Se abre junto a la palabra tocada y contiene:

- La palabra y su **transcripción fonética**.
- **Audio individual** de la palabra (pronunciación).
- **Traducción** obtenida por API.
- **La palabra en contexto**: la oración del cuento donde aparece.
- **Selector de estado** con las cuatro opciones; el cambio se guarda global e inmediatamente.

### Lectura en voz alta

- Botón "Escuchar el cuento" que lee el texto completo en inglés en una sola locución continua.
- El botón alterna entre reproducir y detener, con estado visual mientras suena.
- El audio se **detiene automáticamente** al: terminar el cuento, cambiar de pantalla, abrir el panel de una palabra, abrir otro cuento del historial o salir de la vista.
- Pendiente técnico: el resaltado sincronizado palabra por palabra quedó fuera de la maqueta. El evento de límite de palabra del sintetizador del navegador no es confiable, y sintetizar palabra por palabra corta el audio. Para la app conviene resolverlo con marcas de tiempo del proveedor de TTS (por ejemplo *speech marks*), no con temporizadores estimados.

### Pantallas

1. **Inicio** — cuento del día, nivel actual, racha con los números de los días de la semana, contadores de palabras dominadas y en aprendizaje.
2. **Cuento del día** — imagen del cuento, título en inglés y español, metadatos (fecha, nivel, cantidad de palabras), texto interactivo, leyenda de estados con conteos del cuento, porcentaje de palabras dominadas y botón para terminar.
3. **Historial** — un cuento por día, relegibles, con cantidad de palabras, palabras nuevas y estado de lectura.
4. **Mi vocabulario** — todas las palabras vistas con traducción y fonética, filtrables por estado (todas / nuevas / aprendiendo / dominadas / ignoradas).
5. **Progreso** — racha actual y más larga, palabras dominadas, cuentos leídos, calendario de cinco semanas con los números de día y gráfico de palabras dominadas por semana.
6. **Ajustes de nivel** — nivel de vocabulario (A1–B2), largo del cuento, temas preferidos y hora del recordatorio diario.

### Gamificación y feedback

- Racha visible de forma permanente en la cabecera, con llama animada y "pop" del número cuando sube.
- **Pantalla de celebración** al terminar el cuento: llama grande con parpadeo y halo, anillos de estallido, el número de racha subiendo del valor anterior al nuevo con rebote, y resumen del día (palabras nuevas, dominadas totales, cuentos leídos).
- Sonidos de interfaz: tono corto al cambiar el estado de una palabra y arpegio ascendente al completar el cuento.

### Interfaz

- Formato **solo móvil**, con barra de navegación inferior de seis pestañas.
- **Modo claro y modo oscuro** conmutables desde la cabecera.
- Tipografía Archivo, esquina cero y reglas de 2px según el sistema de diseño Modernist; acento rojo `#ec3013`.

## Fuera de alcance

- Gramática
- Escritura
- Pronunciación
- Comprensión auditiva
- Interacción social
- Otros idiomas
- Certificaciones

## Notas de proceso

- El usuario (Adrian) se encarga de toda la implementación (código, backend, frontend/app móvil).
- Claude apoya principalmente con documentación académica del proyecto: perfil de proyecto, planteamiento del problema, objetivos, alcance, justificación, marco teórico, metodología, y otros entregables escritos que pida la materia (Ingeniería Informática).
