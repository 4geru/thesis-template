% cs-thesis.cls: thesis class in our department.
% \documentclass{cs-thesis}
% Date: 2005/11/19 Modified by:AHSGW : change titlepage vspace 
\def\csthesisversion{1.0}
\def\csthesisdate{2000/01/25}
\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{cs-thesis-kai}[\csthesisdate, \csthesisversion]
\LoadClass[11pt]{jarticle}
\typeout{Master/Bachelor Thesis Style for Dept. of C.S., Ritumeikan Univ.}
%
% Printing Area.... for A4
%
%\typeout{printing area}
\textwidth=15cm
\textheight=22cm
\topmargin=0cm
\oddsidemargin=1cm
\evensidemargin=1cm
\def\baselinestretch{1.2}

\setcounter{topnumber}{5}%    ページ上部の図表は 5 個まで
\def\topfraction{1.00}%       ページの上 1.00 まで図表で占めて可
\setcounter{bottomnumber}{5}% ページ下部の図表は 5 個まで
\def\bottomfraction{1.00}%    ページの下 1.00 まで図表で占めて可
\setcounter{totalnumber}{10}% ページあたりの図表は 10 個まで
\def\textfraction{0.1}%      ページうち本文が占める割合の下限
\def\floatpagefraction{0.5}%  図表だけのページは少なくとも
                           %  これだけを図表が占める
%
% Section Header
%       from jarticle.cls, however, font and size was modified.
%
%\typeout{section}
\def\section{\newpage\@startsection {section}{1}{\z@}%
  {3.5ex plus 1ex minus .2ex}%
  {2.3ex plus .2ex}%
  {\normalfont\large\bfseries}}
\def\subsection{\@startsection{subsection}{2}{\z@}%
  {3.25ex plus 1ex minus .2ex}%
  {1.5ex plus .2ex}%
  {\normalfont\normalsize\bfseries}}
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}%
  {3.25ex plus 1ex minus .2ex}%
  {1.5ex plus .2ex}%
  {\normalfont\normalsize\bfseries}}
\def\paragraph{\@startsection{paragraph}{4}{\z@}%
  {3.25ex plus 1ex minus .2ex}%
  {-1em}%
  {\normalfont\normalsize\bfseries}}
\def\subparagraph{\@startsection{subparagraph}{4}{\parindent}%
  {3.25ex plus 1ex minus .2ex}%
  {-1em}%
  {\normalfont\normalsize\bfseries}}
