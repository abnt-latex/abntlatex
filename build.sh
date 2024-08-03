pdflatex $1.dtx
makeindex -s gglo.ist -o $1.gls $1.glo
pdflatex $1.dtx
pdflatex $1.dtx