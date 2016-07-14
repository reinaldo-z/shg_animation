#!/bin/bash

latex () {
    
    pdflatex shg-frame`printf "%03d\n" $i`.tex
    rmtex shg-frame`printf "%03d\n" $i`.
    rm shg-frame`printf "%03d\n" $i`.tex

}

incoming_beam () {

echo "\documentclass{article}
\usepackage{amsmath}
\usepackage{pgfplots}
\usetikzlibrary{3d,calc}
\usepackage[paperwidth=2.9in,paperheight=1.9in,margin=0in]{geometry}

\pagestyle{empty}

\pgfplotsset{compat=1.12}
\begin{document}

%%%% INCOMING RED BEAM
\begin{tikzpicture}
    \begin{axis}[hide axis][]

    %%%% Trash code
    \addplot[domain=-8*pi:-8.01,samples=200,white,thick,rotate around={-20:(0,0)}]{0.5*sin(deg(x/2))};
    \addplot[domain=-6.5*pi:-6.4*pi,mark=none, white, samples=2] {2.3} node[below, white]{\small $\mathbf{E}(\omega)$} ;    
    \addplot[domain=7.99*pi:8*pi,samples=200,white,thick,rotate around={20:(0,0)}]{0.5*sin(deg(x))};
    \draw [white,thick,rotate around={20:(0,0)},->] (7.99*pi,0) -- (8*pi,0);
    \addplot[domain=-0.1:0.1,mark=none, white, samples=2] {1.2} node[above,white]{\small $\mathbf{E}(2\omega)$} ;

    %%%% STRUCTURE FOR INC    \addplot[domain=7.9:8*pi,samples=200,white,thick,rotate around={20:(0,0)}]{0.5*sin(deg(x))};    \addplot[domain=7.9:8*pi,samples=200,white,thick,rotate around={20:(0,0)}]{0.5*sin(deg(x))};    \addplot[domain=7.9:8*pi,samples=200,white,thick,rotate around={20:(0,0)}]{0.5*sin(deg(x))};IDENCE
    \addplot[thick,blue] graphics[xmin=-16.5,ymin=-1.3 ,xmax=23.5,ymax=1.25 ] {grapha};
    % \addplot[thick,blue] graphics[xmin=-10,ymin=-1.7 ,xmax=10,ymax=0.3] {cube};


\end{axis}
\end{tikzpicture}


\end{document}" >> shg-frame`printf "%03d\n" $i`.tex

latex

range=-24.
div=`echo "- $range/$1" | bc -l`

for (( i = 1; i <= $1+1; i++ )); do

step1=`echo "$range + $div*($i-1)" | bc -l`


echo "\documentclass{article}
\usepackage{amsmath}
\usepackage{pgfplots}
\usetikzlibrary{3d,calc}
\usepackage[paperwidth=2.9in,paperheight=1.9in,margin=0in]{geometry}

\pagestyle{empty}

\pgfplotsset{compat=1.12}
\begin{document}

%%%% INCOMING RED BEAM
\begin{tikzpicture}
    \begin{axis}[hide axis][]

    %%%% Trash code
    \addplot[domain=-8*pi:-8.01,samples=200,white,thick,rotate around={-20:(0,0)}]{0.5*sin(deg(x/2))};
    \addplot[domain=-6.5*pi:-6.4*pi,mark=none, white, samples=2] {2.3} node[below, white]{\small $\mathbf{E}(\omega)$} ;    
    \addplot[domain=7.99*pi:8*pi,samples=200,white,thick,rotate around={20:(0,0)}]{0.5*sin(deg(x))};
    \draw [white,thick,rotate around={20:(0,0)},->] (7.99*pi,0) -- (8*pi,0);
    \addplot[domain=-0.1:0.1,mark=none, white, samples=2] {1.2} node[above,white]{\small $\mathbf{E}(2\omega)$} ;


    %%%% STRUCTURE FOR INC    \draw [white,thick,rotate around={20:(0,0)},->] (7.9,0) -- (8*pi,0);    \draw [white,thick,rotate around={20:(0,0)},->] (7.9,0) -- (8*pi,0);    \draw [white,thick,rotate around={20:(0,0)},->] (7.9,0) -- (8*pi,0);IDENCE
    \addplot[thick,blue] graphics[xmin=-16.5,ymin=-1.3 ,xmax=23.5,ymax=1.25 ] {grapha};
    % \addplot[thick,blue] graphics[xmin=-10,ymin=-1.7 ,xmax=10,ymax=0.3] {cube};

    %%%% INCOMING RED BEAM FROM -7*pi TO 0*pi
    \addplot[domain=-8*pi:$step1,samples=200,red,thick,rotate around={-20:(0,0)}]{0.5*sin(deg(x/2))};
    \draw [red,thick,rotate around={-20:(0,0)},->] (-8*pi,0) -- ($step1,0);
    \addplot[domain=-6.5*pi:-6.4*pi,mark=none, white, samples=2] {2.3} node[below, black]{\small $\mathbf{E}(\omega)$} ;
    


\end{axis}
\end{tikzpicture}


\end{document}" >> shg-frame`printf "%03d\n" $i`.tex

latex

done

parse=$i
echo $parse

}


