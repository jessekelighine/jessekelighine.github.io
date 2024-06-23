# LaTeX Makefile

FIGURES := $(shell find . -type f -maxdepth 1 -name "figure-*.tex" | sed 's/tex$$/pdf/')

.PHONY: all clean

all: $(FIGURES)

clean:
	latexmk -C

%.pdf: %.tex settings-*
	latexmk -xelatex -synctex=1 $*.tex
