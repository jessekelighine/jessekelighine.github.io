# Latex Makefile

MAIN    = james-stein_estimator
# FIGURES =

.PHONY: all clean

all: $(MAIN).pdf

$(MAIN).pdf: ${MAIN}.tex settings.tex Makefile
	xelatex ${MAIN}.tex
	xelatex ${MAIN}.tex
	open ${MAIN}.pdf

FILES  = "*.{aux,bbl,bcf,blg,log,pdf,run.xml,out,snm,nav,toc}"
clean:
	eval "rm -rf ${FILES}"