################################################################################


wave_transition () {


step1=1     ### used to vanish a draw
step2=0     ### used to apear a draw

for (( i = $parse; i < $parse+$1; i++ )); do


echo "\documentclass{article}
\usepackage{amsmath}
\usepackage{pgfplots}
\usetikzlibrary{3d,calc}
\usepackage[paperwidth=2.9in,paperheight=1.9in,margin=0in]{geometry}

\pgfplotsset{compat=1.12}
\begin{document}

%%%% BANISHING RED BEAM
\begin{tikzpicture}
    \begin{axis}[hide axis][]

    %%%% Trash code
    \addplot[domain=-8*pi:-8.01,samples=200,white,thick,rotate around={-20:(0,0)}]{0.5*sin(deg(x/2))};
    \addplot[domain=-6.5*pi:-6.4*pi,mark=none, white, samples=2] {2.3} node[below, white]{\small $\mathbf{E}(\omega)$} ;    
    \addplot[domain=7.99*pi:8*pi,samples=200,white,thick,rotate around={20:(0,0)}]{0.5*sin(deg(x))};
    \draw [white,thick,rotate around={20:(0,0)},->] (7.99*pi,0) -- (8*pi,0);
    \addplot[domain=-0.1:0.1,mark=none, white, samples=2] {1.2} node[above,white]{\small $\mathbf{E}(2\omega)$} ;


    %%%% STRUCTURE FOR INCIDENCE
    \addplot[thick,blue] graphics[xmin=-16.5,ymin=-1.3 ,xmax=23.5,ymax=1.25 ] {grapha};
    % \addplot[thick,blue]    \addplot[domain=-0.1:0.1,mark=none, white, samples=2] {1.2} node[above,black,opacity=1.5*$step1]{\small $\mathbf{E}(2\omega)$} ;    \addplot[domain=-0.1:0.1,mark=none, white, samples=2] {1.2} node[above,black,opacity=1.5*$step1]{\small $\mathbf{E}(2\omega)$} ;    \addplot[domain=-0.1:0.1,mark=none, white, samples=2] {1.2} node[above,black,opacity=1.5*$step1]{\small $\mathbf{E}(2\omega)$} ; graphics[xmin=-10,ymin=-1.7 ,xmax=10,ymax=0.3] {cube};

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

step1=0.01
step2=0.01
counter=0

range=25.13
div=`echo "$range/$1" | bc -l`


for (( i = $parse; i < $parse+$1; i++ )); do


echo "i=$i"
echo "div=$div"
echo "step1=$step1"

echo "\documentclass{article}
\usepackage{amsmath}
\usepackage{pgfplots}
\usetikzlibrary{3d,calc}
\usepackage[paperwidth=2.9in,paperheight=1.9in,margin=0in]{geometry}

\pgfplotsset{compat=1.12}
\begin{document}

%%%% OUTGOING BLUE BEAM
\begin{tikzpicture}
    \begin{axis}[hide axis][]

    %%%% Trash code
    \addplot[domain=-8*pi:-8.01,samples=200,white,thick,rotate around={-20:(0,0)}]{0.5*sin(deg(x/2))};
    \addplot[domain=-6.5*pi:-6.4*pi,mark=none, white, samples=2] {2.3} node[below, white]{\small $\mathbf{E}(\omega)$} ;    
    \addplot[domain=7.99*pi:8*pi,samples=200,white,thick,rotate around={20:(0,0)}]{0.5*sin(deg(x))};
    \draw [white,thick,rotate around={20:(0,0)},->] (7.99*pi,0) -- (8*pi,0);
    \addplot[domain=-0.1:0.1,mark=none, white, samples=2] {1.2} node[above,white]{\small $\mathbf{E}(2\omega)$} ;


    %%%% STRUCTURE FOR INCIDENCE
    \addplot[thick,blue] graphics[xmin=-16.5,ymin=-1.3 ,xmax=23.5,ymax=1.25 ] {grapha};
    % \addplot[thick,blue] graphics[xmin=-10,ymin=-1.7 ,xmax=10,ymax=0.3] {cube};


    %%%% OUTGOING BEAM FROM 0,0
    \addplot[domain=0:$step1,samples=200,blue,thick,rotate around={20:(0,0)}]{0.5*sin(deg(x))};
    \draw [blue,thick,rotate around={20:(0,0)},->] (0,0) -- ($step1,0);
    \addplot[domain=-0.1:0.1,mark=none, white, samples=2] {1.2} node[above,black,opacity=1.5*$step1]{\small $\mathbf{E}(2\omega)$} ;

\end{axis}
\end{tikzpicture}


\end{document}" >> shg-frame`printf "%03d\n" $i`.tex

# ((counter++))

step1=`echo "$step1 + $div" | bc -l`


# step1=`echo "$step1+1.5/$1" | bc -l` ### used to show a draw
# step2=`echo "$step2+8*3.14159/$1" | bc -l` ### used to show a draw



latex

done

parse=$i

}


