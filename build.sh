#!/bin/bash
set -e

FILE=${1:-"abntlatex"}

latex abntlatex.ins

pdflatex $FILE.dtx
bibtex example
makeindex -s gglo.ist -o $FILE.gls $FILE.glo
pdflatex $FILE.dtx
pdflatex $FILE.dtx

rm examples/canonical-model/abntlatex.cls
cp abntlatex.cls examples/canonical-model

cd examples
./build.sh --dir=canonical-model --file=model --mode=bib --simplify