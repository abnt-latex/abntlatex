latex abntlatex.ins

pdflatex $1.dtx
bibtex example
makeindex -s gglo.ist -o $1.gls $1.glo
pdflatex $1.dtx
pdflatex $1.dtx

rm examples/canonical-model/abntlatex.cls
cp abntlatex.cls examples/canonical-model

cd examples
./build.sh --dir=canonical-model --file=model --mode=bib --simplify