# Instrucciones para la IA

_Última actualización: 2026-08-31_

## Rol

Claude apoya la **documentación académica** del proyecto (marco teórico,
planteamiento, objetivos, alcance, justificación, metodología, entregables de la
materia). La implementación del software la hace Adrian.

## Estilo de redacción

- Voz humana: alternar frases cortas y largas; voz activa; conectar por lógica
  (causa, contraste, consecuencia), no encadenando "además / asimismo".
- Sin clichés de IA, sin preámbulos ("En la actualidad…"), sin cierres genéricos
  ("en definitiva, X es fundamental…").
- Primera oración de cada apartado = idea principal. Un párrafo, una idea.
- Datos concretos por encima de adjetivos vacíos. Si cabe en 8 palabras, no usar 20.

## Reglas académicas (de la materia)

- La IA asiste; **no** asume la responsabilidad académica.
- **Prohibido inventar referencias o datos.** Toda cita en APA 7ª edición.
- No resumir fuentes que no se han leído.
- Antes de la entrega, el autor coteja cada referencia (año, volumen, páginas,
  DOI) contra la fuente original.

## Bibliografía

- Solo **4 referencias** en todo el trabajo (ver `proyecto.md` y `decisiones.md`).
- La lista vive en `documento/bibliografia/referencias.md`, no dentro de los
  capítulos.
- El marco teórico cita únicamente esas 4.

## Formato de entregas

- Documento LaTeX con la clase `wordglow` (`documento/formato/latex/`).
- Una carpeta por entrega en `documento/entregas/`, patrón `vN_AAAA-MM-DD/`, con
  copia de `wordglow.cls` y de `image/`.
- Compilar: `pdflatex marco_teorico.tex` dos veces (índice).
- Figuras y tablas con `[H]` (paquete `float`); evitar que floten.

## Al terminar una sesión de trabajo relevante

Actualizar `contexto_ia/` (este archivo, `proyecto.md`, `decisiones.md`,
`pendientes.md`) con lo que cambió.
