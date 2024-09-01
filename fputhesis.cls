% Florida Polytechnic University MS thesis LaTex Class File
%
% This file was edited (with bare-minimum changes) from a University of Alabama thesis class file found on Overleaf in Spring 2023. The file was updated by Chris Kelley to meet the Florida Poly thesis formatting requirements.
% Current version updated on 8/28/2023
%
%
%
%
%
% University of Alabama MS/PhD thesis/dissertation LaTeX Class File
%
% Copyright (c) 2012 Paul Kilgo
% The latest version of this file may be obtained from
%   https://github.com/OEP/uathesis
%
% License: LaTeX Project Public License (www.latex-project.org/lppl.txt)
%   Executive summary:
%       This software is copyright but you are granted a license which gives
%       you, the "user" of the software, legal permission to copy, distribute,
%       and/or modify the software. However, if you modify the software and
%       then distribute it (even just locally) you must change the name of the
%       software to avoid confusion.
%
% OR (dual-licensed)
%
% License: GNU Lesser General Public License (www.gnu.org/licenses/lgpl.html)
%
% Author Information:
%   Paul Kilgo
%   The University of Alabama
%   paulkilgo@gmail.com
%
% Any change requests are appreciated if proposed through Github. Any bug
% reporting should also be done through Github as well.
%
% Happy writing!

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{fputhesis}

\RequirePackage{ifthen}

\newif\ifthesis
\DeclareOption{thesis}{\thesistrue}
\DeclareOption{dissertation}{\thesisfalse}

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{report}%
}
\ProcessOptions\relax
\LoadClass[letter,12pt]{report}

% margins
\usepackage[top=1in,bottom=1in,left=1in,right=1in]{geometry}
\usepackage{titlesec}
\usepackage{setspace}
\usepackage{textcase}
\usepackage{tocloft}
\usepackage{array}
\usepackage[normalem]{ulem}
\usepackage[acronym,nonumberlist,xindy,toc,nopostdot,nogroupskip]{glossaries}
\usepackage{glossary-longragged}
\setlength{\glsdescwidth}{1.25\textwidth}%
\setglossarystyle{longragged}
\makeglossaries
\renewcommand{\glossaryname}{LIST OF ABBREVIATIONS AND SYMBOLS}


\renewcommand{\cfttoctitlefont}{\pagebreak\vspace*{1in}\hspace{.43\linewidth}\MakeTextUppercase}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftchapfont}{ }
\renewcommand{\cftdot}{.}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchappagefont}{}
\renewcommand\cftchappresnum{CHAPTER }
\cftsetindents{chapter}{0em}{6.5em}
\setlength{\cftbeforechapskip}{0pt}



\renewcommand{\cfttoctitlefont}{\hfill}
\renewcommand{\contentsname}{\textbf{TABLE OF CONTENTS}}
\renewcommand{\cftaftertoctitle}{\hfill\hfill} %Note the second \hfill, it could have been any dummy text



%\renewcommand{\contentsname}{\textbf{TABLE OF CONTENTS}\hfill}
%\renewcommand{\cftaftertoctitle}{\hfill}

\renewcommand{\cftloftitlefont}{\pagebreak\hfill\MakeTextUppercase}
\renewcommand{\cftafterloftitle}{\hfill}

\renewcommand{\cftlottitlefont}{\pagebreak\hfill\MakeTextUppercase}
\renewcommand{\cftafterlottitle}{\hfill}

%% Title spacings.
\titlespacing{\chapter}{0pt}{2in}{1in}

