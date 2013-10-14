% If you find something odd, wrong or lacking, you can email me at; Mikael Öhman <mikael.ohman@chalmers.se>
% But *please* do NOT email me about standard latex questions, but only things specific to the chalmers-thesis document class.
% This file has been distributed through: http://www.github.com/Micket/chalmers

%% Thesis class template for Chalmers University of Technology.
%% Written by Mikael Öhman <mikael.ohman@chalmers.se>
%% This document is released under public domain, but the chalmers logo is trademarked.
%% Some words are translated to swedish if babel language is set, otherwise default to English

%% Class options;
% doctorate, licentiate, masters, bachelors, techreport - Sets the type of thesis accordingly
% nocover - Do not print the cover in \maketitle.
% draft - Makes \maketitle more compact, skipping unnecessary blanks
% g5paper - Sets the paper dimensions to 239mm * 169mm
% gu - Joint work for Chalmers + GU
% All options are also passed the standard report class.

%% User commands
% \paper{title}{reference}
% \refpaper{paper numer}              - E.g. \refpaper{A}
% \makethesisdefence                  - Typesets the invitation paper to the thesis defence.
% \maketitle                          - Typesets the frontmatter for the thesis.
% \tableofpapers                      - Called by \maketitle
% \topentry{title}{reference}         - Called by \tableofpapers
% \papernumber                        - Defined to \Alph (can be redefined)
% \presectiontitle                    - Called by \maketitle

%% Input commands (self-explanatory).
% \author{Authors separated with \and}
% \title{text}
% \subtitle{text}
% \firstabstract{text}
% \secondabstract{language}{text}     - Optional
% \keywords{comma separated keywords}
% \preface{text}                      - Optional
% \acknowledgements{text}             - Optional
% \dedication{text}                   - Optional
% \coverfigure{text}                  - Optional
% \covercaption{text}                 - Optional
% \copyrightyear{text}
% \reportno{text}
% \ISBN{text}
% \department{text}
% \division{text}                     - Optional
% \thesisin{text}
% \paperwork{text}

%% User commands for the defence invitation
% \opponent{text}
% \oppositiondate{text}

%% Predefined commands (do not need to be set)
% \ISSN{text}
% \printers{text}
% \telephone{text}
% \postcode{text}
% \thesiscontents{text} - Text before the table of papers

