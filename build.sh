#!/bin/bash
set -e

tlmgr info multibib > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "multibib já instalado"
else
    tlmgr install multibib
fi

FILE=${1:-"abntlatex"}

echo ">>> Rodando latex abntlatex.ins"
latex abntlatex.ins

pdflatex $FILE.dtx
bibtex example
makeindex -s gglo.ist -o $FILE.gls $FILE.glo
pdflatex $FILE.dtx
pdflatex $FILE.dtx

rm -f examples/canonical-model/abntlatex.cls
cp abntlatex.cls examples/canonical-model

echo ">>> Chamando build.sh em examples"
cd examples
./build.sh --dir=canonical-model --file=model --mode=bib --simplify