%% Thesis committee
\newcommand\memberA[1]{\renewcommand\@memberA{#1}}
\newcommand\@memberA{Committee undefined}

\newcommand\memberB[1]{\renewcommand\@memberB{#1}}
\newcommand\@memberB{Committee undefined}

\newcommand\memberC[1]{\renewcommand\@memberC{#1}}
\newcommand\@memberC{Committee undefined}

\newcommand\provost[1]{\renewcommand\@provost{#1}}
\newcommand\@provost{Committee undefined}

%% Adviser
\newcommand\adviser[1]{\renewcommand\@adviser{#1}}
\newcommand\@adviser{Adviser undefined}

%% Candidate degree
\newcommand\degree[1]{\renewcommand\@degree{#1}}
\newcommand\@degree{Undefined Degree}

%% Candidate previous degree
\newcommand\prevdegree[1]{\renewcommand\@prevdegree{#1}}
\newcommand\@prevdegree{Undefined Degree}

%% University 
\newcommand\university[1]{\renewcommand\@university{#1}}
\newcommand\@university{Florida Polytechnic University}

%% Department
\newcommand\department[1]{\renewcommand\@department{#1}}
\newcommand\@department{Undefined Department}

%% School (in case of undergrad thesis or something)
\newcommand\school[1]{\renewcommand\@school{#1}}
\newcommand\@school{Graduate School}

%% Year of graduation
\newcommand\gradyear[1]{\renewcommand\@gradyear{#1}}
\newcommand\@gradyear{\the\year}

%% Place
\newcommand\place[1]{\renewcommand\@place{#1}}
\newcommand\@place{Lakeland, Florida}

%% Abstract body text
\renewcommand\abstract[1]{\renewcommand\@abstract{#1}}
\newcommand\@abstract{No abstract body text.}

%% Dedication body text
\newcommand\dedication[1]{\renewcommand\@dedication{#1}}
\newcommand\@dedication{No dedication body text.}

%% Acknowledgments body text
\newcommand\acknowledgments[1]{\renewcommand\@acknowledgments{#1}}
\newcommand\@acknowledgments{No acknowledgments body text.}

%% Rename bibliography
\renewcommand{\bibname}{References}

%% Do not add vspace between chapters
%% Hack taken from:
%% http://tex.stackexchange.com
%% /questions/784/how-to-change-the-line-spacing-in-my-list-of-figures
\newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
\addtocontents{lof}{\protect\noaddvspace}
\addtocontents{lot}{\protect\noaddvspace}

% Make the front matter...
\newcommand{\makefrontmatter}{
  \thispagestyle{empty}
  \begin{center}
  \topskip=1in
    \begin{doublespace}
    \renewcommand{\and}{\NoCaseChange{\\}}
    \MakeTextUppercase{\@title} \linebreak \linebreak \linebreak \linebreak
    By \linebreak \linebreak 
    \textsc{\@author} \linebreak
    \textsc{\@prevdegree}  \linebreak \linebreak
    \@gradyear \linebreak \linebreak \linebreak \linebreak \linebreak 
    A Thesis submitted in partial fulfillment of the requirements for the degree of \linebreak 
    \@degree \linebreak 
    \@university \linebreak 
    \@place \linebreak 
    \pagebreak

    % Signature page
    \thispagestyle{empty} 
    \topskip = 0in
    \begin{singlespace}
      \MakeTextUppercase{\@title} \linebreak \linebreak \linebreak \linebreak
      by \linebreak \linebreak 
      \textsc{\@author} \linebreak
      \textsc{\@prevdegree}  \linebreak \linebreak
      \@gradyear \linebreak \linebreak \linebreak \linebreak \linebreak 
      A Thesis submitted in partial fulfillment of the requirements for the degree of \linebreak 
      \@degree \linebreak 
      \@university \linebreak 
      \@place \linebreak \linebreak \linebreak \linebreak \linebreak 
      \begin{tabular}{ m{2.1in} m{3in} m{0.01in} m{0.9in} }
	     Approved by \qquad     &Signatures    &     &Date 	   \\ 
      		&   &   &         \\ 
         \@adviser		&   &   &         \\ 
          Committee Chair		    &\uline{\hfill}   &  &\uline{\hfill}        \\
                &   &   &         \\ 
        \@memberA		&   &   &         \\ 
        Committee Member		    &\uline{\hfill}   &  &\uline{\hfill}        \\ 
                &   &  &        \\
        \@memberB		&   &   &         \\ 
        Committee Member		    &\uline{\hfill}   &  &\uline{\hfill}        \\ 
                &   &  &        \\
        \@provost		&   &   &         \\ 
        Interim Provost and  &   &  &        \\ 
        Vice President of      &   &  &        \\ 
        Academic Affairs      &\uline{\hfill}   &  &\uline{\hfill}        \\ 
    \end{tabular}


      
    \end{singlespace}
    
    
  \end{doublespace}
  \end{center}
  \pagebreak

    \begin{frontmatter}

    


    %\topskip=1in
    %\chapter*{\textbf{DEDICATION}}
    %\addcontentsline{toc}{chapter}{DEDICATION} 
    %\topskip=-1in
    %\@dedication


    \topskip = 1in
    \chapter*{\textbf{ACKNOWLEDGMENTS}}
    \addcontentsline{toc}{chapter}{ACKNOWLEDGMENTS}

    \@acknowledgments
    \pagebreak

%% ToC entries have double spaced but only longer-than-1-lines have single space.
    \topskip = 0in
    \renewcommand\cftchapafterpnum{\vskip12pt}
    \renewcommand\cftsecafterpnum{\vskip12pt}
    \renewcommand\cftsubsecafterpnum{\vskip12pt}
    \begin{spacing}{1}
      \tableofcontents
    \end{spacing}

    

\renewcommand{\listtablename}{\textbf{LIST OF TABLES}}
        \begin{spacing}{1}
\renewcommand{\cftlottitlefont}{\vspace*{0in}\hspace{.40\linewidth}\MakeTextUppercase}  
\pagebreak
\addcontentsline{toc}{chapter}{LIST OF TABLES}
    \listoftables 
\end{spacing}
     

\renewcommand{\listfigurename}{\textbf{LIST OF FIGURES}}
\renewcommand{\cftloftitlefont}{\vspace*{0in}\hspace{.40\linewidth}\MakeTextUppercase}  
\pagebreak
\addcontentsline{toc}{chapter}{LIST OF FIGURES}
\begin{spacing}{1}
\listoffigures
\end{spacing}


\begin{spacing}{1}
\clearpage\begingroup\let\newpage\relax\printglossary[title=\vspace*{.5in}\hspace{.1\linewidth}\textbf{\glossaryname}, toctitle=\glossaryname, type=\acronymtype]\endgroup
\end{spacing}



\topskip=1in
    \chapter*{\textbf{ABSTRACT}}
    \addcontentsline{toc}{chapter}{ABSTRACT}
\topskip=-1in

    \@abstract

    

    \end{frontmatter}

}



\newenvironment{frontmatter}{
  \pagebreak
  \pagenumbering{roman}
  \setcounter{page}{3}
  \setcounter{chapter}{0}
  \begin{doublespace}
  \renewcommand{\@makechapterhead}[1]
  {
    \begin{center}
      \MakeTextUppercase{ ##1 }
    \end{center}
  }
  \renewcommand{\@makeschapterhead}[1]
  {
    \begin{center}
      \MakeTextUppercase{ ##1 }
    \end{center}
  }
}
{
    \end{doublespace}
}
\newenvironment{body}
{
  \pagebreak
  \pagenumbering{arabic}
  \setcounter{page}{1}
  \setcounter{chapter}{0}
  \begin{doublespace}
  \renewcommand{\@makechapterhead}[2]
  {
    \vspace*{50\p@}%
    \begin{center}
      \MakeTextUppercase{ \textbf{ \@chapapp\space \thechapter } }
      \linebreak
      \begin{spacing}{1}
      \MakeTextUppercase{ \textbf{ ##1 } }
      \end{spacing}
    \end{center}
  }
  
  \renewcommand{\@makeschapterhead}[1]
  {
    \begin{center}
      \MakeTextUppercase{ \textbf{ ##1 } }
    \end{center}
  }
  
  \renewcommand{\section}
  {
    \@startsection{section}{1}{0mm}{4ex}{2ex}{\normalsize\bfseries}
  }
  
  \renewcommand{\subsection}
  {
    \@startsection{subsection}{1}{0mm}{1mm}{1mm}{\normalsize\bfseries}
  }
}
{
  \end{doublespace}
}