outgoing_desapearing_beam () {

step1=0
step2=0.01
counter=0

range=25.13
div=`echo "$range/$1" | bc -l`


for (( i = $parse+1; i < $parse+$1; i++ )); do

step1=`echo "0.01 + $div*($i - $parse)" | bc -l`

echo "\documentclass{article}
\usepackage{amsmath}
\usepackage{pgfplots}
\usetikzlibrary{3d,calc}
\usepackage[paperwidth=2.9in,paperheight=1.9in,margin=0in]{geometry}

\pgfplotsset{compat=1.12}
\begin{document}

%%%% OUTGOING BLUE BEAM
\begin{tikzpicture}
    \begin{axis}[hide axis][]

    %%%% Trash code
    \addplot[domain=-8*pi:-8.01,samples=200,white,thick,rotate around={-20:(0,0)}]{0.5*sin(deg(x/2))};
    \addplot[domain=-6.5*pi:-6.4*pi,mark=none, white, samples=2] {2.3} node[below, white]{\small $\mathbf{E}(\omega)$} ;    
    \addplot[domain=7.99*pi:8*pi,samples=200,white,thick,rotate around={20:(0,0)}]{0.5*sin(deg(x))};
    \draw [white,thick,rotate around={20:(0,0)},->] (7.99*pi,0) -- (8*pi,0);
    \addplot[domain=-0.1:0.1,mark=none, white, samples=2] {1.2} node[above,white]{\small $\mathbf{E}(2\omega)$} ;


    %%%% STRUCTURE FOR INCIDENCE
    \addplot[thick,blue] graphics[xmin=-16.5,ymin=-1.3 ,xmax=23.5,ymax=1.25 ] {grapha};
    % \addplot[thick,blue] graphics[xmin=-10,ymin=-1.7 ,xmax=10,ymax=0.3] {cube};


    %%%% OUTGOING BEAM FROM 0,0
    \addplot[domain=$step1:8*pi,samples=200,blue,thick,rotate around={20:(0,0)}]{0.5*sin(deg(x))};
    \draw [blue,thick,rotate around={20:(0,0)},-] ($step1,0) -- (8*pi,0);
    \addplot[domain=-0.1:0.1,mark=none, white, samples=2] {1.2} node[above,black]{\small $\mathbf{E}(2\omega)$} ;

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
incoming_beam 1             # Genera 2 figuras  mas que las indicadas, 
                            # incluyendo la 000 que es solo la estructura
wave_transition 0           # OPCIONAL: Usar "0" o al menos "3" como entrada. 
                            # Produce una trancisi\'on suave entre 1omega y 2 omega.
                            # Genera el numero de figuras de entrada.
outgoing_beam 4
outgoing_desapearing_beam 0

# incoming_beam 12
# wave_transition 6
# outgoing_beam 12



