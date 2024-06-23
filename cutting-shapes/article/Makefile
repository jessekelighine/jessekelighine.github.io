# LaTeX Makefile

MAIN := main
NAME := cutting-shapes
FIGURES := $(shell find figures -type f -maxdepth 1 -name '*.tex' | sed "s/tex$$/pdf/g")

.PHONY: all clean

all: $(NAME).pdf

clean:
	latexmk -C
	rm -rf $(NAME).pdf
	cd figures ; latexmk -C ; cd ..

$(NAME).pdf: $(MAIN).pdf
	cp $(MAIN).pdf $(NAME).pdf

$(MAIN).pdf: $(MAIN).tex settings*.sty $(FIGURES)
	latexmk -xelatex -synctex=1 $<

figures/%.pdf: figures/%.tex figures/settings*.sty
	latexmk -xelatex -outdir=$(<D) $<
