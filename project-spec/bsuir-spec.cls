\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bsuir-spec}[2025/06/05 XeLaTeX class for writing ESKD spec for BSUIR]

\LoadClass[a4paper]{eskdtab}



\pagenumbering{arabic}

\RequirePackage{eskdspec}

% Добавляем polyglossia, с ним же добавиться fontspec и можем
% использовать ttf шрифт в XeLaTeX
% При том одним только fontspec не обойтись, потому что в
% polyglossia ещё команда setdefaultlanguage, которая позволяет
% установить русский язык в качестве основного, без чего
% не будут нормально в русском переносы работать.
\RequirePackage{polyglossia} 

\RequirePackage{iftex} 

% Я использую XeLaTeX потому что это позволяет использовать ttf шрифты
\ifXeTeX
  %% устанавливает главный язык документа
  \setdefaultlanguage[spelling=modern]{russian}
  %% устанавливает второй язык документа
  \setotherlanguage{english}


  % Устанавливаем основным шрифтом системный OpenGost Type A TT
  \setmainfont[AutoFakeSlant=0.25,AutoFakeBold=0.2]{OpenGost Type A}

  \newfontfamily{\cyrillicfontsf}{OpenGost Type A}
  \providecommand{\No}{\textnumero}

  %% Убираем предупреждение о использовании команды \cyr из eskdx
  \RequirePackage{xecyr}

  \newsavebox\ESKDpicturebox
  % Support for the eskdx class in XeLaTeX
  % https://tex.stackexchange.com/a/587888
  \renewcommand{\ESKD@ShipoutPicture}{%
    \ifESKD@twoside
      \ifodd\c@page
        \ESKDframeX=\ESKD@margin@si
      \else
        \ESKDframeX=\ESKD@margin@so
      \fi
    \else
      \ESKDframeX=\ESKD@margin@si
    \fi
    \ESKDframeY=\ESKD@margin@b
    \ESKDstampX=\ESKDframeX
    \advance\ESKDstampX \ESKDframeW
    \advance\ESKDstampX -185mm
    \ESKDstampY=\ESKDframeY    
    \sbox\ESKDpicturebox{%
      \unitlength=1mm
      \begin{picture}(0,0)(\ESKDltu{\ESKD@origin@x},\ESKDltu{\ESKD@origin@y})%
        \ifx\ESKD@thisstyle\@empty
          \let\ESKD@thisstyle\ESKD@curstyle
        \fi
        \loop
        \ifnum \ESKD@hash@pos{@style@draw@\ESKD@thisstyle} %
          < \ESKD@hash@count{@style@draw@\ESKD@thisstyle}
          \ESKD@hash@next@value{@style@draw@\ESKD@thisstyle}\relax
          \repeat
          \ifx\ESKD@extra@ThisHook\@empty%
            \ESKD@extra@Hook\else\ESKD@extra@ThisHook%
          \fi%
          \global\let\ESKD@thisstyle\@empty%
          \global\let\ESKD@extra@ThisHook\@empty%
        \end{picture}
      }%
      \AddToHook{shipout/foreground}{%
        \put(1in,-1in){\usebox\ESKDpicturebox}}%
    }
    
\fi

%%% Local Variables: 
%%% coding: utf-8
%%% mode: latex
%%% TeX-engine: xetex
%%% End:
