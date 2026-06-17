#!/bin/sh

# sagetex
rm -rf *.sagetex.sage *.sage.py *.sagetex.scmd *.sagetex.sout *.sage *.sobj
rm -rf sage-plots-for-*.tex

# latex
rm -rf *.aux *.lof *.log *.toc *.lot *.out *.glo *.gls *.hd *.ilg

# Bibtex 
rm -rf *.bbl  *.blg 

# backref
rm -rf *.brf

# pdf
rm -rf *.pdf

exit 0