# Latex Makefile

MAIN     = gmm_presentation
SOURCES  = Makefile \
		   $(MAIN).tex \
		   settings.tex

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex Makefile settings.tex
	xelatex $(MAIN).tex
	xelatex $(MAIN).tex
	open    $(MAIN).pdf

PATTERNS  = "*.{aux,bbl,bcf,blg,log,pdf,run.xml,out,snm,nav,toc}"
clean:
	eval "rm -rf ${PATTERNS}"

.PHONY: clean all
