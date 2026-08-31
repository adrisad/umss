# Bitácora de Decisiones

_Última actualización: 2026-08-31_

_Más reciente arriba._

## 2026-08-31 — Entrega v2: idea + marco teórico + bibliografía en LaTeX

- La entrega para la materia se arma como **un solo documento LaTeX** con tres
  partes: Idea del proyecto, Marco teórico y Bibliografía.
- Ubicación: `documento/entregas/v2_2026-08-31/` (carpeta por versión de entrega,
  patrón `vN_AAAA-MM-DD`). Lleva copia de `wordglow.cls` y de las imágenes.
- Formato: clase `wordglow` (`documento/formato/latex/`).
- Se quitó del formato el texto explicativo que la clase imprimía bajo el título
  de referencias ("Formato APA (7.ª edición): orden alfabético…"). El apartado se
  titula "Bibliografía" en esta entrega (redefinición local del entorno
  `referencias`, sin tocar la clase compartida).
- Figuras y tablas fijadas con `[H]` (paquete `float`) + `\raggedbottom` para
  evitar huecos por floats.

## 2026-08-31 — Bibliografía recortada a 4 referencias

- La ingeniera pregunta en clase sobre lecturas concretas, así que la bibliografía
  se limita a **4 fuentes** que el autor debe dominar:
  - Nation, I. S. P. (2013). *Learning vocabulary in another language* (2ª ed.).
  - Roediger, H. L. y Butler, A. C. (2011). The critical role of retrieval
    practice in long-term retention.
  - Schmitt, N. (2008). Instructed second language vocabulary learning.
  - Woźniak, P. A. y Gorzelańczyk, E. J. (1994). Optimization of repetition
    spacing in the practice of learning.
- El marco teórico se reescribió para citar **solo** esas 4.
- La sección BIBLIOGRAFÍA no va dentro del marco teórico: vive en
  `documento/bibliografia/referencias.md`.

## 2026-08-31 — Estilo de redacción

- Voz humana: frases de longitud variable, voz activa, sin clichés de IA, sin
  preámbulos ni cierres genéricos, primera oración = idea principal.
- Aplica a todo texto que redacte Claude para el documento.

## 2026-08-31 — Contenido del marco teórico

- Tabla: vocabulario necesario para hablar y leer en inglés según meta de uso
  (familias de palabras y cobertura léxica), adaptada de Nation (2013).
  **Cifras a verificar contra la fuente antes de entregar.**
- Tabla: cuatro estados de conocimiento de una palabra.
- Figura: estructura de la flashcard y ciclo de recuperación activa (Roediger y
  Butler, 2011).
- Figura: curva de retención con repasos espaciados (Woźniak y Gorzelańczyk, 1994).
- Las dos imágenes de figura traen título y *Nota* incrustados; pendiente
  regenerarlas solo con el gráfico.
