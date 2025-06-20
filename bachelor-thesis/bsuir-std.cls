\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bsuir-std}[2025/06/11 Class conforming to BSUIR standard]



\LoadClass[a4paper,14pt]{extarticle}
%%%%%%%%%%
% Пакеты %
%%%%%%%%%%

% Чтобы сделать отступы по СТП-2024 приложение Л
\RequirePackage{geometry}

% Добавляем polyglossia, с ним же добавиться fontspec и можем
% использовать шрифт Times New Roman в XeLaTeX
% При том одним только fontspec не обойтись, потому что в
% polyglossia ещё команда setdefaultlanguage, которая позволяет
% установить русский язык в качестве основного, без чего
% не будут нормально в русском переносы работать.
\RequirePackage{polyglossia}

% Чтобы более гибко настроить межстрочный интервал в списках и перечислениях
\RequirePackage{enumitem} % https://tex.stackexchange.com/a/519982

\RequirePackage{graphicx} % Картинки^W Иллюстрации

% Картинки и другие float'ы там где написал инклюд через  H
\RequirePackage{float}

% Подписи к картинкам.
\RequirePackage{caption}

% titles
\RequirePackage{titlesec}

\RequirePackage{amsmath}
\RequirePackage{unicode-math}



\RequirePackage{tocbasic}
\RequirePackage{url}
\RequirePackage{hyperref} % Links in TOC

\RequirePackage{setspace}

\RequirePackage{lscape} % for rotated tables
\RequirePackage{rotating}

\RequirePackage{longtable} % for long tables

%%%%%%%
% СТП %
%%%%%%%


% интервал между строк
% В СТП-2017 не оговорен, просто сказано в пункте 2.1.1
% В СТП-2024 интервал уже оговорен и равен единице
% «межстрочный интервал – 1,0 (18 пунктов),»
% 40 +- 3 строки на страницу
\singlespacing
\setstretch{1}

% Содержание по СТП
% Look at comadocs for setting up toc
% https://mirror.datacenter.by/pub/mirrors/CTAN/macros/latex/contrib/koma-script/doc/scrguide-en.pdf
\DeclareTOCStyleEntries[
  beforeskip=0pt,          % интервал перед записью
  linefill=\dotfill,       % заполнитель в виде точек
  entryformat=\normalfont, % обычное начертание текста
  pagenumberformat=\normalfont, % обычное начертание номеров страниц
]{tocline}{section,subsection,subsubsection}


\DeclareTOCStyleEntry[
  indent=0em,
  numwidth=0.8em,
]{tocline}{section}
\DeclareTOCStyleEntry[
  indent=0.8em,
  numwidth=1.5em,
]{tocline}{subsection}
\DeclareTOCStyleEntry[
  indent=2.3em,
  numwidth=2.2em,
]{tocline}{subsubsection}



% Спрятать ссылки в содержании
\hypersetup{hidelinks}

% Приложение Л. СТП-2024

\geometry{left=25mm, top=12mm, right=12mm, bottom=15mm}

% если будет \geometry{left=30mm, top=20mm, right=15mm, bottom=20mm}
% то слева будет 35mm  
% справа будет 18mm  
% сверху будет 28mm
% снизу будет 25mm

% СТП-2024 Пункт 2.1.1
% «абзацный отступ – 1,25 см»
\setlength{\parindent}{12.5mm}


\setlist[enumerate, 1]{
  label = \arabic* , % Поставить номер без точки
  nosep,   % У списков по СТП такой межстрочный интервал
  itemindent = 15mm,
  labelindent = 12.5mm,
  leftmargin = *,
}

\AddEnumerateCounter{\asbuk}{\russian@asbuk@alph}{щ} % section 8.1

\setlist[enumerate, 2]{ % Второй уровень в нумерованных перечислениях
  label = \asbuk*) ,
  nosep,   % У списков по СТП такой межстрочный интервал
  labelindent = \parindent,
  leftmargin = *,
}

\setlist[itemize, 1]{ % Первый уровень в нумерованных перечислениях
  label = \textendash,
  nosep,   % У списков по СТП такой межстрочный интервал
  labelindent = 12.5mm,
  leftmargin = *,
}

% Считать рисунки и таблицы в пределах глав.
\counterwithin{figure}{section}
\counterwithin{table}{section}

% Оглавление секций:
% Отсуствие точек у номеров
% Верхний регистр
% Отсуствие гифинации
%
% https://tex.stackexchange.com/a/324041
% https://tex.stackexchange.com/a/24783
% https://mirror.datacenter.by/pub/mirrors/CTAN/macros/latex/contrib/titlesec/titlesec.pdf
\titleformat{\section}[block]
{\normalfont\fontsize{16}{16}\bfseries\raggedright}{\hspace{12.5mm}\thesection}{0.4em}{\MakeUppercase}

