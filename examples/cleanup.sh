#!/bin/bash

OPTSTRING=":f:-:"

PROJECT_DIR=""
FILE="main"

while getopts ${OPTSTRING} OPT; do
    # long option
    if [ "$OPT" = "-" ]; then 
        OPT="${OPTARG%%=*}"
        OPTARG="${OPTARG#"$OPT"}"
        OPTARG="${OPTARG#=}"
    fi

    case ${OPT} in
         d | dir)
            PROJECT_DIR="${OPTARG}/"
            ;;
        f | file)
            FILE="${OPTARG}"
            ;;
        :)
            echo "Option -${OPTARG} requires an argument."
            exit 1
            ;;
        ?)
            echo "Invalid option: -${OPTARG}."
            exit 1
            ;;
    esac
done

shift $((OPTIND-1)) # remove parsed options and args from $@ list

FIGURES_SVG=$(find "${PROJECT_DIR}figure/" -name "*.svg")
FIGURES_PDF=${FIGURES_SVG//".svg"/".pdf"}

R_FILES=$(find ${PROJECT_DIR} -name "*.Rtex")
R_FILES+=$'\n'
TEX_FILES=${R_FILES//".Rtex"/".tex"}
TEX_FILES_SUB="${TEX_FILES}"$'\n'"$(find ${PROJECT_DIR} -name '*.tex')"

FILE_EXTENSIONS=(
    ## Bibliography auxiliary files (bibtex/biblatex/biber)
    "bbl" "bcf" "blg"
    "brf" ### hyperref
    "idx" "ilg" "ind" "ist" ### makeidx
    "glg" "glo" "gls" ### glossaries
    ## Core latex/pdflatex auxiliary files
    "aux" "lof" "log" "lot" "fls" "out" "toc" "fmt" "fot" "cb" "cb2" "lb" "hd"
    ## SageTeX
    "sagetex.sage" "sage.py" "sagetex.scmd" "sagetex.sout" "sage" "sobj"
    ## Output
    "pdf"
    )

for FILE_EXTENSION in ${FILE_EXTENSIONS[@]}; do
    rm -f ${TEX_FILES_SUB//".tex"/".${FILE_EXTENSION}"}
done

rm -f ${FIGURES_PDF}
rm -f ${TEX_FILES}
cd ${PROJECT_DIR}
rm -f -r cache/*
rm -f -r figure/*.pdf
rm -f -r datas/generated/*