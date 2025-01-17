\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{dormitory}
              [2025/01/04 v1.1 Article Class by SakuraEx]
              
\newif\if@ctex@use
\DeclareOption{draft}{\PassOptionToClass{draft}{atricle}}
\DeclareOption{ctex}{\@ctex@usetrue}
%\DeclareOption{twoside}{\@twosidetrue}
\DeclareOption*{}

\ProcessOptions\relax

\LoadClass{article}
%\if@ctex@use \RequirePackage[heading]{ctex}\fi
\RequirePackage{float}
\RequirePackage{caption}
\RequirePackage{geometry}
\RequirePackage{xparse}

%% set page size
\if@twoside {

}
\else
  \setlength\paperwidth{597\p@}
  \setlength\paperheight{845\p@}
  \setlength\oddsidemargin{-35\p@}
  \setlength\topmargin{-46\p@}
  \setlength\headheight{18\p@}
  \setlength\headsep{13\p@}
  \setlength\textheight{738\p@}
  \setlength\textwidth{525\p@}
  \setlength\footskip{28\p@}
\fi

% Define some constant
\def\@articlename{Dormitory}
\def\@articlesubname{}
\def\@subjectname{Article}
\def\articlename#1{\gdef\@articlename{#1}}
\def\articlesubname#1{\gdef\@articlesubname{#1}}
\def\subjectname#1{\gdef\@subjectname{#1}}

% Define a cover
\def\@themename{Theme name}
\def\@themelabel{Theme}
\def\themename#1{\gdef\@themename{#1}}
\def\themelabel#1{\gdef\@themelabel{#1}}

\def\author@label{Author}

\def\label@style{\sf}
\def\content@style{\relax}

\if@ctex@use
\def\author@label{作者}
\def\label@style{\sf\heiti}
\def\content@style{\kaishu}
\fi

\def\linewidthrule{\hrule\@height0.4\p@\@width\linewidth}
\def\textwidthrule{\hrule\@height0.4\p@\@width\textwidth}

