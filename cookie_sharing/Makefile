# XeLaTeX Makefile

.PHONY: clean all

MAIN    = cookie_sharing
FIGURES = linear/linear_cookie_sharing.pdf

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex $(FIGURES)
	xelatex $(MAIN).tex
	biber   $(MAIN)
	xelatex $(MAIN).tex
	xelatex $(MAIN).tex
	open    $(MAIN).pdf

# linear/linear_cookie_sharing.pdf
linear/linear_cookie_sharing.pdf: linear/linear_cookie_sharing.tex
	xelatex --output-directory linear linear/linear_cookie_sharing.tex

FILES  = "*.{aux,bbl,bcf,blg,log,pdf,run.xml,out}"
clean:
	eval "rm -rf ${FILES}"
	eval "rm -rf linear/${FILES}"
