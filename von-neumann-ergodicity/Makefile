# LaTeX Makefile

MAIN := main
NAME := von-neumann-ergodicity
TEX_FILES := *.sty
FIGURES := $(shell find figures -type f -name '*.tex' | sed -E 's/\.tex$$/.pdf/')

.PHONY: all clean

all: $(NAME).pdf

clean:
	latexmk -C
	cd figures ; latexmk -C ; cd ..
	rm -rf $(NAME).pdf

$(NAME).pdf: $(MAIN).pdf
	cp $(MAIN).pdf $(NAME).pdf

$(MAIN).pdf: $(MAIN).tex $(TEX_FILES) $(FIGURES)
	latexmk -xelatex -synctex=1 $(MAIN).tex

figures/%.pdf: figures/%.tex
	latexmk -outdir=$(<D) -xelatex $<
