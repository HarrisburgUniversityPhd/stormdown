% Revision History
%   2020-12-02 : MAN remove cruft from things we don't target
%   2020-08-01 : Initial version
%
% Known bugs
%   Having a tiny bit of the abstract spill to second page defeats page number removal.
%   Workaround: make the abstract a little longer or a little shorter.
%
% The default format is appropriate for printing, with blank pages
% inserted after the preliminary pages in twoside mode so you can
% send it directly to a two-sided printer. However, for ETD
% submission the blank pages need to be removed from the final output.
% The following option does this:
%
%   etd     : Produces an electronic copy with no blank pages in the preliminary section
%
% The rest of the class options are the same as the regular book class.
% A few to remember:
%
%   oneside : Produces single sided print layout (recommended for theses less than 50 pages)
%   twoside : Produces single sided print layout (the default if you remove oneside)
%
% The BYUPhys class provides the following macros:
%
%   \makepreliminarypages : Makes the preliminary pages
%   \clearemptydoublepage : same as \cleardoublepage but doesn't put page numbers
%                           on blank intervening pages
%   \singlespace          : switch to single spaced lines
%   \doublespace          : switch to double spaced lines
%
% ------------------------------------------------------------------------------------------------------
%
\NeedsTeXFormat{LaTeX2e} \ProvidesClass{templates/HUclass}

% ---------------------------- declarations -------------------------
%
% These macros are used to declare arguments needed for the
% construction of the preliminary pages

% Fix?
\newcommand{\cedp}{\newpage{\pagestyle{empty}\cleardoublepage}}

