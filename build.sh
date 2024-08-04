pdflatex $1.dtx
bibtex example
makeindex -s gglo.ist -o $1.gls $1.glo
pdflatex $1.dtx
pdflatex $1.dtx

cd examples
./build.sh --dir=canonical-model --file=model --mode=bib --simplify