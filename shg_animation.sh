#!/bin/bash

latex () {
    
    pdflatex shg-frame`printf "%03d\n" $i`.tex
    rmtex shg-frame`printf "%03d\n" $i`.
    rm shg-frame`printf "%03d\n" $i`.tex

}

incoming_beam () {

step1=-7.999999999

for (( i = 1; i <= $1; i++ )); do

step1=`echo "$step1+7.0/$1" | bc -l`

echo "\documentclass[border=2mm]{standalone}
\usepackage{amsmath}
\usepackage{pgfplots}
\usetikzlibrary{3d,calc}

\pgfplotsset{compat=1.12}
\begin{document}

%%%% INCOMING RED BEAM
\begin{tikzpicture}
    \begin{axis}[hide axis][]
    %%%% Auxiliar white lines to have same frame size: objects in white color
    \addplot[domain=-8*pi:9*pi,mark=none, white, samples=2] {2.3};
    \addplot[domain=-8*pi:9*pi,mark=none, white, samples=2] {-2};

    %%%% STRUCTURE FOR INCIDENCE
    % \addplot[thick,blue] graphics[xmin=-10,ymin=-1.7 ,xmax=10,ymax=0.3] {cube};
    \addplot[thick,blue] graphics[xmin=-10,ymin=-1.7 ,xmax=10,ymax=0.3] {cube};


    %%%% INCOMING RED BEAM FROM -7*pi TO 0*pi
    \addplot[domain=-8*pi:$step1*pi+pi,samples=200,red,thick,rotate around={-20:(0,0)}]{0.5*sin(deg(x/2))};
    \draw [red,thick,rotate around={-20:(0,0)},->] (-8*pi,0) -- ($step1*pi+pi,0);
    \addplot[domain=-6.5*pi:-6.4*pi,mark=none, white, samples=2] {2.3} node[below, black]{\small $\mathbf{E}(\omega)$} ;
    


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
step2=0     ### used to apear a draw

for (( i = $parse; i < $parse+$1; i++ )); do


echo "\documentclass[border=2mm]{standalone}
\usepackage{amsmath}
\usepackage{pgfplots}
\usetikzlibrary{3d,calc}

\pgfplotsset{compat=1.12}
\begin{document}

%%%% BANISHING RED BEAM
\begin{tikzpicture}
    \begin{axis}[hide axis][]
    %%%% Auxiliar white lines to have same frame size: objects in white color
    \addplot[domain=-8*pi:9*pi,mark=none, white, samples=2] {2.3};
    \addplot[domain=-8*pi:9*pi,mark=none, white, samples=2] {-2};

    %%%% STRUCTURE FOR INCIDENCE
    % \addplot[thick,blue] graphics[xmin=-10,ymin=-1.7 ,xmax=10,ymax=0.3] {cube};
    \addplot[thick,blue] graphics[xmin=-10,ymin=-1.7 ,xmax=10,ymax=0.3] {cube};


    %%%% BANISHING BEAM FROM -7*pi TO 0*pi
    \addplot[domain=-8*pi:0,samples=200,red,thick,rotate around={-20:(0,0)},opacity=$step1]{0.5*sin(deg(x/2))};
    \draw [red,thick,rotate around={-20:(0,0)},->,opacity=$step1] (-8*pi,0) -- (0,0);
    \addplot[domain=-6.5*pi:-6.4*pi,mark=none, white, samples=2] {2.3} node[below,black,opacity=$step1]{\small $\mathbf{E}(\omega)$} ;

    %%%% APPEARING ARROW AT 0,0
    \draw [blue,thick,rotate around={20:(0,0)},->,opacity=$step2] (0,0) -- (0.01,0);
\end{axis}
\end{tikzpicture}


\end{document}" >> shg-frame`printf "%03d\n" $i`.tex

step1=`echo "$step1-1.5/$1" | bc -l` ### used to vanish a draw
step2=`echo "$step2+1.5/$1" | bc -l` ### used to show a draw


latex

done

parse=$i

}



# ################################################################################


outgoing_beam () {

step1=0
step2=0.01
counter=0

for (( i = $parse; i < $parse+$1; i++ )); do


echo "\documentclass[border=2mm]{standalone}
\usepackage{amsmath}
\usepackage{pgfplots}
\usetikzlibrary{3d,calc}

\pgfplotsset{compat=1.12}
\begin{document}

%%%% OUTGOING BLUE BEAM
\begin{tikzpicture}
    \begin{axis}[hide axis][]
    %%%% Auxiliar white lines to have same frame size: objects in white color
    \addplot[domain=-8*pi:9*pi,mark=none, white, samples=2] {2.3};
    \addplot[domain=-8*pi:9*pi,mark=none, white, samples=2] {-2};

    %%%% STRUCTURE FOR INCIDENCE
    % \addplot[thick,blue] graphics[xmin=-10,ymin=-1.7 ,xmax=10,ymax=0.3] {cube};
    \addplot[thick,blue] graphics[xmin=-10,ymin=-1.7 ,xmax=10,ymax=0.3] {cube};


    %%%% OUTGOING BEAM FROM 0,0
    \addplot[domain=0:$step2,samples=200,blue,thick,rotate around={20:(0,0)}]{0.5*sin(deg(x))};
    \draw [blue,thick,rotate around={20:(0,0)},->] (0,0) -- ($step2,0);
    \addplot[domain=-0.1:0.1,mark=none, white, samples=2] {1.2} node[above,black,opacity=1.5*$step1]{\small $\mathbf{E}(2\omega)$} ;

\end{axis}
\end{tikzpicture}


\end{document}" >> shg-frame`printf "%03d\n" $i`.tex

((counter++))

step1=`echo "$step1+1.5/$1" | bc -l` ### used to show a draw
step2=`echo "$step2+8*3.14159/$1" | bc -l` ### used to show a draw



latex

done


}

################################################################################


#### 70 frames
# incoming_beam 28
# wave_transition 14
# outgoing_beam 28


incoming_beam 12
wave_transition 6
outgoing_beam 12



