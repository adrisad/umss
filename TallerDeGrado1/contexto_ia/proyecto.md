# Descripción del Proyecto

_Última actualización: 2026-08-31_

## Tema

**Wordglow**: aplicación móvil para aprender a leer en inglés. El usuario lee un
cuento corto diario, generado y graduado con IA a su nivel de vocabulario, con
palabras interactivas que cambian de color según su estado de aprendizaje. Las
palabras que no domina se repasan con flashcards de repetición espaciada.

## Problema

Aprender a leer en L2 se atasca por falta de vocabulario. Las herramientas
existentes resuelven piezas sueltas: los lectores interactivos (LingQ, Readlang)
traducen al tocar pero no programan repaso serio; los gestores de flashcards
(Anki) repasan bien pero sin texto de lectura y obligando al usuario a crear las
tarjetas; Duolingo usa repetición espaciada sobre contenido fijo.

## Idea central

Que el mismo texto que se lee por gusto sea la fuente del estudio deliberado: las
palabras del cuento se vuelven tarjetas de repaso sin que el usuario las escriba,
y un algoritmo tipo SM-2 decide cuándo mostrarlas. Lectura y repaso se alimentan
entre sí.

## Alcance

- Lectura y vocabulario **receptivo** del inglés, app **solo móvil**.
- Progreso en backend; estado de palabra **global** (igual para todos los cuentos).
- Cuatro estados de palabra: nuevo, aprendiendo, dominado, ignorado.
- Acompañamiento multimodal: imagen del cuento + lectura en voz alta (TTS) con
  resaltado que sigue la palabra.
- Gamificación: racha diaria estilo Duolingo, pantalla de celebración.

### Fuera de alcance

Gramática, escritura, producción oral, comprensión auditiva como destreza
evaluada, otros idiomas, certificaciones.

## Problema técnico abierto

Resaltado palabra por palabra durante el TTS en móviles. Los eventos de límite de
palabra de los sintetizadores no son fiables; la solución prevista es usar las
marcas de tiempo del proveedor de voz (speech marks), no temporizadores estimados.

## Reparto de trabajo

- **Adrian**: toda la implementación (backend, frontend/app móvil).
- **Claude**: documentación académica (perfil de proyecto, planteamiento del
  problema, objetivos, alcance, justificación, marco teórico, metodología y demás
  entregables escritos de la materia — Ingeniería Informática, UMSS).

## Estado actual (2026-08-31)

- Maqueta de interfaz prototipada; funcionalidades y pantallas definidas
  (ver `TallerDeGrado1/README.md`).
- Marco teórico en borrador (`documento/02_marco_teorico/README.md`).
- Bibliografía general reducida a 4 referencias
  (`documento/bibliografia/referencias.md`): Nation (2013), Roediger y Butler
  (2011), Schmitt (2008), Woźniak y Gorzelańczyk (1994).
- Entrega v2 (idea + marco teórico + bibliografía) en LaTeX, formato `wordglow`:
  `documento/entregas/v2_2026-08-31/`.

## Tutor

_Pendiente de registrar._