% The year and month the degree is awarded
\newcommand{\Year}[1]{\gdef\@Year{#1}}
\newcommand{\Month}[1]{\gdef\@Month{#1}}

% The full name of the degree
\newcommand{\degree}[1]{\gdef\@degree{#1}}

% First line of title
\newcommand{\TitleTop}[1]{\gdef\@TitleTop{\mbox{#1}}}

%Middle line of title
\newcommand{\TitleMiddle}[1]{\gdef\@TitleMiddle{\mbox{#1}}}

% Second line of title
\newcommand{\TitleBottom}[1]{\gdef\@TitleBottom{\mbox{#1}}}

% Acknowledgments text
\newcommand{\Acknowledgments}[1]{\gdef\@Acknowledgments{#1}}

% Abstract text
\newcommand{\Abstract}[1]{\gdef\@Abstract{#1}}

% Dedication text
\newcommand{\Dedication}[1]{\gdef\@Dedication{#1}}

% The author's name
\newcommand{\Author}[1]{\gdef\@Author{#1}}

% The institution name
\newcommand{\University}[1]{\gdef\@University{#1}}

% The department name
\newcommand{\Department}[1]{\gdef\@Department{#1}}

% The name of the advisor
\newcommand{\Advisor}[1]{\gdef\@Advisor{#1}}

% The title of the advisor
\newcommand{\AdvisorTitle}[1]{\gdef\@AdvisorTitle{#1}}

% The name of the committee member 2
\newcommand{\MemberA}[1]{\gdef\@MemberA{#1}}

% The tile of the committee member 2
\newcommand{\MemberATitle}[1]{\gdef\@MemberATitle{#1}}

% The name of the committee member 3
\newcommand{\MemberB}[1]{\gdef\@MemberB{#1}}

% The tile of the committee member 3
\newcommand{\MemberBTitle}[1]{\gdef\@MemberBTitle{#1}}

% The name of the committee member 4
\newcommand{\MemberC}[1]{\gdef\@MemberC{#1}}

% The tile of the committee member 4
\newcommand{\MemberCTitle}[1]{\gdef\@MemberCTitle{#1}}

% The name of the committee member 5
\newcommand{\MemberD}[1]{\gdef\@MemberD{#1}}

% The tile of the committee member 5
\newcommand{\MemberDTitle}[1]{\gdef\@MemberDTitle{#1}}

% The name of the department chair
\newcommand{\DepRep}[1]{\gdef\@DepRep{#1}}

% The title of the department chair (allow for associate chair, etc.)
\newcommand{\DepRepTitle}[1]{\gdef\@DepRepTitle{#1}}

% The name of the dean
\newcommand{\Dean}[1]{\gdef\@Dean{#1}}

% The title of the dean
\newcommand{\DeanTitle}[1]{\gdef\@DeanTitle{#1}}

% Set default values for fields
\Year{-unset-}
\Month{-unset-}
\Author{-unset-}
\University{-unset-}
\Department{-unset-}
\TitleTop{First line of title}
\TitleMiddle{ }
\TitleBottom{ } % default is empty

% ---------------------------- options ------------------------------

% A command to switch to single spaced lines
\newcommand{\singlespace}{\renewcommand{\baselinestretch}{1}\small\normalsize}

% A command to switch to double spaced lines
\newcommand{\doublespace}{\renewcommand{\baselinestretch}{1.66}\small\normalsize}

% A command pirated from chngpage.sty
\DeclareRobustCommand{\ch@ngetext}{%
  \setlength{\@colht}{\textheight}\setlength{\@colroom}{\textheight}%
  \setlength{\vsize}{\textheight}\setlength{\columnwidth}{\textwidth}%
  \if@twocolumn%
    \advance\columnwidth-\columnsep \divide\columnwidth\tw@%
    \@firstcolumntrue%
  \fi%
  \setlength{\hsize}{\columnwidth}%
  \setlength{\linewidth}{\hsize}%
}

% A command to make margins right for the initial single sided business.
\newcommand{\preliminarymargins}{%
    \addtolength{\textwidth}{0in}%
    \addtolength{\evensidemargin}{0in}%
    \ch@ngetext%
    }

% A command to fix the margins after the initial single sided business.
\newcommand{\fixmargins}{%
    \addtolength{\textwidth}{0in}
    \addtolength{\evensidemargin}{0in}
    \ch@ngetext%
}

\degree{Doctor of Philosophy}
\newcommand{\makepreliminarypages}{
  \preliminarymargins
  \titlepage
  \copyrightpage
  \abstractpage
  \dedicationpage
  \phdapprovalpage
  \acceptancepage
  \acknowledgmentspage
  \fixmargins
  \renewcommand{\clearemptydoublepage}{\cle@remptydoublep@ge}
}


% --------------------- Some commands to handle the single sided preliminary pages ------------------

% Define the '\clearemptydoublepage' command to clear pages but not number any blank pages inserted.
% This is taken from the BYUThesis.cls file
\let\cle@rdoublep@ge\cleardoublepage
\newcommand{\cle@remptydoublep@ge}{
  \clearpage
  \if@twoside
  \ifodd\c@page\else
  \fi\fi
  {\pagestyle{empty}\cle@rdoublep@ge}}
\newcommand{\clearemptydoublepage}{\cle@remptydoublep@ge}


% Create an abstract environment which is single sided, even in a double sided book.
% again, this was taken from BYUThesis.cls
\def\skip@bstr@ctp@ges{\relax}
\def\@@skip@bstr@ctp@ges{%
  \if@twoside
   \ifodd\c@page\else
    \vbox{\vbox to \vsize{}}
    \clearpage\fi
   \else
  \fi
  \afterpage{\skip@bstr@ctp@ges}
}
\newenvironment{abstractenv}{
   \def\skip@bstr@ctp@ges{\@@skip@bstr@ctp@ges}
   \afterpage{\skip@bstr@ctp@ges \thispagestyle{empty}}
   \pagestyle{empty}
}

% Redefine above commands if etd option is specified.  The blank pages make printing nice,
% but they don't want them in the submitted PDF
\DeclareOption{etd}{
    \renewcommand{\clearemptydoublepage}{ \clearpage }
    \renewenvironment{abstractenv}{\afterpage{\pagestyle{empty}}\pagestyle{empty}}{}
  }

% ------------------------ Load the class and needed packages ---------------------------------

% Load the book class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[letterpaper,12pt]{book}

% The afterpage package is required to make single sided formal pages
% in a double sided environment
\RequirePackage{afterpage}

% Note: the hyperref package is required to make an appropriate ETD.
% However, we don't require it here since it is supposed to be the last
% package loaded and students may want to load other packages in the
% main tex file.  So that this class file doesn't crash if the student
% forgets to load hyperref, we have used the following commands below:
%
%   \providecommand\phantomsection{}
%   \providecommand\pdfbookmark[3][]{}
%
% These commands provide dummy versions of the macros, but won't
% bother the real versions if the hyperref package is loaded in the
% tex file.

% The tocloft package is required for formatting table of contents
\RequirePackage{tocloft}

% ---------------------------- main code ----------------------------

% If the \makepreliminarypages macro is not run, this never gets fixed.
  \setlength{\marginparwidth}{0pt}
  \setlength{\marginparsep}{0pt}
  \setlength{\oddsidemargin}{0in} %\setlength{\oddsidemargin}{0.23in}
  \setlength{\evensidemargin}{0in}
  \setlength{\textwidth}{6.5in} %\setlength{\textwidth}{6in}
  \setlength{\topmargin}{0in}
  \setlength{\headheight}{14.5pt} %\setlength{\headheight}{0.125in}
  \setlength{\headsep}{0.2in}
  \setlength{\textheight}{8.875in} %\setlength{\textheight}{8.625in}
  \setlength{\footskip}{0.5in} %\setlength{\footskip}{0.625in}


% Format table of contents
\renewcommand{\cftpartfont}{\normalfont\bfseries} % \part font in ToC
\renewcommand{\cftchapfont}{\normalfont\bfseries} % \chapter font in ToC
\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand{\cftpartpagefont}{\normalfont}
\renewcommand{\cftpartleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
% \setcounter{tocdepth}{4}
% \setcounter{secnumdepth}{4}

\cftsetindents{chapter}{0in}{0.25in}
\cftsetindents{section}{0.25in}{0.35in}
\cftsetindents{subsection}{.6in}{0.5in}
\cftsetindents{subsubsection}{1.5in}{0.5in}

\setlength{\cftbeforepartskip}{.25em}
\setlength{\cftbeforechapskip}{.25em}
\setlength{\cftbeforesecskip}{-.5em}
\setlength{\cftbeforesubsecskip}{-.5em}

\addtocontents{toc}{~\hfill\textbf{Page}\par}

% Redefine the Table of Contents to deal with some blank page
% and bookmarking issues relating to ETD submission
% \let\TEMPtableofcontents\tableofcontents
% \renewcommand{\tableofcontents}{
%   \clearemptydoublepage
%   \providecommand\phantomsection{} \phantomsection
%   \addcontentsline{toc}{chapter}{Table of Contents}
%   \TEMPtableofcontents
% }


% Redefine the List of Figures to deal with some blank page
% and bookmarking issues
\let\TEMPlistoffigures\listoffigures
\renewcommand\listoffigures{
  \clearemptydoublepage  %%% <<< Removing causes page number problems
  \providecommand\phantomsection{} \phantomsection
  %\addcontentsline{toc}{part}{List of Figures}
  \setlength{\cftbeforefigskip}{-.5em}
  \renewcommand\cftfigafterpnum{\vskip1em\par}
  \TEMPlistoffigures
}
\let\mylistoffigures\listoffigures
% \let\TEMPlistoffigures\listoffigures
% \renewcommand{\listoffigures}{
%   \clearemptydoublepage  %%% <<< Removing causes page number problems
%   \providecommand\phantomsection{} \phantomsection
%   \addcontentsline{toc}{chapter}{LIST OF FIGURES}
%   \TEMPlistoffigures
% }


% Redefine the List of Tables to deal with some blank page
% and bookmarking issues
\let\TEMPlistoftables\listoftables
\renewcommand{\listoftables}{
  \clearemptydoublepage  %%% <<< Removing causes page number problems
  \providecommand\phantomsection{} \phantomsection
  %\addcontentsline{toc}{part}{List of Tables}
  \setlength{\cftbeforetabskip}{-.5em}
  \renewcommand\cfttabafterpnum{\vskip1em\par}
  \TEMPlistoftables
}
\let\mylistoftables\listoftables
% \let\TEMPlistoftables\listoftables
% \renewcommand{\listoftables}{
%   \clearemptydoublepage  %%% <<< Removing causes page number problems
%   \providecommand\phantomsection{} \phantomsection
%   \addcontentsline{toc}{chapter}{LIST OF TABLES}
%   \TEMPlistoftables
% }


% Redefine the Bibliography to deal with a bookmarking issues
% \let\TEMPbibliography\bibliography
% \renewcommand{\bibliography}{
%   \providecommand\phantomsection{} \phantomsection
%   \addcontentsline{toc}{chapter}{REFERENCES}
%   \TEMPbibliography
% }

\renewcommand*{\contentsname}{Table of Contents}
\renewcommand*{\listfigurename}{List of Figures}
\renewcommand*{\listtablename}{List of Tables}
\renewcommand*{\bibname}{References}

\newcommand{\addchapheadtotoc}{
    \addtocontents{toc}{
        %\protect\vspace{.5em}
        %\protect\noindent \textbf{CHAPTER}\protect\par
        %\protect%\vspace{-1em}
        }
    }

\newcommand{\addappheadtotoc}{
    \addtocontents{toc}{
        \protect\vspace{.5em}
        \protect\noindent \textbf{Appendices}\protect\par
        \protect%\vspace{-1em}
        }
    }


%---------------------------- The Preliminary Page Definitions --------------------------

% ========================== Centred Title Page ===========================
\renewcommand{\titlepage}{
    \thispagestyle{empty}
    \begin{center}
    \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Title Page}{bm:Title}
    \vspace*{5cm}
    \textsc{\large{\@TitleTop}}\\[\baselineskip]
    \textsc{\small{\@TitleMiddle}}\\[\baselineskip]
    \textsc{\small{\@TitleBottom}}\\
    \vfill
    By\\[\baselineskip]
    \textsc{\Large{\@Author}}
    \vfill
    A dissertation submitted to\\
    \@University\\
    for the degree of\\
    \MakeUppercase{\@degree} \\[\baselineskip]
    \begin{figure}[ht!]
    \begin{center}
    \includegraphics[height=2cm]{figures/HarrisburgU_Logo.png}
    \end{center}
    \end{figure}
    \@Department\\
    \@University\\
    \@Month~\@Year \\[\baselineskip]
    %\copyright\ Copyright by \MakeUppercase{\@Author},~\@Year\\
    %All Rights Reserved
    \end{center}
    \clearpage
    }

% ======================== Copyright page ===============================
\newcommand{\copyrightpage}{
    \thispagestyle{empty}
    \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Copyright}{bm:Copyright}
    \addtocounter{page}{-1}
    \vspace*{\fill}
    \vfill
    \begin{center}
    \copyright\ Copyright by \MakeUppercase{\@Author},~\@Year\\
    All Rights Reserved
    \end{center}
%    \vspace{1in}
    \clearpage
  }
\cedp

% =============================== Approval page =======================
\newcommand{\datebox}{
    \parbox[t]{1.5in}{
        \ \\[2\baselineskip]
        \rule{0.in}{0.4pt}\\

    }
}

\newcommand{\signaturebox}[1]{
    \parbox[t]{3.6in}{
        \ \\[2\baselineskip]
        \rule{3.6in}{0.4pt}\\
        #1
    }
}

\newcommand{\phdapprovalpage}{
    \thispagestyle{plain}
    \begin{center}
    \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Graduate Committee Approval}{bm:ComAp}
    \vspace*{0.375in}
    \textbf{Ph.D. COMMITTEE APPROVAL}\\[3\baselineskip]
    \end{center}
    \noindent
    To the Faculty of \@University:
    \par\doublespace The members of the Committee appointed to examine the dissertation
of \MakeUppercase{\@Author} find it satisfactory and recommend that it be accepted.\\[\baselineskip]
    \par\singlespace
    \datebox\hfill\signaturebox{\@Advisor, \@AdvisorTitle, Chair}\\
    \datebox\hfill\signaturebox{\@MemberA, \@MemberATitle}\\
    \datebox\hfill\signaturebox{\@MemberB, \@MemberBTitle}\\
    \datebox\hfill\signaturebox{\@MemberC, \@MemberCTitle}\\    
    \datebox\hfill\signaturebox{\@MemberD, \@MemberDTitle}\\     
    \vfill
    \clearemptydoublepage
  }

% ======================= Acceptance Page ============================
\newcommand{\acceptancepage}{
    \thispagestyle{empty}%
    \begin{center}
    \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Acceptance Page}{bm:Accept}
    \vspace*{0.375in}
    \textbf{ACCEPTANCE PAGE}\\[2\baselineskip]
    \@University\\[3\baselineskip]
    \end{center}%
    \noindent%
    As chair of the candidate's graduate committee, I have read the
    dissertation of \@Author \ in its final form and have found
    that (1) its format, citations, and bibliographical style are
    consistent and acceptable and fulfill university and department
    style requirements; (2) its illustrative materials including
    figures, tables, and charts are in place; and (3) the final
    manuscript is satisfactory to the graduate committee
    and is ready for submission to the university library.\\[2\baselineskip]
    \datebox\hfill\signaturebox{\@Advisor, \@AdvisorTitle\\Chair, Graduate Committee\\
    \@University} 
    \vskip 0pt plus 2fill
    \noindent Accepted for the Department of Analytics\par\hfill
    \signaturebox{\@DepRep \\Chair, Department of Analytics\\
    \@University} 
    \vfill \noindent Accepted for the University\par\hfill
    \signaturebox{\@Dean, \\Provost \\
    \@University}
    \clearemptydoublepage
  }
  
% ======================= Dedication Page ============================
\newcommand{\dedicationpage}{
    \newpage
    \thispagestyle{plain}%
    \begin{center}
    \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Dedication Page}{bm:Dedicate}
    \vspace*{1.575in}
    \textbf{DEDICATION}\\[2\baselineskip]
    \@Dedication
    \end{center}%
    \vfill
    \newpage
  }
\cedp

% ======================= Appendix Page ============================
\newcommand{\appendixpage}{
    \newpage
    \thispagestyle{empty}
    \begin{center}
    \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Appendix}{bm:APPENDIX}
    \vspace*{1.575in}
    \textbf{APPENDICES}\\[2\baselineskip]
    \end{center}%
    \vfill
    \clearpage
  }
\cedp

\let\TEMPappendix\appendix
\renewcommand{\appendix}{
  \addappheadtotoc
  \appendixpage
  \TEMPappendix
}
\let\myappendix\appendix

% ========================= Acknowledgments ==============================
\newcommand{\acknowledgmentspage}{
    \providecommand\phantomsection{} \phantomsection
    \thispagestyle{plain}
    \renewcommand{\baselinestretch}{1}\small\normalsize
    \begin{center}
    \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Acknowledgments}{bm:Acknowledge}
    \vspace*{0.375in}
    \textbf{ACKNOWLEDGMENTS}\\[3\baselineskip]
    \end{center}
    \renewcommand{\baselinestretch}{1.66} \small\normalsize%
    \@Acknowledgments
    \newpage
  }
\cedp

% ========================= Abstract ===================================

\newcommand{\abstractpage}{
    \providecommand\phantomsection{} \phantomsection
    \begin{abstractenv}
    \renewcommand{\baselinestretch}{1}\small\normalsize
    \begin{center}
    \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Abstract}{bm:Abstract}
    \vspace*{.1in}
    \textbf{ABSTRACT}\\[2\baselineskip]
    \end{center}
    \renewcommand{\baselinestretch}{1.66}\small\normalsize
    \@Abstract
    \end{abstractenv}
    }
\cedp

% JEM: for crazy multi character set quotes and Unicode and all
\usepackage{lmodern}
\usepackage[LGR,TS1,T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[greek,latin,english]{babel}
\usepackage{csquotes}
\hyphenpenalty=500
\def\longs{{\fontencoding{TS1}\selectfont s}}


% JEM: Stuff for List of Abbreviations (or Glossary or other list)
\usepackage{calc}
\usepackage{minitoc}
\newcommand{\t@cfill}{\cleaders\hbox{$\m@th \mkern\@dotsep mu . \mkern\@dotsep mu$}\hfill}
\newcommand{\abbrl@bel}[1]{\makebox[\labelwidth][l]{\textbf{#1}\ \t@cfill}}
\newenvironment{mclistof}[2]{%
   \chapter*{#1}%
   \addcontentsline{toc}{chapter}{#1}
   \begin{list}{}%
   {\renewcommand{\makelabel}{\abbrl@bel}%
    \setlength{\labelwidth}{#2}%
    \setlength{\leftmargin}{\labelwidth+\labelsep}%
    \setlength{\itemsep}{0pt}%
    \markboth{#1}{#1}%
   }}
   {\end{list}\mtcaddchapter}


