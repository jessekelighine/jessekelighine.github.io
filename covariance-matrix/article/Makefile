# Latex Makefile

MAIN := main
NAME := covariance-matrix
FIGURES := $(shell find figures -name '*.tex' | sed 's/tex$$/pdf/')

.PHONY: all clean

all: $(NAME).pdf

clean:
	latexmk -C
	cd figures && latexmk -C
	rm -rf $(NAME).pdf

$(NAME).pdf: $(MAIN).pdf
	cp $(MAIN).pdf $(NAME).pdf

$(MAIN).pdf: $(MAIN).tex settings.sty $(FIGURES)
	latexmk -xelatex -synctex=1 $(MAIN).tex

figures/%.pdf: figures/%.tex
	latexmk -xelatex -outdir=$(<D) $<