%
% References (bug fix jarticle.sty)
%
%\typeout{reference}
\def\thebibliography#1{\section*{参考文献\markboth
    {参 考 文 献}{参 考 文 献}\addcontentsline{toc}{section}{参考文献}}\list
  {[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \usecounter{enumi}}
  \def\newblock{\hskip .11em plus .33em minus -.07em}
  \sloppy
  \sfcode`\.=1000\relax}
\let\endthebibliography=\endlist
%
% today
%
%\typeout{jpntoday}
\newif\if西暦\let\if西暦=\iffalse \def\西暦{\let\if西暦=\iftrue}
\def\jpntoday{{\if西暦\count0=\year\else%
    \count0=\year\advance\count0 -1988 平成\,\fi%
    \number\count0\,年\hspace{.5em}\nobreak%
    \number\month\,月\hspace{.5em}\nobreak\number\day\,日}}
%
\newcount\nendo
\def\nendostr{{\ifnum\month<4\nendo=\year\advance\nendo -1989\else%
    \nendo=\year\advance\nendo -1988\fi%
    平成{\ifnum\nendo=1{元}\else\number\nendo\fi}年度}}
%
%\typeout{engtoday}
\def\engtoday{
  \ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
%
%\typeout{current time}
\newcount\curmin \newcount\hour \newcount\onehour \newcount\curhour
\onehour=60
\hour=\time
\divide\hour by\onehour
\curhour=\hour
\multiply\hour by-\onehour
\curmin=\time
\advance\curmin by\hour
\def\curtime{{\rm\number\curhour 時\number\curmin 分}}
%
% Theorem Environment: 
% \newtheoremで定義されるexampleとかがitalicになってしまうのがいやなの
% で次のように再定義する。 
%
\def\@begintheorem#1#2{\trivlist \item[\hskip \labelsep{\bf [#1\ #2]}]}
%
% pagestyle
%
%\typeout{pagestyle}
\def\myfoot{\textsf{ \thepage}}
\def\yes{1}
%
% for master student
%
\def\ps@masterthesis{
  \def\isfinal{1}
  \def\doctitle{修士論文}
  \def\institutestr{
    立命館大学大学院 情報理工学研究科}% 
  \def\@evenhead{}%
  \def\@oddhead{}%
  \def\@oddfoot{\hfill\myfoot\hfill}%
  \def\@evenfoot{\hfill\myfoot\hfill}%
  }
%
% for bachelor student
%
\def\ps@bachelorthesis{
  \def\isfinal{1}
  \def\doctitle{卒業論文}
  \def\institutestr{立命館大学 情報理工学部 情報システム学科}
  \def\@evenhead{}%
  \def\@oddhead{}%
  \def\@oddfoot{\hfill\myfoot\hfill}%
  \def\@evenfoot{\hfill\myfoot\hfill}%
  }
%
% drafts
%
\def\ps@draft{
  \def\isfinal{0}
  \def\doctitle{DRAFT}
  \def\institutestr{立命館大学}
  \def\draftstr{{\jpntoday, \curtime: \authorstr}}
  \def\draftfoot{%
    {\textsf{ \draftstr}\hfill\textsf{ \thepage}}%
    }
  \def\@evenhead{}%
  \def\@oddhead{}%
  \def\@oddfoot{{\draftfoot}}%
  \def\@evenfoot{{\draftfoot}}%
  }
%
% title page items
%
%\typeout{commands...}
\def\titlestr{Title}
\renewcommand{\title}[1]{
  \def\titlestr{#1}
  }
%
\def\etitlestr{}
\newcommand{\etitle}[1]{
  \def\etitlestr{#1}
  }
%
\def\etitlestr{}
\newcommand{\eabstitle}[1]{
  \def\eabstitlestr{#1}
  }  
%
\def\authorstr{Author}
\renewcommand{\author}[1]{
  \def\authorstr{#1}
  }
%
\def\eauthorstr{English Author}
\newcommand{\eauthor}[1]{
  \def\eauthorstr{#1}
  }
%
\def\studentnumberstr{Student Number}
\newcommand{\studentnumber}[1]{
  \def\studentnumberstr{#1}
  }
%
\def\supervisorstr{Supervisor}
\newcommand{\supervisor}[1]{
  \def\supervisorstr{#1}
  }
%
\def\deadlinestr{Deadline}
\newcommand{\deadline}[1]{
 \def\deadlinestr{#1}
 }
%
% title page
%
%\typeout{titlepage}
\renewcommand{\titlepage}{
  \newpage
  \thispagestyle{empty}
  \setcounter{page}{0}
  \if\isfinal\yes
  \vspace*{0mm}
  \begin{center}
    {\textbf{\LARGE\doctitle}}
  \end{center}
  \vspace*{16mm}
  \begin{center}
  \parbox[b]{132mm}{
    \textbf{\Huge\titlestr}
   }
  \parbox[b]{132mm}{
    \vspace*{10mm}
    \textbf{\Huge\etitlestr}
   }
  \end{center}
  \vspace*{\fill}
\begin{Large}
\hspace{50mm}氏\hspace{2zw}名: \authorstr\\
\hspace{50mm}学生番号: \studentnumberstr\\
\hspace{50mm}指導教員: \supervisorstr\\
\hspace{50mm}提\hspace{0.5zw}出\hspace{0.5zw}日: \deadlinestr
\end{Large} 
  \vspace*{25mm}
  \begin{center}
    \institutestr
  \end{center}
  \vspace*{10mm}
  \else
  \vspace*{\fill}
  \begin{center}
    \textbf{\Huge DRAFT}
  \end{center}
  \vspace*{1cm}
  \begin{center}
    \textbf{\Large\titlestr}
  \end{center}
  \vspace*{1cm}
  \begin{center}
    {\Large \authorstr}
  \end{center}
  \vspace*{1cm}
  \begin{center}
    \textbf{\Large \engtoday}
  \end{center}
  \vspace*{\fill}
  \fi
  }
%
%\typeout{abstract}
\renewcommand{\abstract}{
  \newpage
  \begin{flushleft}
    \nendostr\ \doctitle
  \end{flushleft}
  \vspace*{2mm}
  \begin{flushleft}
    \titlestr
  \end{flushleft}
  \begin{flushright}
    \authorstr
  \end{flushright}
  \vspace*{2mm}
  \begin{flushleft}
    \textbf{\large 内容梗概}
  \end{flushleft}
  \vspace*{2mm}
  \par
  }
%
%\typeout{eabstract}
\newcommand{\eabstract}{
  \newpage
  \begin{flushleft}
    Master Thesis
  \end{flushleft}
  \vspace*{2mm}
  \begin{flushleft}
    \eabstitlestr
  \end{flushleft}
  \begin{flushright}
    \eauthorstr
  \end{flushright}
  \vspace*{2mm}
  \begin{flushleft}
    \textbf{\large Abstract}
  \end{flushleft}
  \vspace*{2mm}
  \par
  }
%
%\typeout{keyword}
\newcommand{\keyword}{
  \vspace*{5mm}
  \begin{flushleft}
    \textbf{ 主な用語}
  \end{flushleft}
  }
%
%\typeout{toc}
\newcommand{\toc}{
  \if\isfinal\yes
  \newpage
  \tableofcontents
  \listoffigures
  \listoftables
  \fi
  }
%typeout{acknowledgement}
\newcommand{\acknowledgement}{
  \newpage
  \section*{謝辞\addcontentsline{toc}{section}{謝辞}}
  }
%typeout{appendix}
\renewcommand{\appendix}{
  \newpage
  \section*{付録\addcontentsline{toc}{section}{付録}}
  }
%typeout{yet another reference}
\newcommand{\reference}{
  \newpage
  \section*{参考文献\addcontentsline{toc}{section}{参考文献}}
  }
%\typeout{done}