\titleformat{name=\section,numberless}[block]
{\normalfont\bfseries}{}{0.4em \centering}{\MakeUppercase}


\titleformat{\subsection}
{\normalfont\fontsize{14}{14}\bfseries\raggedright}
{\hspace{12.5mm}\thesubsection}{0.4em}{}

\titleformat{\subsubsection}
{\normalfont\fontsize{14}{14}\bfseries\raggedright}
{\hspace{12.5mm}\thesubsubsection}{0.4em}{}

\titlespacing*{\section}
{0pt}{18pt}{18pt}  % section: 18pt до/после

\titlespacing*{\subsection}
{0pt}{18pt}{18pt}  % subsection: 18pt до/после

\titlespacing*{\subsubsection}
{0pt}{18pt}{18pt}  % subsubsection: 18pt до/после

\titlespacing*{name=\section,numberless}
{0pt}{18pt}{18pt}  % безымянные секции: 18pt до/после

% Название таблиц  по стп 2024
\DeclareCaptionFormat{bsuirtable}{%
    \raggedright
    \hangindent=6em% Отступ для последующих строк
    \hangafter=1% Применять отступ после первой строки
    #1#2#3%
  }
  
\captionsetup[table]{
    format=bsuirtable,
    singlelinecheck=false,
    labelsep=endash,
    skip=1mm,
    position=above,
    parindent=0pt, % Убираем стандартный отступ
  }
  
% Нумерация и подписи к рисункам и таблицам  
\captionsetup[figure]{
    name={Рисунок},
    labelsep=endash,
    justification=centering,
    skip=18pt,
}

\numberwithin{figure}{section}
\numberwithin{equation}{section}

% Команда \sloppy в LaTeX ослабляет требования к качеству выравнивания текста, 
% чтобы предотвратить выход строк за правую границу (переполнение).
\sloppy % Разрешает более свободные переносы 

% Sections in toc without numbers
\newcommand*{\nsection}[1]{
    \section*{#1}
    \addcontentsline{toc}{section}{#1}
}


\renewpagestyle{plain}{%
  \sethead{}{}{}  
  \setfoot[\thepage][][]{}{}{\raisebox{2mm}\thepage}  
}
\pagestyle{plain}






%%%%%%%%%%%%%%%%%%%
% ifxetex section %
%%%%%%%%%%%%%%%%%%%

\RequirePackage{iftex}
% Я использую XeLaTeX потому что это позволяет использовать системный
% Times New Roman
\ifXeTeX
  %% устанавливает главный язык документа
  \setdefaultlanguage[spelling=modern]{russian}
  %% устанавливает второй язык документа
  \setotherlanguage{english}

  % СТП-2024 пункт 2.1.1
  % Устанавливаем основным шрифтом системный Times new Roman
  \setmainfont{Times New Roman}
  \newfontfamily{\cyrillicfont}{Times New Roman}[Script=Cyrillic]
  \newfontfamily{\cyrillicfontsf}{Times New Roman}[Script=Cyrillic]
 % Выставляем в качестве моноширинного шрифта системный Courier
  \setmonofont{Courier New}
  \newfontfamily{\cyrillicfonttt}{Courier New}

  \providecommand{\No}{\textnumero}

  %% Убираем предупреждение о использовании команды \cyr из eskdx
  \RequirePackage{xecyr}

  \setmathfont{Times New Roman}[math-style=upright]

  % Автоматическая Замена `--` на endash
  \RequirePackage{xesearch}
  \UndoBoundary{-}
  \SearchList{dash}{\textendash}{--}
  
\fi


% Возможность вствлять формулы на русском
% https://tex.stackexchange.com/a/201248
%%%%%%%% 
\DeclareSymbolFont{cyrletters}{\encodingdefault}{\familydefault}{m}{sf}
\newcommand{\makecyrmathletter}[1]{
  \begingroup\lccode`a=#1\lowercase{\endgroup
  \Umathcode`a}="0 \csname symcyrletters\endcsname\space #1
}
\count255="409
\loop\ifnum\count255<"44F
  \advance\count255 by 1
  \makecyrmathletter{\count255}
\repeat
%%%%%%%% 

%%% Local Variables:
%%% coding: utf-8
%%% mode: latex
%%% TeX-master: "main"
%%% TeX-engine: xetex
%%% LaTeX-biblatex-use-Biber: t
%%% End:
