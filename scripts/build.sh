#!/bin/bash
set -ex

ROOT_FOLDER="${PWD}"
FILE=${1:-"abntlatex"}

if [ ! -d "$ROOT_FOLDER/scripts" ]; then
  echo "$ROOT_FOLDER/scripts does not exist."
fi

echo ">>> Rodando latex abntlatex.ins"
latex abntlatex.ins

pdflatex $FILE.dtx
bibtex example
makeindex -s gglo.ist -o $FILE.gls $FILE.glo
pdflatex $FILE.dtx
pdflatex $FILE.dtx

TEXMF=$(kpsewhich -var-value TEXMFHOME)
mkdir -p $TEXMF/tex/latex/abntlatex/
mkdir -p $TEXMF/bibtex/bst/

cp $ROOT_FOLDER/abntlatex.cls $TEXMF/tex/latex/abntlatex/
cp $ROOT_FOLDER/abnt.bst $TEXMF/bibtex/bst/
texhash

echo ">>> Chamando build.sh em examples"
cd examples
./build.sh --dir=canonical-model --file=model --mode=bib --simplify