#!/bin/bash
set -ex

echo ">>> Verificando pacotes..."
if tlmgr info multibib >/dev/null 2>&1; then
    echo "multibib listado no tlmgr"
else
    curl -L -o multibib.zip http://mirrors.ctan.org/macros/latex/contrib/multibib.zip
    unzip multibib.zip -d /usr/local/texlive/texmf-local/tex/latex/multibib
    mktexlsr
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