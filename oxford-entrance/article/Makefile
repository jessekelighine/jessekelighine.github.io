# LaTeX Makefile

MAIN := main
NAME := oxford-entrance
FIGURES := $(shell find figures -type f -name '*.tex' | sed 's/\.tex$$/.pdf/')
WEB_FIGURES := $(shell find figures-web -type f -name '*.tex' | sed 's/\.tex$$/.svg/')

.PHONY: all clean

all: $(NAME).pdf $(WEB_FIGURES)

clean:
	latexmk -C
	rm -rf $(NAME).pdf
	rm -rf $(WEB_FIGURES)
	cd figures ; latexmk -C ; cd ..
	cd figures-web ; latexmk -C ; cd ..

$(NAME).pdf: $(MAIN).pdf
	cp $(MAIN).pdf $(NAME).pdf

$(MAIN).pdf: $(MAIN).tex settings.sty $(FIGURES)
	latexmk -xelatex -synctex=1 $(MAIN).tex

figures/%.pdf: figures/%.tex figures/tile.sty
	latexmk -xelatex -outdir=$(<D) $<

figures-web/%.svg: figures-web/%.pdf
	pdf2svg $< $@

figures-web/%.pdf: figures-web/%.tex figures-web/tile.sty
	latexmk -xelatex -outdir=$(<D) $<
