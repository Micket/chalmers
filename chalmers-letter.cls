% This file has been distributed through: http://www.github.com/Micket/chalmers

%% Letter class template for Chalmers University of Technology.
%% Written by Mikael Öhman <mikael.ohman@chalmers.se>
%% This document is released under public domain, but the chalmers logo is trademarked.
%% Some words are translated to swedish if babel langauge is set, otherwise default to English

%% User commands
% \subject{text}

%% Input commands (self-explanatory).
% \author{text}
% \visitingaddress{text}
% \telephone{text}
% \email{text}
% \department{text}
% \web{text}

%% Predefined commands (do not need to be set)
% \postcode{text}
% \organizationnumber{text}

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{chalmers-letter}[2011/04/20 CHALMERS Letter class]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Macro for checking all required commands are set.
\newcommand{\@checkifdefined}[1]{%
  \@ifundefined{@#1}{\ClassError{chalmers-letter}{User input `#1` undefined.}{Use the \textbackslash #1{} command to set it.}}{}%
}

\LoadClass[a4paper,12pt]{letter}

% Set up with the required packages
\RequirePackage{etoolbox}
\RequirePackage[absolute]{textpos}
\RequirePackage{tikz}
\RequirePackage{lastpage}

\newcommand{\contactinformation}{
\fontsize{6pt}{8pt}\fontfamily{phv}\selectfont % Should be 6.5, but its not available.
\textbf{\MakeUppercase{\@department}}\\
\universityname\\
\postcodeprefix\@postcode\ \cityname\\[0.5\baselineskip]
\begin{tabular}{@{}ll}
 \visitingaddressname: & \@visitingaddress\\
 \telephonename:       & \@telephone\\
 \emailname:           & \@email\\
 \webname:             & \@web
\end{tabular}\\[0.5\baselineskip]
Chalmers tekniska h\"ogskola AB\\
\organizationnumbername\ \@organizationnumber
}

\RequirePackage{fancyhdr}
\setlength{\headheight}{15pt}
\renewcommand{\headrulewidth}{0pt} % remove lines as well
\renewcommand{\footrulewidth}{0pt}



\fancypagestyle{firstpage}{ %
\fancyhf{} % remove everything
\fancyhead[L]{
\begin{textblock*}{38mm}(86mm,10mm)\chalmerslogo{black}{38mm}\end{textblock*}
\begin{textblock*}{30mm}(157mm,259mm)\includegraphics[width=30mm]{figures/Avancez_white}\end{textblock*}
\begin{textblock*}{50mm}[1,0](198mm,10mm)\hfill\@date
  \@ifundefined{@refnumber}{}{\\\hfill\referencename\ \@refnumber}\end{textblock*}
\begin{textblock*}{94mm}[0,1](30mm,286mm)\contactinformation\end{textblock*}
}
}

\fancypagestyle{allpages}{ %
\fancyhf{} % remove everything
\fancyhead[C]{
\setlength{\headheight}{175mm}
\begin{textblock*}{38mm}(86mm,10mm)\chalmerslogo{black}{38mm}\end{textblock*}
\begin{textblock*}{40mm}[1,0](198mm,10mm)%
  \hfil\thepage(\pageref{LastPage})%
\end{textblock*} % Date
}
}

\pagestyle{allpages}
\thispagestyle{firstpage}

\RequirePackage[top=36mm, bottom=47mm, left=30mm, right=23mm]{geometry}
%\RequirePackage[top=36mm, bottom=38mm, left=30mm, right=23mm]{geometry} % for second page this is it

% Dynamic setup for user loaded packages.
\AtEndPreamble{
 \@ifpackageloaded{color}{
  \definecolor{chalmers_blue}     {RGB}{  0,  0,102}
  \definecolor{chalmers_grey}     {RGB}{204,204,204}
  \definecolor{chalmers_lightblue}{RGB}{ 28, 78,157}%{1c4e9d}
  \definecolor{chalmers_lightgold}{RGB}{239,197, 22}%{efc516}
  \definecolor{chalmers_purple}   {RGB}{ 51, 51,102}%{333366}
 }{}

 % Check for babel and add more translations
 \@ifpackageloaded{babel}{
  \addto\captionsswedish{%
   \def\countryname{Sverige}%
   \def\cityname{G\"oteborg}%
   \def\telephonename{Telefon}%
   \def\emailname{E-post}%
   \def\webname{Web}%
   \def\universityname{Chalmers tekniska h\"ogskola}%
   \def\organizationnumbername{Organisationsnummer}%
   \def\visitingaddressname{Bes\"ok}%
   \def\referencename{Ref.\ nr.}%
   \def\postcodeprefix{}%
 }
 
  \addto\captionsenglish{%
   \def\countryname{Sweden}%
   \def\cityname{G\"oteborg}%
   \def\telephonename{Telephone}%
   \def\emailname{E-mail}%
   \def\webname{Web}%
   \def\universityname{Chalmers University of Technology}%
   \def\organizationnumbername{Reg.\ No}% VAT No
   \def\visitingaddressname{Visiting adress}%
   \def\referencename{Ref.\ no.}%
   \def\postcodeprefix{SE-}%
  }
 }{\ClassError{chalmers-thesis}{Package 'babel' required}{}}
}

% User preamble commands
\newcommand{\visitingaddress}[1]{\gdef\@visitingaddress{#1}}
\renewcommand{\author}[1]{\gdef\@author{#1}}
\renewcommand{\address}[1]{\gdef\@address{#1}}
\newcommand{\email}[1]{\gdef\@email{#1}}
\newcommand{\web}[1]{\gdef\@web{#1}}
\renewcommand{\title}[1]{\gdef\@title{#1}}
\newcommand{\department}[1]{\gdef\@department{#1}}
\renewcommand{\telephone}[1]{\gdef\@telephone{#1}}
\newcommand{\postcode}[1]{\gdef\@postcode{#1}}
\newcommand{\organizationnumber}[1]{\gdef\@organizationnumber{#1}}
\newcommand{\vatnumber}[1]{\gdef\@vatnumber{#1}}
\newcommand{\refnumber}[1]{\gdef\@refnumber{#1}}

\@onlypreamble\visitingaddress
\@onlypreamble\author
\@onlypreamble\address
\@onlypreamble\email
\@onlypreamble\web
\@onlypreamble\title
\@onlypreamble\department
\@onlypreamble\telephone
\@onlypreamble\postcode
\@onlypreamble\organizationnumber
\@onlypreamble\vatnumber
\@onlypreamble\refnumber

% User commands
\newcommand{\subject}[1]{\underline{#1}}

% Some default settings for Chalmers or at least the department of solid mechanics.
\postcode{412 96}
\organizationnumber{556479-5598}
\vatnumber{SE556479559801}

\fontsize{12pt}{16pt}\fontfamily{ptm}\selectfont

\AtBeginDocument{
\@checkifdefined{author}
\@checkifdefined{address}
\@checkifdefined{department}
\@checkifdefined{telephone}
\@checkifdefined{email}
\@checkifdefined{web}

% Forcing the current language to load.
\expandafter\selectlanguage\expandafter{\bbl@main@language}

\begin{textblock*}{63mm}(30mm,36mm)\@author\end{textblock*}
\begin{textblock*}{63mm}(124mm,36mm)\@address\end{textblock*}
\ \vspace{29mm}
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
