# Taller de Grado I

> Documento de Taller de Grado I — UMSS

_Última actualización: 2026-09-02_

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

- Palabras clickeables en el texto que cambian de color según su estado: nuevo, aprendiendo, dominado e ignorado.
- Traducción de palabras vía API al hacer click.
- Cuentos cortos generados automáticamente con IA cada día, ajustados al nivel del usuario.
- Cada cuento incluye una **imagen descriptiva**, agregada manualmente por el creador de la historia.
- **Función de lectura en voz alta (text-to-speech)** del cuento completo, con un **marco/resaltado de color** que sigue la palabra o línea que se está leyendo, para que el usuario pueda seguir la lectura visualmente mientras escucha.
- Progreso de palabras guardado en backend, con estado global (aplica a todos los cuentos, no por cuento individual).
- Sistema de login de usuarios.
- Sistema de racha (streak) tipo Duolingo.
- **Widgets para la pantalla de inicio del teléfono**: acceso directo al cuento del día, vista rápida de la racha y el progreso, y estado del jardín (cuántas plantas necesitan agua o están marchitas) con toque directo a la sesión de repaso, todo sin abrir la app.
- **Modo flashcard con repetición espaciada** para repasar palabras guardadas: tarjetas con la palabra en inglés que se voltean para mostrar traducción, fonética y audio; el intervalo entre repasos crece de forma exponencial con cada acierto y se acorta al fallar, siguiendo un algoritmo tipo SM-2/Leitner; la sesión prioriza las palabras vencidas ese día, empezando por las que están en estado "aprendiendo".

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
7. **Mi jardín (flashcards)** — modo de repaso con repetición espaciada presentado como un jardín: cada palabra en *aprendiendo* o *dominado* es una planta cuya etapa y salud dependen del ciclo de repetición espaciada de esa palabra.

### Mi jardín (flashcards)

Reúne en una sola vista todas las palabras que el usuario está memorizando y las convierte en un jardín que cuida día a día. El jardín no es una lista con adornos: es el lugar donde se hace el repaso.

**Qué planta cada palabra.** Entran al jardín las palabras en estado *aprendiendo* y *dominado*; las *nuevas* y las *ignoradas* no aparecen. Cada planta tiene una etapa de crecimiento que refleja lo avanzado que está su ciclo de repetición espaciada: cuanto más largo es el intervalo alcanzado, más crecida se ve la planta, y las palabras ya *dominadas* se muestran en flor.

**Salud y riego.** Cada palabra tiene una fecha de repaso que fija el algoritmo de repetición espaciada. La salud de su planta depende de cuánto se pasó de esa fecha:

- **Sana** — el usuario la repasó el día establecido.
- **Necesita agua** — pasó un día desde la fecha de repaso.
- **Marchita** — pasaron otras 12 horas sin repasarla.
- **Muerta** — pasaron 2 horas más. La palabra pierde su progreso y vuelve al estado *nuevo*; la planta sale del jardín hasta que el usuario la vuelva a marcar mientras lee. La app avisa al usuario cuando una planta muere.

Regar una planta es repasarla: al resolver su flashcard vuelve a estado sano y se reprograma el próximo repaso con un intervalo más largo. Esto aplica igual a las plantas en flor: una palabra *dominada* también vence, también hay que regarla y también puede morir si se la descuida.

**La flashcard.** Tocar una planta abre su tarjeta: al frente, la ilustración de la planta y la palabra en inglés; al voltearla, la traducción, la transcripción fonética y el audio de pronunciación. Tres botones de resultado —**Otra vez**, **Bien**, **Fácil**— reprograman la palabra: con *Bien* y *Fácil* el intervalo hasta el próximo repaso crece de forma exponencial (más con *Fácil*); *Otra vez* devuelve la palabra al inicio del ciclo y la deja para volver a verla en la misma sesión.

**Sesión de repaso.** Un botón "Regar el jardín" arma una sesión con las plantas que necesitan agua o están marchitas, ordenadas por antigüedad del vencimiento. La sesión muestra cuántas tarjetas quedan y termina en una vista breve de resumen: plantas regadas, aciertos y cuántas siguen pendientes. No hay sesión infinita: si no hay nada vencido, el jardín aparece "todo regado" y no fuerza repaso extra.

**Relación con el resto de la app.** El estado de cada palabra es global: regarla o marcarla en el jardín actualiza el mismo registro que el panel de palabra dentro de un cuento y la pantalla Mi vocabulario. La racha **no** depende del jardín: solo se cumple cuando el usuario termina el cuento del día con el botón correspondiente. El recordatorio diario puede avisar cuando hay plantas marchitas o muertas, y el widget de la pantalla de inicio muestra el conteo de plantas que necesitan agua y abre la sesión de repaso directamente.

**Estado vacío.** Sin palabras en *aprendiendo* ni *dominado*, el jardín muestra tierra preparada y una nota que invita a marcar palabras mientras se lee.

### Gamificación y feedback

- Racha visible de forma permanente en la cabecera, con llama animada y "pop" del número cuando sube.
- **Pantalla de celebración** al terminar el cuento: llama grande con parpadeo y halo, anillos de estallido, el número de racha subiendo del valor anterior al nuevo con rebote, y resumen del día (palabras nuevas, dominadas totales, cuentos leídos).
- Sonidos de interfaz: tono corto al cambiar el estado de una palabra y arpegio ascendente al completar el cuento.

### Interfaz

- Formato **solo móvil**, con barra de navegación inferior de siete pestañas (incluye Jardín).
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
