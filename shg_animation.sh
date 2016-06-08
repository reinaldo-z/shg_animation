#!/bin/bash

latex () {
    
    pdflatex shg-frame`printf "%03d\n" $i`.tex
    rmtex shg-frame`printf "%03d\n" $i`.
    rm shg-frame`printf "%03d\n" $i`.tex

}

incoming_beam () {

step1=-1.999999999

for (( i = 1; i <= $1; i++ )); do

step1=`echo "$step1+7.0/$1" | bc -l`

echo "\documentclass[border=2mm]{standalone}
\usepackage{amsmath}
\usepackage{pgfplots}
\usetikzlibrary{3d,calc}

\pgfplotsset{compat=1.12}
\begin{document}

%%%% INCOMING BEAM
 \begin{tikzpicture}
   \begin{axis}[hide axis][
    clip=false,
    xmin=-5.5*pi,xmax=10*pi,
    ymin=-3,ymax=3,
    axis lines=middle,
    xtick=\empty,
    ytick=\empty,
    ]
     %%%% Auxiliar code to have same frame size: objects in white color
     \addplot[domain=pi:20*pi,samples=200,green,thick]{2+0.1*sin(deg(x))}
                               node[right,pos=0.9,font=\footnotesize]{};
     \addplot[domain=pi:20*pi,samples=200,green,thick]{-2+0.1*sin(deg(x))}
                               node[right,pos=0.9,font=\footnotesize]{};
     
     
     %%%% INCOMING BEAM FROM -2*pi TO 5*pi -> RANGE OF 7
     \addplot[domain=-2*pi:$step1*pi,samples=200,red,thick, rotate=-20]{1+0.5*sin(deg(x))}
                               node[right,pos=0.9,font=\footnotesize]{};
     \draw [red, thick, rotate=-20, ->] (-2*pi,1) -- ($step1*pi,1) node [right] {};
     \draw [] (5,1.5) node [right] {\small $\overrightarrow{E}(\omega)$};
   \end{axis}
 \end{tikzpicture}


\end{document}" >> shg-frame`printf "%03d\n" $i`.tex

latex

done

parse=$i

}


################################################################################


wave_transition () {


step1=1     ### used to vanish a draw
step2=0     ### used to show a draw

for (( i = $parse; i <= $parse+$1; i++ )); do


echo "\documentclass[border=2mm]{standalone}
\usepackage{amsmath}
\usepackage{pgfplots}
\usetikzlibrary{3d,calc}

\pgfplotsset{compat=1.12}
\begin{document}


%%% EXCITON
 \begin{tikzpicture}
   \begin{axis}[hide axis][
    clip=false,
    xmin=0,xmax=10*pi,
    ymin=-3,ymax=3,
    axis lines=middle,
    xtick=\empty,
    ytick=\empty,
    ]
     %%%% Auxiliar code to have same frame size: objects in white color
     \addplot[domain=pi:20*pi,samples=200,green,thick]{2+0.1*sin(deg(x))}
                               node[right,pos=0.9,font=\footnotesize]{};
     \addplot[domain=pi:20*pi,samples=200,green,thick]{-2+0.1*sin(deg(x))}
                               node[right,pos=0.9,font=\footnotesize]{};

     %%%% 1 omega beam banishing
     \draw [opacity=$step1] (5,1.5) node [right] {\small $\overrightarrow{E}(\omega)$};
     \addplot[domain=-2*pi:5*pi,samples=200,red,thick, rotate=-20, opacity=$step1]{1+0.5*sin(deg(x))}
                               node[right,pos=0.9,font=\footnotesize]{};
     \draw [red, thick, rotate=-20, ->, opacity=$step1] (-2*pi,1) -- (5*pi,1) node [right] {};
     \draw [red, thick, rotate=-20, ->] (-2*pi,1) -- (5*pi,1) node [right] {};
   

     \draw [blue, thick, rotate=-20, ->, opacity=$step2] (5*pi,1) -- (5.001*pi,1) node [right] {};

   \end{axis}
 \end{tikzpicture}

\end{document}" >> shg-frame`printf "%03d\n" $i`.tex

step1=`echo "$step1-1.5/$1" | bc -l` ### used to vanish a draw
step2=`echo "$step2+1.5/$1" | bc -l` ### used to show a draw


latex

done


}



# ################################################################################


exciton () {

step1=1
step2=0

for (( i = $parse; i <= $parse+$1; i++ )); do


echo "\documentclass[border=2mm]{standalone}
\usepackage{amsmath}
\usepackage{pgfplots}
\usetikzlibrary{3d,calc}

\pgfplotsset{compat=1.12}
\begin{document}


%%% EXCITON
 \begin{tikzpicture}
   \begin{axis}[hide axis][
    clip=false,
    xmin=0,xmax=10*pi,
    ymin=-3,ymax=3,
    axis lines=middle,
    xtick=\empty,
    ytick=\empty,
    ]
     %%%% Auxiliar code to have same frame size: objects in white color
     \addplot[domain=-2*pi:1*pi,samples=200,white,thick]{0.5*sin(deg(x))}
                               node[right,pos=0.9,font=\footnotesize]{};
     \draw [white, thick, ->] (-2.03*pi,0) -- (1*pi,0) node [right] {};
     \draw [white] (-1.5*pi,0.6) node [left] {$\overrightarrow{E}$};


     \addplot[domain=0:10*pi,samples=200,black,thick]{-1+sin(deg(x/10))}
                               node[right,pos=0.9,font=\footnotesize]{};
     \addplot[domain=0:10*pi,samples=200,black,thick]{2-sin(deg(x/10))}
                               node[right,pos=0.9,font=\footnotesize]{};

     
     %%%% Electrom moves from (5*pi,0) to (5*pi,1)
     \shade[ball color=white!60!white,opacity=0.4] (5*pi,0) circle (0.2cm); %% hole
     \draw [] (5.2*pi,0.15) node [right] {hole};
     \shade[ball color=gray!50!white,opacity=1] (5*pi,1) circle (0.2cm); %% electron
     \draw [] (5.2*pi,0.9) node [right] {\$e^{-}\$};
     % \draw [opacity=$step1] (4.6*pi,-0.6) node [left] {IPA};

     %%%% Red arrow banishing
     \draw [red, thick, ->, opacity=$step1] (5*pi,0) -- (5*pi,1)  node [right] {};
     \draw [opacity=$step1, red] (6.2*pi,0.5) node [right] {\$\hbar \omega$};
     %%%% Blue arrows and text apearing
     \draw [blue, thick, ->, opacity=$step2] (5*pi,1) -- (5*pi,0.5)  node [right] {};
     \draw [blue, thick, ->, opacity=$step2] (5*pi,0) -- (5*pi,0.5)  node [right] {};
     \draw [opacity=$step2] (5*pi,0.6)  node [left] {exciton:  \hspace{3mm}};
     \draw [opacity=$step2] (5*pi,0.4)  node [left] {Coulomb force  \hspace{3mm}};

   \end{axis}
 \end{tikzpicture}

\end{document}" >> shg-frame`printf "%03d\n" $i`.tex

step1=`echo "$step1-1.5/$1" | bc -l` ### used to vanish a draw
step2=`echo "$step2+1.5/$1" | bc -l` ### used to show a draw


latex

done


}

################################################################################



incoming_beam 4
wave_transition 4
# exciton 4


# 70 30 20
