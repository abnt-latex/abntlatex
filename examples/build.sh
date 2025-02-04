#!/bin/bash

OPTSTRING=":m:f:s-:"

MODE="simple"
PROJECT_DIR=""
FILE="main"
SIMPLIFY=false

while getopts ${OPTSTRING} OPT; do
    # long option
    if [ "$OPT" = "-" ]; then 
        OPT="${OPTARG%%=*}"
        OPTARG="${OPTARG#"$OPT"}"
        OPTARG="${OPTARG#=}"
    fi

    case ${OPT} in
        m | mode)
            MODE="${OPTARG}"
            ;;
        d | dir)
            PROJECT_DIR="${OPTARG}/"
            ;;
        f | file)
            FILE="${OPTARG}"
            ;;
        s | simplify)
            SIMPLIFY=true
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

FIGURES_SVG=$(find "${PROJECT_DIR}figures/" -name "*.svg")

R_FILES=$(find ${PROJECT_DIR} -name "*.Rtex")
R_FILES+=$'\n'

exec_pdflatex() {
    echo "==============================================================================="
    echo "PDFLATEX"
    echo "==============================================================================="

    cd ${PROJECT_DIR} 
    pdflatex $1 ${FILE}
    cd ..
}

exec_bibtex() {
    echo "==============================================================================="
    echo "BIBTEX"
    echo "==============================================================================="

    cd ${PROJECT_DIR} 
    bibtex ${FILE}
    cd ..
}

exec_makeindex() {
    echo "==============================================================================="
    echo "MAKEINDEX"
    echo "==============================================================================="

    cd ${PROJECT_DIR} 
    makeindex ${FILE}.idx
    cd ..
}

exec_makeglossaries() {
    echo "==============================================================================="
    echo "MAKEGLOSSARIES"
    echo "==============================================================================="

    cd ${PROJECT_DIR} 
    makeglossaries ${FILE}
    cd ..
}

simplify_output() {
    if [ "$SIMPLIFY" = true ] ; then
        grep -P -i -z -o "(?:This\ is|Output\ written|No\ pages\ of\ output|.*\ Error|Missing\ character:|.*for\ symbol.*on\ input\ line|\#\#|\\endL.*problem|\*\*\*\s|all\ text\ was\ ignored\ after\ line|.*Fatal\ error|\(.*end\ occurred\ inside\ a\ group|(LaTeX|Package|Class|Module).*(Error|Warning)|.*Citation.*undefined|\*.*\*|(?:Und|Ov)erfull|badbox|LaTeX2e|(?m)^!.*\s+).*[\n\r]?+" | grep --color=always -a -e "^" -e "!\|\\\\[a-zA-Z]\+"
    else
        grep -E "^"
    fi
}

exec_R() {
    echo "==============================================================================="
    echo "R"
    echo "==============================================================================="

    R_FILES_ARRAY=${R_FILES%$'\n'*}

    R_COMMAND="library(knitr);setwd('${PROJECT_DIR}');Sys.setlocale('LC_ALL', 'C.utf8');options(encoding = 'UTF-8');"

    for R_FILE in $R_FILES_ARRAY
    do
        INPUT=${R_FILE//"${PROJECT_DIR}"/""}
        TEX_FILE=${R_FILE//".Rtex"/".tex"}
        OUTPUT=${TEX_FILE//"${PROJECT_DIR}"/""}

        R_COMMAND+="knit(input = '${INPUT}', output = '${OUTPUT}', encoding = 'UTF-8');"
    done

    R -e "$R_COMMAND"
}

for FIGURE_SVG in $FIGURES_SVG; do
    FIGURE_PDF=${FIGURE_SVG//".svg"/".pdf"}

    inkscape --export-filename=$FIGURE_PDF $FIGURE_SVG
done

exec_R

case ${MODE} in
    complete)
        exec_pdflatex --interaction=batchmode --draftmode
	    exec_bibtex
	    exec_makeindex
	    exec_makeglossaries
        exec_pdflatex --interaction=batchmode --draftmode
        exec_pdflatex --interaction=nonstopmode | simplify_output
        ;;
    bib)
        exec_pdflatex --interaction=batchmode --draftmode
        exec_bibtex
        exec_pdflatex --interaction=batchmode --draftmode
        exec_pdflatex #--interaction=nonstopmode | simplify_output
        ;;
    simple)
        exec_pdflatex --interaction=nonstopmode | simplify_output
        ;;
    *)
        echo "Invalid option mode, try another."
        exit 1
        ;;
esac
