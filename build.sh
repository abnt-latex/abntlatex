#!/bin/bash
set -ex

echo ">>> Verificando multibib..."

if kpsewhich multibib.sty >/dev/null 2>&1; then
    echo "multibib já está instalado."
else
    echo "multibib não encontrado, tentando instalar..."
    
    tlmgr option repository https://mirror.ctan.org/systems/texlive/tlnet
    tlmgr update --self --all || true
    tlmgr install multibib || echo "Não foi possível instalar multibib (mirror indisponível)."
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