%% The predefined babel translations;
% \countryname (Swedish, Sverige)
% \telephonename (Telephone, Telefon)
% \universityname (Chalmers University of Technology, Chalmers tekniska h\"ogskola)
% \seconduniversityname (University of Gothenburg, Göteborgs universitet)
% \covername (Cover, Omslag)
% \acknowledgementsname (Acknowledgements, Tacks\"agelse)
% \keywordsname (Keywords, Nyckelord)
% \masterthesisname (Master's Thesis, Examensarbete)
% \bachelorsthesisname (Bachelor's Thesis, Kandidatarbete)
% \licentiatethesisname (Thesis for the degree of Licentiate of Engineering, Licentiatavhandling)
% \doctoratethesisname (Thesis for the degree of Doctor of Philosophy, Doktorsavhandling)
% \inname (in, i)
% \listofpublicationsname (Thesis, Avhandling)
% \papername (Paper, Artikel)

%% Other
% \presectiontitle{text} - Used for printing titles in the frontmatter
% \presectiontitlestyle{text} - Can be redefined to change the style of the front matter

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{chalmers-thesis}[2011/04/21 CHALMERS Thesis class]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Macro for checking all required commands are set.
\newcommand{\@checkifdefined}[1]{%
  \@ifundefined{@#1}{\ClassError{chalmers-thesis}{User input `#1` undefined.}{Use the \textbackslash #1{} command to set it.}}{}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Conditionals
\newif\if@bachelors
\newif\if@masters
\newif\if@licentiate
\newif\if@doctorate
\newif\if@techreport
\newif\if@projectreport
\newif\if@university
\newif\if@bachelorsormasters
\newif\if@cover
\newif\if@draft
\newif\if@gfivepaper

\@universityfalse
\@bachelorsfalse
\@mastersfalse
\@licentiatefalse
\@doctoratefalse
\@techreportfalse
\@projectreportfalse
\@bachelorsormastersfalse
\@covertrue
\@draftfalse
\@gfivepaperfalse

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Options of class
% bachelors, masters, licentiate, doctorate, nocover, g5paper
\DeclareOption{bachelors}{\global\@bachelorstrue
  \global\@mastersfalse\global\@licentiatefalse\global\@doctoratefalse\global\@techreportfalse\global\@projectreportfalse}
\DeclareOption{masters}{\global\@masterstrue
  \global\@bachelorsfalse\global\@licentiatefalse\global\@doctoratefalse\global\@techreportfalse\global\@projectreportfalse}
\DeclareOption{licentiate}{\global\@licentiatetrue
  \global\@bachelorsfalse\global\@mastersfalse\global\@doctoratefalse\global\@techreportfalse\global\@projectreportfalse}
\DeclareOption{doctorate}{\global\@doctoratetrue
  \global\@bachelorsfalse\global\@mastersfalse\global\@licentiatefalse\global\@techreportfalse\global\@projectreportfalse}
\DeclareOption{techreport}{\global\@techreporttrue
  \global\@bachelorsfalse\global\@mastersfalse\global\@licentiatefalse\global\@doctoratefalse\global\@projectreportfalse}
\DeclareOption{projectreport}{\global\@projectreporttrue
  \global\@bachelorsfalse\global\@mastersfalse\global\@licentiatefalse\global\@doctoratefalse\global\@techreportfalse}
\DeclareOption{gu}{\global\@universitytrue}
\DeclareOption{nocover}{\global\@coverfalse}
\DeclareOption{draft}{\global\@drafttrue\global\@coverfalse}
\DeclareOption{g5paper}{\global\@gfivepapertrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\LoadClass[twoside]{report}

% Set up with the required packages
\RequirePackage{etoolbox}
\RequirePackage{textcase}

\if@gfivepaper
  \setlength{\paperwidth}{169mm}
  \setlength{\paperheight}{239mm}
\fi
\RequirePackage[top=0.1\paperheight, bottom=0.1\paperheight, left=0.1\paperwidth, right=0.1\paperwidth]{geometry}

% Makes the chapters act like a big section
\RequirePackage{titlesec}
\titleclass{\chapter}{straight}
\newcommand{\chapterbreak}{}
\titleformat{\chapter}[hang]{\bfseries\LARGE}{\thechapter\quad}{0em}{}
\titlespacing*{\chapter}{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}

% Parts should start a new right side page;
\titleclass{\part}{straight}
\newcommand{\partbreak}{\cleardoublepage}
\titleformat{\part}[display]{\bfseries\huge\centering}{\LARGE\partname\ \thepart}{0em}{}
\titlespacing*{\part}{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}

% Adjustments of floats and equations.
\setlength{\intextsep}{12pt}
\setlength{\abovedisplayskip}{6pt}
\setlength{\belowdisplayskip}{6pt}
\setlength{\parindent}{5mm}
\setlength{\abovecaptionskip}{6pt}
\setlength{\belowcaptionskip}{0pt} % Actual skip = \textfloatsep + \belowcaptionskip
\setlength{\itemsep}{0pt}

% Dynamic setup for user loaded packages.
\AtEndPreamble{
 \@ifpackageloaded{color}{
  \definecolor{chalmers_blue}     {RGB}{  0,  0,102}
  \definecolor{chalmers_grey}     {RGB}{204,204,204}
  \definecolor{chalmers_lightblue}{RGB}{ 28, 78,157}%{1c4e9d}
  \definecolor{chalmers_lightgold}{RGB}{239,197, 22}%{efc516}
  \definecolor{chalmers_purple}   {RGB}{ 51, 51,102}%{333366}
 }{}

 % Check for amsmath
 \@ifpackageloaded{amsmath}{
  %\numberwithin{equation}{section}
  %\numberwithin{figure}{section}
  %\numberwithin{table}{section}
 }{\ClassWarning{chalmers-thesis}{Package 'amsmath' strongly recommended.}}

 % Check and set up biblatex
 \@ifpackageloaded{biblatex}{
  \defbibheading{bibliography}[\refname]{\addcontentsline{toc}{chapter}{#1}\chapter*{#1}} % Sets the heading for the bibliography
  \newbibmacro{shortjournal}{\iffieldundef{shortjournal}
   {\usebibmacro{journal}}%
   {\printfield[journaltitle]{shortjournal}}} % Adds a default shortjournal
  }{\ClassWarning{chalmers-thesis}{Package 'biblatex' strongly recommended}}

 % Figure captions
 \@ifpackageloaded{subfig}{
  \captionsetup[subfigure]{textfont=it}
 }{\ClassWarning{chalmers-thesis}{Package 'subfig' strongly recommended}}

 \@ifpackageloaded{caption}{
  \captionsetup[figure]{textfont=it}
 }{\ClassWarning{chalmers-thesis}{Package 'caption' required}}


 % Check for babel and add more translations
 \@ifpackageloaded{babel}{
  \addto\captionsswedish{%
   \def\countryname{Sverige}%
   \def\cityname{G\"oteborg}%
   \def\telephonename{Telefon}%
   \def\universityname{Chalmers tekniska h\"ogskola}%
   \def\seconduniversityname{G\"oteborgs universitet}%
   \def\covername{Omslag}%
   \def\acknowledgementsname{Tacks\"agelse}%
   \def\keywordsname{Nyckelord}%
   \def\projectthesisname{Projekt}%
   \def\masterthesisname{Examensarbete}%
   \def\bachelorsthesisname{Kandidatarbete}%
   \def\licentiatethesisname{Licentiatavhandling}%
   \def\doctoratethesisname{Doktorsavhandling}%
   \def\techreportname{Teknisk rapport}%
   \def\inname{i}%
   \def\listofpublicationsname{Avhandling}%
   \def\papername{Artikel}%
   \def\publicationname{Publikation}%
  }
 
  \addto\captionsenglish{%
   \def\countryname{Sweden}%
   \def\cityname{G\"oteborg}%Gothenburg}%
   \def\telephonename{Telephone}%
   \def\universityname{Chalmers University of Technology}%
   \def\seconduniversityname{University of Gothenburg}%
   \def\covername{Cover}%
   \def\acknowledgementsname{Acknowledgements}%
   \def\keywordsname{Keywords}%
   \def\projectthesisname{Project}%
   \def\masterthesisname{Master's thesis}%
   \def\bachelorsthesisname{Bachelor's thesis}%
   \def\licentiatethesisname{Thesis for the degree of Licentiate of Engineering}%
   \def\doctoratethesisname{Thesis for the degree of Doctor of Philosophy}%
   \def\techreportname{Technical report}%
   \def\inname{in}%
   \def\listofpublicationsname{Thesis}%
   \def\papername{Paper}%
   \def\publicationname{Publication}%
  }

  \@ifpackageloaded{siunitx}{
   \addto\extrasswedish{\sisetup{locale = DE}} % German is close to Swedish for units.
   \addto\extrasenglish{\sisetup{locale = US}}
  }{}

 }{\ClassError{chalmers-thesis}{Package 'babel' required}{}}
 
 % Document metadata setup
 \@ifpackageloaded{hyperref}{
  \@checkifdefined{author}
  \@checkifdefined{title}
  \@checkifdefined{keywords}
  \renewcommand{\and}{, }
  \hypersetup{
    breaklinks,
    pdfcreator    = \LaTeX{},
    pdfproducer   = \LaTeX{},
    bookmarksopen = true,
    pdfauthor     = \@author,
    pdftitle      = \@title,
    pdfkeywords   = \@keywords,
    colorlinks = true,
    urlcolor   = black,
    citecolor  = black,
    linkcolor  = black,
    filecolor  = black,
  }
 }{\ClassWarning{chalmers-thesis}{Package 'hyperref' required}}
}

% Needs to be at the end since its language dependent.
\AtEndDocument{
  \hypersetup{
   pdfsubject = \thesisname
  }
}

% User preamble commands
\renewcommand{\author}[1]{\gdef\@author{#1}}
\renewcommand{\title}[1]{\gdef\@title{#1}}
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}} % Optional
\newcommand{\firstabstract}[1]{\gdef\@firstabstract{#1}} 
\newcommand{\secondabstract}[2]{\gdef\@secondarylanguage{#1}\gdef\@secondabstract{#2}} % Optional
\newcommand{\keywords}[1]{\gdef\@keywords{#1}}
\newcommand{\preface}[1]{\gdef\@preface{#1}} % Optional
\newcommand{\acknowledgements}[1]{\gdef\@acknowledgements{#1}} % Optional
\newcommand{\dedication}[1]{\gdef\@dedication{#1}} % Optional

\newcommand{\coverfigure}[1]{\gdef\@coverfigure{#1}}
\newcommand{\covercaption}[1]{\gdef\@covercaption{#1}}

\newcommand{\copyrightyear}[1]{\gdef\@copyrightyear{#1}}
\newcommand{\reportno}[1]{\gdef\@reportno{#1}}
\newcommand{\ISBN}[1]{\gdef\@ISBN{#1}}

\newcommand{\department}[1]{\gdef\@department{#1}}
\newcommand{\division}[1]{\gdef\@division{#1}}
\newcommand{\thesisin}[1]{\gdef\@thesisin{#1}}
\newcommand{\paperwork}[1]{\gdef\@paperwork{#1}}

\newcommand{\extrafrontmatter}[1]{\gdef\@extrafrontmatter{#1}}

% User commands which shouldn't need to be set.
\newcommand{\ISSN}[1]{\gdef\@ISSN{#1}}
\newcommand{\printers}[1]{\gdef\@printers{#1}}
\newcommand{\telephone}[1]{\gdef\@telephone{#1}}
\newcommand{\postcode}[1]{\gdef\@postcode{#1}}

% Section printed on the table of papers
\newcommand{\thesiscontents}[1]{\gdef\@thesiscontents{#1}}
\thesiscontents{This thesis consists of an extended summary and the following appended papers:}

% User commands for the defence date.
\newcommand{\opponent}[1]{\gdef\@opponent{#1}}
\newcommand{\oppositiondate}[1]{\gdef\@oppositiondate{#1}}

% Some default settings for Chalmers or at least the department of solid mechanics.
\postcode{SE-412 96}
\printers{Chalmers Reproservice}
\telephone{+46 (0)31-772 1000}

\reportno{}

% Thesis specific settings
\if@bachelors
  \global\@bachelorsormasterstrue
  \ISSN{1654-4676}
  \def\titlepage@edge{draw}
  \def\titlepage@chalmerscolor{black}
  \def\titlepage@bg{}
  \def\titlepage@logotype{Avancez_invert}
  \def\titlepage@chagu{Cha_GU_blue_eng}
  \def\thesisname{\bachelorsthesisname}
  \def\@reportseries{\thesisname}
\fi
\if@masters
  \global\@bachelorsormasterstrue
  \ISSN{1652-8557}
  \def\titlepage@edge{draw}
  \def\titlepage@chalmerscolor{black}
  \def\titlepage@bg{\draw[step=5mm,black] (0,0) grid (\paperwidth,0.25\paperheight);}
  \def\titlepage@logotype{Avancez_white}
  \def\titlepage@chagu{Cha_GU_bluewhite_eng}
  \def\thesisname{\masterthesisname}
  \def\@reportseries{\thesisname}
\fi
\if@licentiate
  \ISSN{1652-8565}
  \def\titlepage@edge{}
  \def\titlepage@chalmerscolor{white}
  \def\titlepage@bg{\fill[chalmers_grey] (0,0) rectangle (\paperwidth,0.25\paperheight);}
  \def\titlepage@logotype{Avancez_black}
  \def\titlepage@chagu{Cha_GU_black_eng}
  \def\thesisname{\licentiatethesisname}
  \def\@reportseries{\thesisname}
\fi
\if@doctorate
  \ISSN{0346-718X}
  \def\titlepage@edge{}
  \def\titlepage@chalmerscolor{white}
  % The chalmers_blue is supposely the correct one, but it doesn't match at all.
  %\def\titlepage@bg{\fill[chalmers_blue] (0,0) rectangle (\paperwidth,0.25\paperheight);}
  %\def\titlepage@logotype{Avancez_gold}
  % These colors are taken from the example covers, might lighter colors (looks closer to the printed version).
  \def\titlepage@bg{\fill[chalmers_lightblue] (0,0) rectangle (\paperwidth,0.25\paperheight);}
  \def\titlepage@logotype{Avancez_lightgold}
  \def\titlepage@chagu{Cha_GU_white_eng}
  \def\thesisname{\doctoratethesisname}
  \def\@reportseries{Doktorsavhandlingar vid Chalmers tekniska h\"ogskola\\Ny serie nr.\ }
\fi
\if@techreport
  \ISSN{1652-8549}
  \def\titlepage@edge{draw}
  \def\titlepage@chalmerscolor{black}
  \def\titlepage@bg{\draw[step=5mm,black] (0,0) grid (\paperwidth,0.25\paperheight);}
  \def\titlepage@logotype{Avancez_white}
  \def\titlepage@chagu{Cha_GU_bluewhite_eng}
  \def\thesisname{\techreportname}
  \def\@reportseries{\thesisname}
\fi
\if@projectreport
  \def\thesisname{\projectthesisname}
  \def\@reportseries{\thesisname}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Commands for the thesis papers.
\newcounter{paper}
\setcounter{paper}{0}
\newcommand{\papernumber}{\Alph}

% Commands for the additional publications.
\newcounter{publication}
\setcounter{publication}{0}
\newcommand{\publicationnumber}{\Roman}

% Customizable lengths
\newlength{\topcolumn}
\newlength{\toppadding}
\setlength{\topcolumn}{0.15\textwidth}
\setlength{\toppadding}{1em}

% Customizable command for how the entry is rendered.
% {Type}{Number}{Full citation}
\newcommand{\topentry}[3]{%
  \noindent\parbox[c]{\topcolumn}{\large \hyperlink{#1:#2}{\textbf{#1\ #2}}\hfil}%
  \hspace{\toppadding}%
  \parbox{\textwidth-\topcolumn-\toppadding}{#3}\par\vskip 1em%
}

% Adds text to be written in the list of papers/publications
\newcommand{\toptext}[1]{%
 \addtocontents{top}{%
  \protect\noindent #1\\[1em]
 }
}

% Main command, works similarly as \section.
\newcommand{\paper}[2]{
 \stepcounter{paper}
 \addtocontents{top}{%
  \protect\topentry{\papername}{\papernumber{paper}}{#2}
 }
 \if@draft
  \newpage
 \else
  \cleardoublepage
 \fi
 % Links are always nice;
 \hypertarget{\papername:\papernumber{paper}}{\mbox{}}
 %\phantomsection
 %\addcontentsline{toc}{chapter}{Paper \papernumber{paper}}
 %\belowpdfbookmark{Paper \papernumber{paper}}{paper:\papernumber{paper}}
 \thispagestyle{empty}
 \vspace*{0em}
 \begin{flushright}
  {\huge\textbf{Paper \papernumber{paper}}}
 \end{flushright}
 \vspace*{5em}
 {\noindent\Large\textbf{#1}\par}
%  \vspace*{2em}
%  \begin{center}
%  \begin{minipage}{0.8\textwidth}
%    {\noindent\large#2\par}
%  \end{minipage}
%  \end{center}
 \cleardoublepage
}

% Convenient hyperlinked reference for the introduction text. Usage: \refpaper{A}
\newcommand{\refpaper}[1]{\hyperlink{\papername:#1}{\papername~{#1}}}

% Very similar command to \paper, for additional publications.
\newcommand{\publication}[2]{
 \stepcounter{publication}
 \addtocontents{top}{%
  \protect\topentry{\publicationname}{\publicationnumber{publication}}{#2}
 }
 \if@draft
  \newpage
 \else
  \cleardoublepage
 \fi
 % Links are always nice;
 \hypertarget{\publicationname:\publicationnumber{publication}}{\mbox{}}

 \thispagestyle{empty}
 \vspace*{0em}
 \begin{flushright}
  {\huge\textbf{\publicationname\ \publicationnumber{publication}}}
 \end{flushright}
 \vspace*{5em}
 {\noindent\Large\textbf{#1}\par}
 \newpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Reads the *.top file which is automatically generated by \paper
% Works similarly as \tableofcontents
\newcommand{\tableofpapers}{
\vskip 1em
\@starttoc{top}
\vskip 1em
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Reads the *.topub file which is automatically generated by \paper
% Works similarly as \tableofcontents
\newcommand{\tableofpublications}{
\vskip 1em
\@starttoc{topub}
\vskip 1em
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Renew the table of contents title to fit the rest of the frontmatter
\renewcommand{\tableofcontents}{
 %\phantomsection\addcontentsline{toc}{chapter}{\contentsname}\section*{\contentsname}
 \presectiontitle{\contentsname}
 \vskip 1em
 \@starttoc{toc}
 \vskip 1em
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Command for the titles.
\newcommand{\presectiontitlestyle}[1]{\begin{center}\Large\textsc{#1}\end{center}}
\newcommand{\presectiontitle}[1]{
  \phantomsection\addcontentsline{toc}{chapter}{#1}
  \presectiontitlestyle{#1}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% All the front pages;

% Introducing some new lengths for the front page
\newlength{\headerheight}
\newlength{\headeroffset}
\setlength{\headerheight}{0.215\paperheight}%~6.4cm in a4
\setlength{\headeroffset}{0.125\headerheight}%~0.8cm in a4

\AtEndPreamble{
\@ifpackageloaded{tikz}{
\newcommand{\makecoverpage}{
 \pagestyle{empty}
 \begin{tikzpicture}[remember picture,overlay]
  \node[yshift=-\headerheight] at (current page.north west)
   {\begin{tikzpicture}[remember picture, overlay]
     \clip[\titlepage@edge] (0,\headerheight) -- +(\paperwidth,0) -- (\paperwidth,0) -- (0.75\paperwidth,0)
                 .. controls (0.725\paperwidth,0) and (0.725\paperwidth,\headeroffset) ..
                 (0.70\paperwidth,\headeroffset) -- (0,\headeroffset) -- cycle; % (0.5\paperwidth,\headeroffset) to[out=0,in=180] (0.6\paperwidth,0cm);
     \titlepage@bg
     \if@university
      \node[anchor=west,xshift=0.1\paperwidth,yshift=0.55\headerheight,inner sep=0]{\includegraphics[width=0.8\paperwidth]{figures/\titlepage@chagu}};
     \else
      \node[anchor=west,xshift=0.1\paperwidth,yshift=0.511\headerheight]{\chalmerslogo{\titlepage@chalmerscolor}{0.63\paperwidth}}; % 13.2cm for A4 paper
      \node[anchor=west,xshift=0.745\paperwidth,yshift=0.516\headerheight]{\includegraphics[width=0.171\paperwidth]{figures/\titlepage@logotype}};
     \fi
   \end{tikzpicture}};
   \if@university
    \node[anchor=south east,xshift=-0.1\paperwidth,yshift=0.1\paperheight,inner sep=0] at (current page.south east)
     {\includegraphics[width=0.171\paperwidth]{figures/\titlepage@logotype}};
   \fi
 \end{tikzpicture}
 \ \vfill
 \begin{center}
  \@ifundefined{@coverfigure}{}{\@coverfigure}
 \end{center}
 {\huge\noindent\@title\par} % title, 21
 \@ifundefined{@subtitle}{}{{\Large\noindent\@subtitle\par}} % subtitle, 16
 \if@bachelorsormasters
 {\normalsize\noindent\textit{\thesisname\ \inname\ \@thesisin}\par} % 14 thesis in programmename (only bachelor's and master's)
 \fi
 \vskip 1.5em
 {\renewcommand{\and}{\\}\Large\noindent \MakeUppercase{\@author}\par}% 18
 \vskip 1.5em
 {\small\noindent\@department\\
  \@ifundefined{@division}{}{\textit{\@division}\\}
  \MakeUppercase{\universityname}\\
  \if@university
   \MakeUppercase{\seconduniversityname}\\
  \fi
  \cityname, \countryname\ \@copyrightyear
  \if@bachelorsormasters
    \\ \thesisname\ \@reportno \fi
  \par}

 % Second page, blank
 \newpage
 \mbox{}
}
}{\newcommand{\makecoverpage}{\ClassError{chalmers-thesis}{Package 'tikz' necessary.}{Load the 'tikz' package or use the nocover option.}}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\maketitlepage}{
 \@checkifdefined{thesisin}
 \@checkifdefined{reportno}
 \@checkifdefined{title}
 \@checkifdefined{author}
 \@checkifdefined{department}
 \@checkifdefined{copyrightyear}

 \newpage\thispagestyle{empty}
 \begin{center}
  {\MakeUppercase{\thesisname\ \inname\ \@thesisin}\par}
  \vspace*{\stretch{1}}
  {\Large \@title\par}
  \vskip 1em
  \@ifundefined{@subtitle}{}{{\@subtitle\par}}
  \vskip 1em
  {\renewcommand{\and}{\NoCaseChange{\\}}\MakeTextUppercase{\@author}\par}
  \vspace*{\stretch{3}}
  {\@department\par}
  \@ifundefined{@division}{}{{\textit{\@division}\par}}
  {\MakeUppercase{\universityname}
   \if@university
    \\\MakeUppercase{\seconduniversityname}
   \fi\par}
  \vskip 0.5em
  {\cityname, \countryname\ \@copyrightyear\par}
 \end{center}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makeprintinfopage}{
 \@checkifdefined{thesisin}
 \@checkifdefined{reportno}
 \@checkifdefined{title}
 \@checkifdefined{author}
 \@checkifdefined{department}
 \@checkifdefined{copyrightyear}
 \@checkifdefined{ISSN}

 \newpage
 \vspace*{\stretch{1}}
 {\noindent \@title\\
  \@ifundefined{@subtitle}{}{\@subtitle\\}
  \renewcommand{\and}{\\}\MakeUppercase{\@author}
  \@ifundefined{@ISBN}{}{\\ISBN \@ISBN}
  \par}
 \vskip 2em
 {\noindent \copyright\ {\renewcommand{\and}{, }\MakeUppercase{\@author}}, \@copyrightyear\par}
 \vskip 2em
 {\noindent% 
  \ifdefempty{\@reportno}{}{\@reportseries\ \@reportno\\}%
  \ifdefempty{\@ISSN}{}{ISSN \@ISSN\\}%
  \@department\\
  \@ifundefined{@division}{}{\@division\\}
  \universityname\\
  \@postcode\ \cityname\\
  \countryname\\
  \telephonename: \@telephone\par}
 \vspace*{\stretch{2}}
 \@ifundefined{@covercaption}{
  \@ifundefined{@coverfigure}{}{\ClassWarning{chalmers-thesis}{Cover figure without caption!}}
  }{{\noindent \covername:\\ \@covercaption\par}
  \@ifundefined{@coverfigure}{\ClassWarning{chalmers-thesis}{Caption without cover figure!}}{}
 }
 \vskip 1em
 {\noindent \@printers
  \\ \cityname, \countryname\ \@copyrightyear\par}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makeabstractpage}{
 \@checkifdefined{thesisin}
 \@checkifdefined{title}
 \@checkifdefined{author}
 \@checkifdefined{department}
 \@checkifdefined{firstabstract}
 \@checkifdefined{keywords}

 \newpage
 {\noindent \@title\\
  \@ifundefined{@subtitle}{}{\@subtitle\\}
  \thesisname\ \inname\ \@thesisin\\
   {\renewcommand{\and}{\\}\MakeUppercase{\@author}}\\
  \@department\\
  \@ifundefined{@division}{}{\@division\\}
  \universityname
  \if@university\\\seconduniversityname\fi
 \par}
 \presectiontitle{\abstractname}
 \@firstabstract
 \vskip 1em
 \noindent \keywordsname: \@keywords
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Trick to fully expand the argument
\newenvironment{Otherlanguage}[1]{%
  \begingroup
  \edef\temp{\endgroup\noexpand\otherlanguage{#1}}%
  \temp
}{\endotherlanguage}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makesecondabstractpage}{%
 \@checkifdefined{secondarylanguage}
 \@checkifdefined{secondabstract}
 \newpage
 \begin{Otherlanguage}{\@secondarylanguage}
  \presectiontitle{\abstractname}
  \@secondabstract
 \end{Otherlanguage}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makededicationpage}{%
 \if@draft
  \newpage
 \else
  \cleardoublepage
 \fi
 \vspace*{0.2\textheight}
 \begin{center}\@dedication\end{center}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makeprefacepage}{%
 \if@draft
  \newpage
 \else
  \cleardoublepage
 \fi
 \presectiontitle{\prefacename}
 \@preface
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makeacknowledgementspage}{% Note: Doesn't need a new page.
 \presectiontitle{\acknowledgementsname}
 \@acknowledgements
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\maketableofpaperspage}{
 \if@draft
  \newpage
 \else
  \cleardoublepage
 \fi
 \phantomsection
 \presectiontitle{\listofpublicationsname}
 \noindent \@thesiscontents
 \tableofpapers
 \@ifundefined{@paperwork}{}{
   \noindent \@paperwork
 }
 \tableofpublications
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\maketitle}{%
 \setcounter{page}{-100} % Necessary to give the first pages a unique identifier using hyperref.
 \if@draft\else
  \if@cover
   \makecoverpage
  \fi
 \fi

 \if@draft\else
  \maketitlepage

  \makeprintinfopage
 \fi

 \newpage
 \pagenumbering{roman}
 \makeabstractpage\pagestyle{plain}

 % Empty or second abstract
 \@ifundefined{@secondabstract}{}{
  \makesecondabstractpage
 }

 \@ifundefined{@dedication}{}{
  \makededicationpage
 }

 % Preface and acknowledgements
 \@ifundefined{@preface}{}{
  \makeprefacepage
 }
 \@ifundefined{@acknowledgements}{}{
  \makeacknowledgementspage
 }

 \@ifundefined{@extrafrontmatter}{}{
  \cleardoublepage
  \@extrafrontmatter
 }

 % If its a doctorate or licentiate thesis, include the table of papers.
 \if@bachelorsormasters\else\if@techreport\else
  \maketableofpaperspage
 \fi\fi

 \if@draft
  \newpage
 \else
  \cleardoublepage
 \fi
 \tableofcontents

 % Sets up page numbering for the rest of the document.
 \if@draft
  \newpage
 \else
  \cleardoublepage
 \fi
 \pagenumbering{arabic}
}

\if@projectreport
  \renewcommand{\maketitle}{%
   \setcounter{page}{-99} % Necessary to give the first pages a unique identifier using hyperref.
   \maketitlepage
   \cleardoublepage

 % Preface and acknowledgements
 \@ifundefined{@preface}{}{
  \makeprefacepage
 }
 \@ifundefined{@acknowledgements}{}{
  \makeacknowledgementspage
 }

 \@ifundefined{@extrafrontmatter}{}{
  \cleardoublepage
  \@extrafrontmatter
 }

   \cleardoublepage
   \pagenumbering{roman}
   \pagestyle{plain}
   \tableofcontents
   \cleardoublepage
   \pagenumbering{arabic}
  }
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Page + abstract for defence of thesis.
\newcommand{\makethesisdefence}{
 \thispagestyle{empty}
 \begin{center}
  {\chalmerslogo{black}{0.4\textwidth}\par}
  \vspace{0.1\textheight}
  {\Large\textbf{\@title} \par}
  \vspace{1em}
  \@ifundefined{@subtitle}{}{{\large \@subtitle \par}}
  \vspace{2em}
  {\renewcommand{\and}{\\}\large \textsc{\@author}\par}
  \vspace{\stretch{1}}
  {Thesis submitted for the degree of
   \if@doctorate
    Doctor of Philosophy
   \else
    Licentiate of Engineering
   \fi in \@thesisin\ at the \@department, \universityname, \cityname, \countryname\par}
  \vspace{\stretch{1}}
  {To be 
   \if@doctorate
    defended
   \else
    presented
   \fi
   in public, \@oppositiondate \par}
  \vspace{\stretch{1}}
  {\if@doctorate
    Faculty opponent
   \else
    Invited discussion leader
   \fi\\ \@opponent \par}
  \vspace{\stretch{1}}
  {\@department\\
   \universityname\\
   \@postcode\ \cityname, \countryname\\
   \telephonename\ \@telephone\par}
   \vspace{\stretch{1}}
   \includegraphics[width=0.3\textwidth]{figures/Avancez_black}
 \end{center}

 \makeabstractpage\thispagestyle{empty}
 \newpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CHALMERS logo below. Note that tt is trademarked!
\newcommand{\chalmerslogo}[2]{
\resizebox{#2}{!}{
\begin{tikzpicture}[fill=#1] % This is 11.994 in width, 1.341 in height
% C
\fill (1.481,0.488)
 .. controls (1.385,0.138) and (1.046,0.027) .. (0.742,0.027)
 .. controls (0.304,0.027) and (0,0.256) .. (0,0.687)
 .. controls (0,1.152) and (0.37,1.34) .. (0.76,1.34)
 .. controls (0.901,1.34) and (1.273,1.307) .. (1.437,1.011)
 -- (1.128,0.914)
 .. controls (1.095,0.966) and (0.997,1.102) .. (0.758,1.102)
 .. controls (0.478,1.102) and (0.321,0.919) .. (0.321,0.683)
 .. controls (0.321,0.414) and (0.535,0.271) .. (0.769,0.271)
 .. controls (1.036,0.271) and (1.116,0.411) .. (1.156,0.486)
 -- cycle;

% H
\fill (1.616,1.302) -- (1.925,1.302) -- (1.925,0.827) -- (2.656,0.827) -- (2.656,1.302) -- (2.965,1.302)
 -- (2.965,0.069) -- (2.656,0.069) -- (2.656,0.598) -- (1.925,0.598) -- (1.925,0.069) -- (1.616,0.069)
 -- cycle;

%A
\fill (3.707,1.302) -- (4.041,1.302) -- (4.637,0.069) -- (4.291,0.069) -- (4.168,0.338) -- (3.568,0.338)
 -- (3.449,0.069) -- (3.112,0.069) -- (3.707,1.302) -- cycle
 (3.903,0.923)
 .. controls (3.889,0.955) and (3.876,0.985) .. (3.871,1.021)
 .. controls (3.866,0.986) and (3.851,0.954) .. (3.837,0.922)
 -- (3.668,0.556) -- (4.066,0.556) -- cycle;

% L
\fill (4.796,1.302) -- (5.105,1.302) -- (5.105,0.296) -- (5.728,0.296) -- (5.728,0.069) -- (4.796,0.069) -- cycle;

% M
\fill (5.914,1.302) -- (6.359,1.302) -- (6.687,0.532)
 .. controls (6.721,0.451) and (6.73,0.418) .. (6.743,0.364)
 .. controls (6.756,0.418) and (6.767,0.451) .. (6.8,0.532)
 -- (7.122,1.302) -- (7.564,1.302) -- (7.564,0.069) -- (7.272,0.069) -- (7.272,0.937)
 .. controls (7.272,0.984) and (7.279,1.01) .. (7.285,1.047)
 .. controls (7.272,1.01) and (7.263,0.984) .. (7.243,0.937)
 -- (6.881,0.069) -- (6.6,0.069) -- (6.231,0.937)
 .. controls (6.211,0.984) and (6.205,1.01) .. (6.195,1.047)
 .. controls (6.198,1.01) and (6.205,0.984) .. (6.205,0.937)
 -- (6.205,0.069) -- (5.914,0.069) -- cycle;

% E
\fill (7.85,1.302) -- (8.999,1.302) -- (8.999,1.080) -- (8.159,1.080) -- (8.159,0.802) -- (8.899,0.802)
 -- (8.899,0.584) -- (8.159,0.584) -- (8.159,0.289) -- (9.034,0.289) -- (9.034,0.069) -- (7.850,0.069) -- cycle;

% R
\fill (9.266,1.301) -- (10.128,1.301)
 .. controls (10.219,1.301) and (10.566,1.290) .. (10.566,0.933)
 .. controls (10.566,0.720) and (10.439,0.612) .. (10.246,0.583)
 -- (10.620,0.068) -- (10.265,0.068) -- ( 9.927,0.564) -- ( 9.575,0.564) -- ( 9.575,0.068)
 -- ( 9.266,0.068) -- ( 9.266,1.301) -- cycle
 (9.576,0.782) -- (10.068,0.782)
 .. controls (10.134,0.782) and (10.253,0.791) .. (10.253,0.929)
 .. controls (10.253,1.064) and (10.164,1.085) .. (10.054,1.085)
 -- (9.576,1.085) -- cycle;

% S
\fill (10.956,0.445)
 .. controls (11.028,0.297) and (11.205,0.255) .. (11.373,0.258)
 .. controls (11.448,0.259) and (11.684,0.276) .. (11.681,0.426)
 .. controls (11.680,0.515) and (11.593,0.534) .. (11.527,0.545)
 .. controls (11.476,0.554) and (11.222,0.589) .. (11.164,0.599)
 .. controls (11.051,0.617) and (10.758,0.667) .. (10.758,0.946)
 .. controls (10.758,1.249) and (11.080,1.340) .. (11.326,1.340)
 .. controls (11.612,1.340) and (11.831,1.285) .. (11.981,1.056)
 -- (11.689,0.978)
 .. controls (11.620,1.103) and (11.462,1.121) .. (11.330,1.120)
 .. controls (11.194,1.120) and (11.055,1.089) .. (11.057,0.972)
 .. controls (11.058,0.892) and (11.130,0.872) .. (11.223,0.853)
 .. controls (11.274,0.843) and (11.526,0.805) .. (11.584,0.795)
 .. controls (11.727,0.770) and (11.971,0.723) .. (11.976,0.452)
 .. controls (11.983,0.056) and (11.539,0.033) .. (11.358,0.031)
 .. controls (11.156,0.028) and (10.840,0.057) .. (10.676,0.366)
 -- cycle;
\end{tikzpicture}
}
}
