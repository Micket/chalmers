%
% By Carl Sandström
%
% To set personal data:
%
% \sender{Carl Sandström}
% \telephone{031-772 15 23}
% \email{carl.sandstrom@chalmers.se}
% \thesisname{On Homogenization of Stokes Flow in Porous Media}
%
% Use \maketitlepage to create letter.
%

\NeedsTeXFormat{LaTeX2e}

% Define variables "licentiate" and "doctorate"
\newif\iflicentiate
\newif\ifdoctorate

% Read options from \documentclass command
\DeclareOption{licentiate}{\global\licentiatetrue\global\doctoratefalse}
\DeclareOption{doctorate}{\global\licentiatefalse\global\doctoratetrue}
\ProcessOptions

\ProvidesClass{chalmers-thesisletter}
\LoadClass{article}

% Load packages
\RequirePackage[left=0.5cm,top=1cm,right=0.5cm,bottom=1cm,nohead,nofoot]{geometry}
\RequirePackage{graphicx}

% Define output variables
\newcommand{\sender}[1]{\gdef\@sender{#1}}
\newcommand{\telephone}[1]{\gdef\@telephone{#1}}
\newcommand{\email}[1]{\gdef\@email{#1}}
\newcommand{\thesistitle}[1]{\gdef\@thesistitle{#1}}
\newcommand{\department}[1]{\gdef\@department{#1}}


% \newcommand{\maketitlepage}{
% \thispagestyle{empty}
% \vbox to 0.90\textheight {
% \begin{minipage}[c]{0.49\linewidth}
%  \begin{tabular}{rl}
%    Date & \today \\
%    Sender & \@sender \\
%    Telephone & \@telephone \\
%    E-mail & \@email
%  \end{tabular}
%  \vspace{7em}
% \end{minipage}
% \begin{minipage}[t]{0.49\linewidth}
%   \begin{center}
%     \includegraphics[width=0.35\linewidth]{figures/Avancez_black}  \\
%     \vspace{2em}
%     \parbox{0.45\paperwidth}{
%     Chalmers University of Technology \\
%     \@department\vspace{1em}\\
%     H\"orsalsv\"agen 7a \\ 412 96 G\"oteborg \\ Sweden
%     }
%   \end{center}
% \end{minipage}
% %\vskip 1em
% %\hrulefill
% %\vskip 1em
% %{\centering
% \begin{center}
% \parbox{0.8\paperwidth}{
% Enclosed is a copy of my 
% \iflicentiate
% Licentiate
% \fi
% \ifdoctorate
% PhD
% \fi
%  thesis entitled:\\
% \emph{\@thesistitle}
% %\vspace{1.5cm}\\
% \vfil
% Sincerely, \vspace{1.5cm} \\
% \@sender
% \vskip 1em
% }
% 
% \end{center}
% }
% }




\newcommand{\maketitlepage}{
\thispagestyle{empty}
\vbox to 0.47\textheight {
\begin{minipage}[c]{0.49\linewidth}
 \begin{tabular}{rl}
   Date & \today \\
   Sender & \@sender \\
   Telephone & \@telephone \\
   E-mail & \@email
 \end{tabular}
 \vspace{7em}
\end{minipage}
\begin{minipage}[t]{0.49\linewidth}
  \begin{center}
    \includegraphics[width=0.35\linewidth]{figures/Avancez_black}  \\
    \vspace{2em}
    \parbox{0.45\paperwidth}{
    Chalmers University of Technology \\
    \@department\vspace{1em}\\
    H\"orsalsv\"agen 7a \\ 412 96 G\"oteborg \\ Sweden
    }
  \end{center}
\end{minipage}
\vskip 1em
\hrulefill
\vskip 1em

 \hspace{2em}\parbox{0.8\paperwidth}{
 Enclosed is a copy of my 
 \iflicentiate
 Licentiate
 \fi
 \ifdoctorate
 PhD
 \fi
  thesis entitled:\\
 \emph{\@thesistitle}
 }
 %\vspace{1.5cm}\\
 \vfill
 \hspace{2em}\parbox{0.8\paperwidth}{
 \noindent Sincerely, \vspace{2.5cm} \\
 \@sender
 }
 \vskip 1em
}
}