\newlength\@labellength
%\@infobox{totallength}{label}{text}[labellength]
\def\@infobox#1#2#3{\@ifnextchar{[}{\@infoboxa{#1}{#2}{#3}}{\@infoboxa{#1}{#2}{#3}[0pt]}}
\def\@infoboxa#1#2#3[#4]{%
  \setbox0=\hbox{{\fontsize{14\p@}{14\p@}\selectfont\label@style#2}}%
  \setlength\@labellength{\ifdim #4>\wd0 #4 \else \wd0 \fi}%
  \dimen0=#1 \advance\dimen0-\@labellength%
  \mbox{\parbox[b]{\@labellength}{\leavevmode\makebox[\@labellength][s]{\label@style#2}\rlap{\rule[-3.3pt]{\dimen0}{0.4pt}}}%
  \hfill
  \parbox[b]{\dimen0}{\centering\leavevmode\content@style#3}}%
}

\long\def\@cover@info{}
\def\setcovercontent#1#2{\expandafter\gdef\csname @#1\endcsname{#2}\csname @have#1true\endcsname}
\def\setcoverlabel#1#2{\expandafter\gdef\csname #1@label\endcsname{#2}}
\newlength\@defaultlabellength \setlength\@defaultlabellength{0\p@}
\newlength\@halfinfolength \setlength\@halfinfolength{190\p@}
\if@ctex@use \def\@defaultlabellength{56\p@} \fi
\def\@putcovercontent#1{%
  \g@addto@macro\@cover@info{%
\csname if@have#1\endcsname%
\ifdim \csname #1@boxlength\endcsname>200\p@ \newline \fi%
\@infobox{\csname #1@boxlength\endcsname}%
{\csname #1@label\endcsname}%
{\csname @#1\endcsname}%
[\csname #1@labellength\endcsname]\hfill \fi
}
}
% define command \newcovercontent{name}[total length][label][content][label length]
\NewDocumentCommand\newcovercontent{m o o o o}{%
  \@newcovercontent@i{#1}
  \newif\if@neednewline
  \IfNoValueTF{#2}{}{\expandafter\setlength\csname #1@boxlength\endcsname{\if f#2 400\p@ \else \if h#2 190\p@ \else #2 \fi\fi}}
  \IfNoValueTF{#3}{}{\setcoverlabel{#1}{#3}}
  \IfNoValueTF{#4}{}{\setcovercontent{#1}{#4}}
  \IfNoValueTF{#5}{}{\expandafter\setlength\csname #1@labellength\endcsname{#5}}
  \@putcovercontent{#1}
}
\def\@newcovercontent@i#1{%
  \global\expandafter\newif\csname if@have#1\endcsname% whether the infomation has been set
  \expandafter\gdef\csname @#1\endcsname{}% Store the infomation
  \expandafter\gdef\csname #1\endcsname##1{\expandafter\gdef\csname @#1\endcsname{##1}\csname @have#1true\endcsname}% infomation setting
  \expandafter\gdef\csname #1@label\endcsname{#1}% Store the infomation label
  \global\expandafter\newlength\csname #1@labellength\endcsname% the infomation label length
  \global\expandafter\newlength\csname #1@boxlength\endcsname% the infomation box length
  \expandafter\setlength\csname #1@labellength\endcsname{\@defaultlabellength}%
  \expandafter\setlength\csname #1@boxlength\endcsname{\@halfinfolength}%
}
\def\author@labellength{190\p@}
\def\authorlabellength{\if f#1 400\p@ \else \if h#1 190\p@ \else #1 \fi\fi}

\newcommand\makecover{%
  \setcounter{page}{0}
  \thispagestyle{empty}
  \newpage
  \mbox{}
  \vspace{80pt}

  \begin{center}
    \begin{minipage}{400\p@}
      \parbox[b]{\linewidth}{\fontsize{24\p@}{24\p@}\selectfont\label@style\centering\leavevmode\@subjectname}\vspace{123pt}\\%
        \hbox to \linewidth {%
        \begin{minipage}{\linewidth}
          \hbadness=10000%
          \fontsize{14\p@}{14\p@}\linespread{2.2}\selectfont%
          \@infobox{\linewidth}{\@themelabel}{\@themename}\vspace{20pt} %
          \@infobox{190\p@}{\author@label}{\@author}[56\p@]\hfill %
          \@cover@info%
          %\show\@cover@info%
          \parbox[b]{190\p@}{\mbox{}}\hbadness=1000 %
        \end{minipage}%
      }%
    \end{minipage}
  \end{center}
  \let\@infobox\relax
  \let\@infoboxa\relax
  \let\makecover\relax
  
  \newpage
}

% Define pagestyle 'dorm'
\def\ps@dorm{%
  \def\@oddfoot{%
    \hbox to \textwidth{%
      \vbox to \footskip{%
        \vskip8\p@
        \setbox0=\vbox{\textwidthrule}\unvbox0
        \vskip7\p@\relax
        \hbox{%
          \rlap{\parbox[t]{\textwidth}{\raggedright\leavevmode\label@style\@articlename\ \@articlesubname}}%
          \hfill
          \parbox[t]{\textwidth}{\centering\leavevmode\ }%
          \hfill
          \llap{\parbox[t]{\textwidth}{\raggedleft\leavevmode\label@style\thepage}}%
        }%
        \vfill
      }%
    }%
  }
  \def\@evenfoot{%
    \hbox to \textwidth{%
      \vbox to \footskip{%
        \vskip8\p@
        \setbox0=\vbox{\textwidthrule}\unvbox0
        \vskip7\p@\relax
        \hbox{%
          \rlap{\parbox[t]{\textwidth}{\raggedright\leavevmode\label@style\thepage}}%
          \hfill
          \parbox[t]{\textwidth}{\centering\leavevmode\ }%
          \hfill
          \llap{\parbox[t]{\textwidth}{\raggedleft\leavevmode\label@style\@articlename\ \@articlesubname}}%
        }%
        \vfill
      }%
    }%
  }
  \def\@oddhead{%
    \hbox to \textwidth{%
      \vbox to \headheight{%
        \vfill
        \hbox{%
          \rlap{\parbox[b]{\textwidth}{\raggedright\leavevmode\ }}%
          \hfill
          \parbox[b]{\textwidth}{\centering\leavevmode\label@style\@subjectname}%
          \hfill
          \llap{\parbox[b]{\textwidth}{\raggedleft\leavevmode\ }}%
        }%
        \vskip4\p@\relax
        \textwidthrule
      }%
    }%
  }
  \let\@evenhead\@oddhead
}

\def\float@line{\vspace{6\p@}\linewidthrule\vspace{-2\p@}}
% Renew the float appearance (add a horizon line below it)
\renewenvironment{figure}{\@float{figure}}{\float@line\end@float}
\renewenvironment{figure*}{\@dblfloat{figure}}{\float@line\end@dblfloat}
% Renew the float package's float appearance
\renewcommand\float@end{\vspace{6\p@}\linewidthrule\vspace{-2\p@}\@endfloatbox
  \global\setbox\@currbox\float@makebox\columnwidth
  \let\@endfloatbox\relax\end@float}
\renewcommand\float@endH{\vspace{6\p@}\linewidthrule\vspace{-2\p@}\@endfloatbox\vskip\intextsep
  \if@flstyle\setbox\@currbox\float@makebox\columnwidth\fi
  \box\@currbox\vskip\intextsep\relax}
\renewcommand\float@dblend{\vspace{6\p@}\textwidthrule\vspace{-2\p@}\@endfloatbox
  \global\setbox\@currbox\float@makebox\textwidth
  \let\@endfloatbox\relax\end@dblfloat}
\def\fnum@figure{{\bf\figurename}\nobreakspace{\sf\thefigure}}
\def\fnum@table{{\bf\tablename}\nobreakspace{\sf\thetable}}
\def\@floatlabelsep{\hspace{4pt}\vrule\@height11\p@\@depth3\p@\hspace{5pt}}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1\@floatlabelsep#2}%
  \ifdim \wd\@tempboxa >\hsize
    #1\@floatlabelsep#2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip
}
