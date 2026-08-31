%% ===================================================================
%% wordglow.cls -- formato general de documentacion tecnica
%% Adaptacion fiel a LaTeX del disenio "Wordglow" (Portada LaTeX.dc.html).
%%
%% Todas las medidas provienen del disenio HTML: el lienzo es de
%% 816 x 1056 px = 8.5 x 11 in, o sea 96 px = 1 in.  Las conversiones
%% aparecen anotadas como  <px> -> <in|pt>  en cada bloque.
%%
%% Uso:  \documentclass[letterpaper]{wordglow}   % o [a4paper]
%% ===================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wordglow}[2026/08/30 v2.0 Documentacion tecnica Wordglow]

\newif\ifwg@afour
\DeclareOption{a4paper}{\wg@afourtrue}
\DeclareOption{letterpaper}{\wg@afourfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{letterpaper}
\ProcessOptions\relax

\LoadClass[11pt]{article}

%% ---------------------------------------------------------------- paquetes
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[spanish]{babel}
\RequirePackage{amsmath}
%% Latin Modern: fuentes matematicas escalables a cualquier tamanio (evita
%% las sustituciones de Computer Modern en los subindices muy pequenios).
\RequirePackage{lmodern}
\RequirePackage{geometry}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{enumitem}
\RequirePackage{array}
\RequirePackage{caption}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{fancyhdr}
\RequirePackage{listings}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage[hidelinks,plainpages=false,pdfpagelabels=false]{hyperref}
%% microtype: se usa por \textls (versalitas espaciadas del disenio) y por
%% la mejora de justificacion.  patch=none desactiva sus parches opcionales
%% a \footnote/\toc/etc.: titletoc ya redefine esas macros y microtype
%% avisaba en cada compilacion sin ningun efecto visible.
\RequirePackage[patch=none]{microtype}
\usetikzlibrary{calc}
\setlength{\TPHorizModule}{1in}
\setlength{\TPVertModule}{1in}
\TPMargin{0pt}

%% ---------------------------------------------------------------- paleta
%% Tokens del design system "modernist" del disenio original.
\definecolor{wgText}{HTML}{141413}        % --color-text
\definecolor{wgAccent}{HTML}{C96442}      % --color-accent
\definecolor{wgAccent700}{HTML}{9B4722}   % --color-accent-700
\definecolor{wgNeutral700}{HTML}{6C6C68}  % --color-neutral-700
\definecolor{wgNeutral800}{HTML}{4A4A46}  % --color-neutral-800
\definecolor{wgNeutral100}{HTML}{F0EEE6}  % --color-neutral-100
\definecolor{wgSurface}{HTML}{F5F4EF}     % --color-surface
\definecolor{wgDivider}{HTML}{DEDBD1}     % --color-divider
\color{wgText}

%% ---------------------------------------------------------------- tipografia
%% El disenio usa una sans geometrica de peso 800 para titulos y una sans
%% de texto para el cuerpo.  Helvetica es la sustituta libre mas cercana
%% disponible en cualquier instalacion; ver README para cambiarla.
\RequirePackage{helvet}
\renewcommand{\familydefault}{\sfdefault}
\newcommand{\wgheadfont}{\sffamily\bfseries}   % var(--font-heading), 800
\newcommand{\wgbodyfont}{\sffamily}            % var(--font-body)

%% Escala de tamanios calcada del disenio (1 px = 0.75 pt).
%%   cuerpo 13.5px/1.75  ->  10.13pt/17.72pt
\renewcommand\normalsize{%
  \@setfontsize\normalsize{10.13}{17.72}%
  \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
  \belowdisplayskip \abovedisplayskip
  \abovedisplayshortskip \z@ \@plus3\p@
  \belowdisplayshortskip \abovedisplayshortskip}
\renewcommand\small{\@setfontsize\small{9}{15.75}}          % 12px/1.75
\renewcommand\footnotesize{\@setfontsize\footnotesize{7.88}{12.6}} % 10.5px/1.6
\renewcommand\scriptsize{\@setfontsize\scriptsize{7.13}{12.5}}     % 9.5px/1.75
\renewcommand\tiny{\@setfontsize\tiny{6}{9}}
\renewcommand\large{\@setfontsize\large{11.25}{15}}         % 15px
\renewcommand\Large{\@setfontsize\Large{18}{20.7}}          % 24px/1.15
\renewcommand\LARGE{\@setfontsize\LARGE{19.5}{22}}          % 26px
\renewcommand\huge{\@setfontsize\huge{22.5}{25}}            % 30px
\renewcommand\Huge{\@setfontsize\Huge{37.5}{39.75}}         % 50px/1.06
\normalsize

\setlength{\parindent}{0pt}
\setlength{\parskip}{10.5pt}   % ~= margin-bottom:14px de los <p> del disenio

%% Rotulos versalita espaciada del disenio (letter-spacing en em -> 1/1000)
\newcommand{\wgtrack}[2][120]{\textls[#1]{\MakeUppercase{#2}}}
%% Rotulo pequenio: 10px, 800, letter-spacing .14em
\newcommand{\wglabel}[1]{{\wgheadfont\fontsize{7.5}{10}\selectfont\textls[140]{\MakeUppercase{#1}}}}
%% Logotipo "Wordglow" con la segunda mitad en acento
\newcommand{\wglogo}[1][19.5]{{\wgheadfont\fontsize{#1}{#1}\selectfont Word\textcolor{wgAccent}{glow}}}

%% ---------------------------------------------------------------- geometria
%% Hojas interiores del disenio: padding 1.5in (arriba) 1in (lados) 1in.
%% Encabezado anclado a 0.55in del borde superior; pie a 0.6in del inferior.
%% El pie del disenio ocupa de 0.60in a 0.85in desde el borde inferior, asi
%% que la linea base del pie queda a 0.68in.  El bloque de texto termina en
%% 1.15in para dejar aire entre la ultima linea (o una nota al pie, que vive
%% dentro del bloque) y el filete de acento: con bottom=1in el filete
%% cruzaba por encima de la nota.
%% headheight = alto real del bloque de cabecera (bloque de contacto de 3
%% lineas + hueco + filete): fancyhdr pide 51.6pt, o sea 0.72in.  Si se le
%% queda corto, el logo se descuelga.  headsep se calcula para que el borde
%% superior de la cabecera caiga en 0.55in:  1.5 - 0.72 - 0.23 = 0.55.
\ifwg@afour
  \geometry{a4paper,top=1.5in,bottom=1.15in,left=1in,right=1in,
    headheight=0.72in,headsep=0.23in,footskip=0.47in}
\else
  \geometry{letterpaper,top=1.5in,bottom=1.15in,left=1in,right=1in,
    headheight=0.72in,headsep=0.23in,footskip=0.47in}
\fi
%% Aire entre el cuerpo y el bloque de notas al pie
\setlength{\skip\footins}{18pt}

%% ---------------------------------------------------------------- metadatos
\newcommand{\wg@marca}{Wordglow}
\newcommand{\wg@eyebrow}{Desarrollo de software}
\newcommand{\wg@subtitulo}{Documentaci\'on t\'ecnica}
\newcommand{\wg@kicker}{Informe final}
\newcommand{\wg@kickerdos}{Dise\~no y desarrollo}
\newcommand{\wg@web}{www.wordglow.com}
\newcommand{\wg@correo}{contacto@wordglow.com}
\newcommand{\wg@tel}{+591 000 0000}
\newcommand{\wg@direccion}{Av. Ejemplo 123, Cochabamba, Bolivia}
\newcommand{\wg@autor}{Nombre Apellido}
\newcommand{\wg@version}{1.0}
\newcommand{\wg@fecha}{\today}
%% El titulo de portada se escribe TAL CUAL sale impreso (el disenio lo lleva
%% en caja alta) y admite saltos de linea manuales (\\) mas \wgac{...} para
%% llevar una palabra al color de acento.
\newcommand{\wgac}[1]{\textcolor{wgAccent}{#1}}
\gdef\wg@titulo{DOCUMENTACI\'ON\\\wgac{T\'ECNICA} DEL\\PROYECTO}

\newcommand{\wgMarca}[1]{\renewcommand{\wg@marca}{#1}}
\newcommand{\wgEyebrow}[1]{\renewcommand{\wg@eyebrow}{#1}}
\newcommand{\wgSubtitulo}[1]{\renewcommand{\wg@subtitulo}{#1}}
\newcommand{\wgKicker}[2]{\renewcommand{\wg@kicker}{#1}\renewcommand{\wg@kickerdos}{#2}}
\newcommand{\wgWeb}[1]{\renewcommand{\wg@web}{#1}}
\newcommand{\wgCorreo}[1]{\renewcommand{\wg@correo}{#1}}
\newcommand{\wgTel}[1]{\renewcommand{\wg@tel}{#1}}
\newcommand{\wgDireccion}[1]{\renewcommand{\wg@direccion}{#1}}
\newcommand{\wgAutor}[1]{\renewcommand{\wg@autor}{#1}}
\newcommand{\wgVersion}[1]{\renewcommand{\wg@version}{#1}}
\newcommand{\wgFecha}[1]{\renewcommand{\wg@fecha}{#1}}
\newcommand{\wgTitulo}[1]{\gdef\wg@titulo{#1}}

%% ---------------------------------------------------------------- encabezado / pie
%% Encabezado: logotipo 26px a la izquierda, bloque de contacto 9.5px a la
%% derecha, y regla de acento de 2px 8px por debajo.
%% El disenio alinea marca y contacto por ARRIBA (align-items:flex-start),
%% no por la linea base.  El \vspace{0pt} inicial hace que la minipage [t]
%% se alinee por el borde superior del contenido y no por su primera linea
%% base, que es lo que descolgaba el bloque de contacto respecto del logo.
\newcommand{\wg@headleft}{%
  \begin{minipage}[t]{2.4in}\vspace{0pt}\wglogo[19.5]\end{minipage}}
\newcommand{\wg@headblock}{%
  \begin{minipage}[t]{4in}\vspace{0pt}\raggedleft
    \scriptsize\color{wgNeutral800}%
    {\bfseries\textls[80]{\MakeUppercase{\wg@web}}}\par
    \wg@correo\ \textperiodcentered\ \wg@tel\par
    \wg@direccion
  \end{minipage}}

\fancypagestyle{wordglow}{%
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \fancyhead[L]{\wg@headleft}
  \fancyhead[R]{\wg@headblock}
  \fancyfoot[L]{{\wgheadfont\fontsize{7.5}{10}\selectfont\color{wgAccent700}%
      \textls[100]{\MakeUppercase{\wg@marca}}}%
    {\fontsize{7.5}{10}\selectfont\color{wgAccent700}%
      \textls[100]{\MakeUppercase{\ \textperiodcentered\ \wg@subtitulo}}}}
  \fancyfoot[R]{{\wgheadfont\fontsize{7.5}{10}\selectfont\color{wgAccent}\thepage}}
}
%% Reglas de acento de 2px (= 1.5pt) pegadas al bloque, con el hueco de 8px.
\renewcommand{\headrule}{\vskip6pt{\color{wgAccent}\hrule height 1.5pt}}
\renewcommand{\footrule}{{\color{wgAccent}\hrule height 1.5pt}\vskip6pt}
\pagestyle{wordglow}

%% ---------------------------------------------------------------- titulos
%% h2 24px/1.15 con el numero en acento; h3 15px.
\titleformat{\section}
  {\wgheadfont\Large}
  {\textcolor{wgAccent}{\thesection.}}{0.42em}{}
\titleformat{\subsection}
  {\wgheadfont\large}
  {\textcolor{wgAccent}{\thesubsection}}{0.42em}{}
\titleformat{\subsubsection}
  {\wgheadfont\normalsize}
  {\textcolor{wgAccent}{\thesubsubsection}}{0.42em}{}
\titleformat{name=\section,numberless}{\wgheadfont\Large}{}{0pt}{}
%% margenes: h2 0 0 18px ; h3 24px 0 8px
\titlespacing*{\section}{0pt}{18pt}{13.5pt}
\titlespacing*{\subsection}{0pt}{18pt}{6pt}
\titlespacing*{\subsubsection}{0pt}{14pt}{6pt}

%% Chip "Seccion 1": recuadro de 1px, 10px 800, letter-spacing .14em
\newcommand{\wgchip}[1]{%
  \par\noindent
  {\color{wgAccent700}\fboxsep=0pt\relax
   \setlength{\fboxrule}{0.75pt}%
   \fbox{\rule[-3.5pt]{0pt}{14pt}\hspace{9pt}\wglabel{#1}\hspace{9pt}}}%
  \par\vskip12pt}

%% ---------------------------------------------------------------- indice
%% Filas con regla superior de 1px en color divisor, numero en la primera
%% columna de 44px y regla inferior de 2px en acento al cerrar el bloque.
\newlength{\wg@tocnum}\setlength{\wg@tocnum}{44px}
%% padding 11px -> 8.25pt arriba y abajo; interlineado propio de fila
\newcommand{\wg@tocrule}{\par\noindent{\color{wgDivider}\hrule height 0.75pt}\vskip8.25pt}
\newcommand{\wg@tocfont}{\fontsize{10.13}{13.5}\selectfont}
\titlecontents{section}[0pt]
  {\wg@tocrule\wg@tocfont}
  {\makebox[\wg@tocnum][l]{\wgheadfont\color{wgAccent}\thecontentslabel}}
  {\makebox[\wg@tocnum][l]{}}
  {\hfill{\wgheadfont\color{wgNeutral700}\thecontentspage}}
  [\vskip8.25pt]
\titlecontents{subsection}[0pt]
  {\wg@tocrule\wg@tocfont}
  {\makebox[\wg@tocnum][l]{\wgheadfont\color{wgNeutral700}\thecontentslabel}%
   \hspace{13.5pt}\color{wgNeutral800}}
  {\makebox[\wg@tocnum][l]{}\hspace{13.5pt}\color{wgNeutral800}}
  {\hfill{\wgheadfont\color{wgNeutral700}\thecontentspage}}
  [\vskip8.25pt]

\renewcommand{\contentsname}{\'Indice}
%% Indice completo con el subtitulo del disenio y el cierre en acento.
\newcommand{\wgindice}[1][Contenido del documento y p\'agina de inicio de cada apartado.]{%
  \section*{\contentsname}%
  \vskip-6pt
  {\small\color{wgNeutral700}#1\par}
  \vskip16.5pt
  \begingroup
    \setlength{\parskip}{0pt}\setlength{\parsep}{0pt}%
    \wg@tocfont
    \setcounter{tocdepth}{2}%
    \@starttoc{toc}%
  \endgroup
  {\color{wgAccent}\hrule height 1.5pt}}

%% ---------------------------------------------------------------- listas
\setlist[itemize]{leftmargin=15pt,itemsep=0pt,parsep=0pt,topsep=0pt,
  partopsep=0pt,label=\textcolor{wgAccent}{\textbullet}}
\setlist[enumerate]{leftmargin=15pt,itemsep=0pt,parsep=0pt,topsep=0pt,
  partopsep=0pt,label=\textcolor{wgAccent}{\arabic*.}}

%% ---------------------------------------------------------------- tablas
%% Cabecera: 10px versalita espaciada, regla de 2px; filas con regla de 1px.
\renewcommand{\arraystretch}{1.5}
\newcommand{\wgth}[1]{{\fontsize{7.5}{10}\selectfont\color{wgNeutral700}%
  \textls[140]{\MakeUppercase{#1}}}}
%% Columna de ancho fijo alineada a la derecha (para que su cabecera quede
%% a ras con las columnas p{} vecinas, que se alinean por la primera linea).
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}p{#1}}
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
%% Reglas: cabecera 2px --color-text, filas 1px --color-divider.
\newcommand{\wgtoprule}{\noalign{\vskip2pt}\noalign{{\color{wgText}\hrule height 1.5pt}}\noalign{\vskip2pt}}
\newcommand{\wgrowrule}{\noalign{{\color{wgDivider}\hrule height 0.75pt}}}

%% ---------------------------------------------------------------- figuras y tablas (APA)
%% "Figura 1" en linea propia, acento-700, 800, 11.5px; titulo en cursiva 12.5px.
\DeclareCaptionLabelSeparator{wgsep}{\\}
\captionsetup{labelsep=wgsep,justification=raggedright,singlelinecheck=false,
  skip=6pt,belowskip=0pt}
\captionsetup[figure]{name=Figura,
  labelfont={color=wgAccent700},textfont={it,color=wgText},
  font={stretch=1}}
\captionsetup[table]{name=Tabla,
  labelfont={color=wgAccent700},textfont={it,color=wgText}}
\renewcommand{\thefigure}{\arabic{figure}}
\renewcommand{\thetable}{\arabic{table}}
%% El rotulo va en la tipografia de encabezado a 8.6pt (11.5px)
\DeclareCaptionFont{wglabelfont}{\wgheadfont\fontsize{8.6}{11}\selectfont}
\DeclareCaptionFont{wgtextfont}{\fontsize{9.4}{12}\selectfont}
\captionsetup{labelfont={wglabelfont,color=wgAccent700},
  textfont={wgtextfont,it,color=wgText}}
%% Nota al pie de figura/tabla (APA)
\newcommand{\wgnotafig}[1]{%
  \par\vskip6pt{\footnotesize\color{wgNeutral800}\textit{Nota.} #1\par}}
%% Marco de imagen de reserva del disenio
\newcommand{\wgplaceholder}[1][150px]{%
  \par\noindent
  {\color{wgDivider}\fboxsep=0pt\fboxrule=0.75pt
   \fcolorbox{wgDivider}{wgNeutral100}{%
     \parbox[c][#1][c]{\dimexpr\linewidth-1.5pt}{\centering
       \color{wgNeutral700}\wglabel{Imagen o diagrama}}}}\par}

%% ---------------------------------------------------------------- nota / callout
%% Regla de acento de 2px a la izquierda, 14px de separacion.
%% La regla se dibuja a la altura medida del bloque, no de una sola linea.
\newsavebox{\wg@rulebox}
\newcommand{\wg@rulewrap}[2]{%
  %% #1 = separacion entre regla y texto ; #2 = contenido ya en una \lrbox
  \par\vskip4pt\noindent
  {\color{wgAccent}%
   \rule[-\dp\wg@rulebox]{1.5pt}{\dimexpr\ht\wg@rulebox+\dp\wg@rulebox\relax}}%
  \hspace{#1}\usebox{\wg@rulebox}%
  \par\vskip16.5pt}

\newcommand{\wgnota}[1]{%
  \begin{lrbox}{\wg@rulebox}%
    \begin{minipage}{\dimexpr\linewidth-12pt}%
      \color{wgNeutral800}\fontsize{9.75}{16.6}\selectfont #1
    \end{minipage}%
  \end{lrbox}%
  \wg@rulewrap{10.5pt}{}}

%% ---------------------------------------------------------------- cita
\renewenvironment{quote}
  {\begin{lrbox}{\wg@rulebox}%
   \begin{minipage}{\dimexpr\linewidth-13.5pt}%
     \color{wgNeutral800}\fontsize{10.5}{17.85}\selectfont}
  {\end{minipage}\end{lrbox}\wg@rulewrap{12pt}{}}
%% Atribucion de la cita: versalita espaciada en acento-700
\newcommand{\wgfuente}[1]{%
  \par\vskip6pt{\fontsize{7.9}{10}\selectfont\color{wgAccent700}%
   \textls[100]{\MakeUppercase{--- #1}}}}

%% ---------------------------------------------------------------- codigo
\lstset{
  basicstyle=\ttfamily\fontsize{8.25}{13.6}\selectfont\color{wgText},
  backgroundcolor=\color{wgNeutral100},
  frame=leftline, framerule=1.5pt, rulecolor=\color{wgText},
  framesep=10.5pt, xleftmargin=12pt, framexleftmargin=1.5pt,
  aboveskip=13.5pt, belowskip=0pt,
  breaklines=true, columns=fullflexible, keepspaces=true,
  showstringspaces=false,
}
%% Bloque de codigo con rotulo APA ("Codigo 1")
\newcounter{wgcodigo}
\newcommand{\wgcodigotitulo}[1]{%
  \refstepcounter{wgcodigo}\par\vskip4pt
  {\wgheadfont\fontsize{8.6}{11}\selectfont\color{wgAccent700}C\'odigo \thewgcodigo\par}
  {\fontsize{9.4}{13}\selectfont\itshape #1\par}\vskip6pt}

%% ---------------------------------------------------------------- ecuacion
%% Regla de 1px arriba y abajo, numero en acento-700 a la derecha.
\newcommand{\wgecuacion}[2]{%
  \par\vskip4pt{\color{wgDivider}\hrule height 0.75pt}\vskip10.5pt
  \noindent\makebox[\linewidth][s]{%
    $\displaystyle #1$\hfill
    {\wgheadfont\fontsize{8.25}{10}\selectfont\color{wgAccent700}(#2)}}%
  \vskip10.5pt{\color{wgDivider}\hrule height 0.75pt}\par\vskip16.5pt}

%% ---------------------------------------------------------------- notas al pie
\renewcommand{\footnoterule}{\vskip6pt{\color{wgDivider}\hrule height 0.75pt}\vskip6pt}
\renewcommand{\@makefntext}[1]{%
  \noindent\makebox[1.2em][l]{\textcolor{wgAccent}{\@thefnmark}}#1}

%% ---------------------------------------------------------------- referencias APA
%% Sangria francesa de 0.5in, interlineado doble, 13px.
\newenvironment{referencias}
  {\section*{Referencias}\addcontentsline{toc}{section}{Referencias}%
   \vskip15pt
   \begingroup\fontsize{9.75}{19.5}\selectfont\setlength{\parskip}{0pt}}
  {\endgroup\par}
\newcommand{\refitem}{\par\vskip9pt\noindent\hangindent=0.5in\hangafter=1\ignorespaces}

%% Bloque "Citas en el texto" del disenio
\newcommand{\wgcitasenel}[1]{%
  \par\vskip16.5pt{\color{wgDivider}\hrule height 0.75pt}\vskip9pt
  {\wgheadfont\fontsize{7.5}{10}\selectfont\color{wgAccent700}%
   \textls[140]{CITAS EN EL TEXTO}\par}\vskip4pt
  {\fontsize{8.6}{15.5}\selectfont\color{wgNeutral800}#1\par}}

%% ---------------------------------------------------------------- portada
%% Coordenadas tomadas del SVG del disenio (viewBox 0 0 816 1056), en
%% pulgadas: x_in = x_px/96, y_in = y_px/96 medidas desde la esquina
%% superior izquierda de la hoja.
\newcommand{\wg@cover@art}{%
\begin{tikzpicture}[remember picture,overlay,
    x=1in,y=-1in,shift={(current page.north west)}]
  %% marcos angulares  (stroke --color-text, 1.5px -> 1.125pt)
  \begin{scope}[wgText,line width=1.125pt,line cap=butt]
    \draw (1,3.125) -- (1,0.75) -- (3.125,0.75);
    \draw (1,7.875) -- (1,10.25) -- (3.125,10.25);
    \draw (7.5,10.25) -- (7.5,7.875);
    \draw (5.375,10.25) -- (7.5,10.25);
    \draw (4.8958,0.75) -- (7.5,0.75) -- (7.5,3.125);
    %% Cuartos de circulo CONCENTRICOS apoyados en la esquina: el centro de
    %% cada arco es el vertice del marco -- (7.5,0.75) arriba-derecha y
    %% (1,10.25) abajo-izquierda -- no el punto opuesto.  Es el centro que
    %% selecciona el sweep-flag=1 del SVG original.
    %%
    %% OJO con los angulos: al dar el radio como longitud absoluta (1.75in)
    %% TikZ resuelve el arco en el marco del LIENZO (y hacia arriba), no en
    %% el marco local de este scope (y=-1in, y hacia abajo).  Por eso los
    %% angulos van con el signo invertido respecto de las coordenadas.
    %% arcos interiores  r = 128px -> 1.3333in
    \draw (7.5,2.0833) arc [start angle=-90, end angle=-180, radius=1.3333in];
    \draw (1,8.9167) arc [start angle=90, end angle=0, radius=1.3333in];
    %% arcos exteriores  r = 168px -> 1.75in
    \draw (7.5,2.5) arc [start angle=-90, end angle=-180, radius=1.75in];
    \draw (1,8.5) arc [start angle=90, end angle=0, radius=1.75in];
  \end{scope}
  %% marcas solidas de acento
  \begin{scope}[wgAccent]
    \fill (7,1) rectangle (7.2708,1.2708);            % 26x26px
    \fill (1.2292,9.7292) rectangle (1.5,10);
    \fill (7.1458,3.4375) circle [radius=0.1354in];   % r = 13px
    \fill (1.3542,7.5625) circle [radius=0.1354in];
  \end{scope}
  %% peines de acento (2.5px -> 1.875pt, remate cuadrado)
  \begin{scope}[wgAccent,line width=1.875pt,line cap=rect]
    \draw (3.875,0.75) -- (3.875,1);
    \draw (4.0417,0.75) -- (4.0417,1);
    \draw (4.2083,0.75) -- (4.2083,1);
    \draw (4.2917,10) -- (4.2917,10.25);
    \draw (4.4583,10) -- (4.4583,10.25);
    \draw (4.625,10) -- (4.625,10.25);
    \draw (1,3.875) -- (1.25,3.875);
    \draw (1,4.0417) -- (1.25,4.0417);
    \draw (1,4.2083) -- (1.25,4.2083);
    \draw (7.25,6.4583) -- (7.5,6.4583);
    \draw (7.25,6.625) -- (7.5,6.625);
    \draw (7.25,6.7917) -- (7.5,6.7917);
  \end{scope}
\end{tikzpicture}}

\renewcommand{\maketitle}{%
\begin{titlepage}%
\thispagestyle{empty}%
\null
\wg@cover@art
%% Bloque de titulo: left 1.55in, top 2.4in, right 1.55in
\begin{textblock*}{5.4in}(1.55in,2.4in)
  \noindent{\wgheadfont\fontsize{22.5}{22.5}\selectfont
    Word\textcolor{wgAccent}{glow}}\par
  \vskip4.5pt
  \noindent{\wgheadfont\fontsize{8.25}{11}\selectfont\color{wgNeutral700}%
    \textls[160]{\MakeUppercase{\wg@eyebrow}}}\par
  \vskip16.5pt
  {\wgheadfont\fontsize{37.5}{39.75}\selectfont\raggedright
    \wg@titulo\par}
\end{textblock*}%
%% Bloque de kicker: left 1.55in, top 5.6in, right 1.9in  -> 5.05in de ancho
\begin{textblock*}{5.05in}(1.55in,5.6in)
  \noindent{\wgheadfont\fontsize{9.75}{13}\selectfont
    \textls[120]{\MakeUppercase{\wg@kicker}}}\par
  \vskip7.5pt
  {\color{wgAccent}\hrule height 1.5pt}%
  \vskip9pt
  \noindent{\wgheadfont\fontsize{9.75}{13}\selectfont\color{wgAccent700}%
    \textls[120]{\MakeUppercase{\wg@kickerdos}}}\par
\end{textblock*}%
%% Datos: right 1.55in, bottom 1.35in  -> tope aprox. en 8.55in
\begin{textblock*}{5in}(1.95in,8.62in)
  \raggedleft
  {\wgheadfont\fontsize{9}{17.1}\selectfont
   \textls[120]{\MakeUppercase{Por \wg@autor}}\par
   \textls[120]{\MakeUppercase{Versi\'on \wg@version}}\par
   \textcolor{wgAccent700}{\textls[120]{\MakeUppercase{Fecha: \wg@fecha}}}\par}
\end{textblock*}%
\end{titlepage}%
\setcounter{page}{1}%
}

%% ---------------------------------------------------------------- cierre
%% Banda de acento a sangre al pie de la ultima pagina (0.95in de alto):
%% marca + leyenda a la izquierda, contacto al centro, numero en un
%% cuadrado de --color-text a la derecha.
%% medidas de la banda, dependientes del papel (en pulgadas, sin unidad:
%% el sistema tikz de abajo ya escala x=1in / y=-1in)
\ifwg@afour
  \def\wg@pw{8.2677}\def\wg@ph{11.6929}
\else
  \def\wg@pw{8.5}\def\wg@ph{11}
\fi

%% La pagina de cierre conserva el encabezado del disenio y cambia el pie
%% por la banda de acento.
\fancypagestyle{wordglowcierre}{%
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}\renewcommand{\footrulewidth}{0pt}
  \renewcommand{\footrule}{}%
  \fancyhead[L]{\wg@headleft}
  \fancyhead[R]{\wg@headblock}
}

\newcommand{\wgcierre}{%
\thispagestyle{wordglowcierre}%
\begin{tikzpicture}[remember picture,overlay,
    x=1in,y=-1in,shift={(current page.north west)}]
  %% banda de acento a sangre, 0.95in de alto
  \fill[wgAccent] (0,\wg@ph) rectangle ({\wg@pw-0.95},{\wg@ph-0.95});
  %% cuadrado de tinta con el numero de pagina
  \fill[wgText] ({\wg@pw-0.95},\wg@ph) rectangle (\wg@pw,{\wg@ph-0.95});
  \node[anchor=west,text=white,inner sep=0pt] at (1,{\wg@ph-0.475}) {%
    \begin{minipage}{3.4in}
      {\wgheadfont\fontsize{15}{15}\selectfont\wg@marca}\par\vskip4.5pt
      {\fontsize{7.13}{9}\selectfont\textls[120]{\MakeUppercase{Fin del documento
        \textperiodcentered\ \wg@subtitulo}}}
    \end{minipage}};
  \node[anchor=east,text=white,inner sep=0pt]
    at ({\wg@pw-1.15},{\wg@ph-0.475}) {%
    \begin{minipage}{2in}\raggedleft
      {\fontsize{7.13}{12.1}\selectfont \wg@web\par \wg@correo}
    \end{minipage}};
  \node[text=white,inner sep=0pt] at ({\wg@pw-0.475},{\wg@ph-0.475})
    {\wgheadfont\fontsize{16.5}{16.5}\selectfont\thepage};
\end{tikzpicture}}

\endinput
