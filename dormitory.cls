\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{dormitory}
              [2025/01/04 v1.1 Article Class by SakuraEx]
              
\DeclareOption{ctex}{\PassOptionsToPackage{ctex}{SEcover}}
\DeclareOption{draft}{\PassOptionsToClass{draft}{atricle}}
\DeclareOption{twoside}{\@twosidetrue}
\DeclareOption*{}

\ProcessOptions\relax

\LoadClass{article}
\RequirePackage{float}
\RequirePackage{caption}
\RequirePackage{geometry}
\RequirePackage{xparse}
\RequirePackage{SEcover}

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

\def\author@label       {Author}

\def\label@style{\sf}
\def\content@style{\relax}

\if@ctex@use
\def\author@label       {作者}
\def\label@style{\sf\heiti}
\def\content@style{\kaishu}
\fi

\def\linewidthrule{\hrule\@height0.4\p@\@width\linewidth}
\def\textwidthrule{\hrule\@height0.4\p@\@width\textwidth}

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
% Create a new figure float type, where there is a horizon line below it.
\newenvironment{dormfig}{\@float{figure}}{\float@line\end@float}
\newenvironment{dormfig*}{\@dblfloat{figure}}{\float@line\end@dblfloat}

\newenvironment{hfigure}{\begin{minipage}{\linewidth}\captionsetup{type=figure}}{\vspace{2em}\end{minipage}}
\newenvironment{htable}{\begin{minipage}{\linewidth}\captionsetup{type=table}}{\vspace{2em}\end{minipage}}

\def\fnum@figure{{\bf\figurename}\nobreakspace{\sf\thefigure}}
\def\fnum@table{{\bf\tablename}\nobreakspace{\sf\thetable}}

\captionsetup{
  labelsep = period,
  font = small
}
