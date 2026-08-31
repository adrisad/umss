# Formato LaTeX — Wordglow

Traducción a LaTeX del diseño `Portada LaTeX.dc.html`, para usarlo como
formato general de la documentación técnica.

Las medidas salen del diseño HTML: lienzo de 816 × 1056 px = 8.5 × 11 in
→ **96 px = 1 in**, **1 px = 0.75 pt**. Las conversiones están anotadas en
`wordglow.cls`.

## Archivos

| Archivo | Para qué |
|---|---|
| `wordglow.cls` | La clase. Cópiala junto a tu `.tex` (o instálala en tu `texmf`). |
| `plantilla.tex` | **Punto de partida.** Copia, renombra y rellena. |
| `ejemplo.tex` | Referencia visual con todos los elementos. |

## Compilar

```powershell
pdflatex plantilla.tex
pdflatex plantilla.tex      # 2ª pasada: índice + arcos de portada (TikZ)
```

En VS Code (LaTeX Workshop) ya está configurada la receta `pdflatex x2` en
`.vscode/settings.json` — solo guarda y compila. Necesita **MiKTeX** o
**TeX Live**; no usa `latexmk` (evita la dependencia de Perl).

## Empezar un documento

```latex
\documentclass[letterpaper]{wordglow}   % o [a4paper]

\wgTitulo{DOCUMENTACI\'ON\\\wgac{T\'ECNICA} DEL\\PROYECTO}
\wgEyebrow{Desarrollo de software}
\wgKicker{Informe final}{Dise\~no y desarrollo}
\wgAutor{Nombre Apellido}
\wgVersion{1.0}
\wgFecha{\today}
\wgMarca{Wordglow}  \wgSubtitulo{Documentaci\'on t\'ecnica}
\wgWeb{...} \wgCorreo{...} \wgTel{...} \wgDireccion{...}

\begin{document}
\maketitle                       % portada
\pagenumbering{roman}\wgindice\clearpage\pagenumbering{arabic}   % índice

\section{...}  \subsection{...}
...
\begin{referencias}\refitem ...\end{referencias}
\wgcierre                         % banda de acento final
\end{document}
```

- El **título** se escribe tal cual sale impreso; `\\` corta línea y
  `\wgac{palabra}` la lleva al color de acento.
- **Encabezado y pie** salen en todas las páginas automáticamente.

## Elementos

| Comando / entorno | Reproduce del diseño |
|---|---|
| `\wgchip{Sección 1}` | chip enmarcado sobre el título |
| `\wgnota{...}` | callout con regla de acento a la izquierda |
| `quote` + `\wgfuente{...}` | cita con regla de acento y atribución en versalitas |
| `\wglabel{...}` | rótulo 10 px, 800, versalita espaciada |
| `\caption{...}` en `figure`/`table` | «Figura N» / «Tabla N» en acento-700 + título en cursiva (APA) |
| `\wgnotafig{...}` | línea «*Nota.* …» bajo figura, tabla o código |
| `\wgplaceholder` / `\wgplaceholder[3in]` | marco de reserva «IMAGEN O DIAGRAMA» |
| `\wgcodigotitulo{...}` + `lstlisting` | «Código N» + título + bloque con regla izquierda |
| `\wgecuacion{fórmula}{n}` | ecuación entre reglas de 1 px con número en acento-700 |
| tablas: `L{ancho}` / `R{ancho}`, `\wgth{}`, `\wgtoprule`, `\wgrowrule` | cabecera versalita + reglas 2 px / 1 px |
| `referencias` + `\refitem` | APA 7: sangría francesa 0.5 in, interlineado doble |
| `\wgcitasenel{...}` | bloque «CITAS EN EL TEXTO» del cierre |

## Personalizar

### Paleta

Los `\definecolor` del bloque **paleta** en `wordglow.cls` son la lectura del
design system *modernist*. Si tienes el `styles.css` real de la carpeta
`_ds/…/`, sustituye estos hex por sus valores exactos:

| Token | Hex actual | Variable CSS |
|---|---|---|
| `wgText` | `#141413` | `--color-text` |
| `wgAccent` | `#C96442` | `--color-accent` |
| `wgAccent700` | `#9B4722` | `--color-accent-700` |
| `wgNeutral700` / `wgNeutral800` | `#6C6C68` / `#4A4A46` | `--color-neutral-700/800` |
| `wgNeutral100` / `wgSurface` | `#F0EEE6` / `#F5F4EF` | `--color-neutral-100` / `--color-surface` |
| `wgDivider` | `#DEDBD1` | `--color-divider` |

### Tipografía

La clase usa **Helvetica** (`helvet`), disponible en cualquier instalación.
La escala de tamaños ya está calcada del diseño, así que solo cambia la
familia en `wordglow.cls`:

```latex
% en vez de \RequirePackage{helvet} :
\RequirePackage[sfdefault]{FiraSans}          % pdfLaTeX, más cercana
% o con XeLaTeX/LuaLaTeX:
\RequirePackage{fontspec}
\setsansfont{Inter}[BoldFont={Inter ExtraBold}]
```

## Notas de compilación

- Segunda pasada obligatoria (índice y `remember picture` de TikZ).
- Avisos residuales sin efecto visible: sustitución de fuente en los
  subíndices matemáticos muy pequeños (Computer Modern < 5 pt). Si quieres
  eliminarlos, compila con XeLaTeX/LuaLaTeX y una fuente OpenType.
