# Latex Makefile

.PHONY: all clean

MAIN    = gmm

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex settings.tex
	xelatex $(MAIN).tex
	xelatex $(MAIN).tex

FILES  = "*.{aux,bbl,bcf,blg,log,pdf,run.xml,out,snm,nav,toc}"
clean:
	eval "rm -rf ${FILES}"
