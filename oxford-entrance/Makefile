# Makefile

.PHONY: all clean

MAIN := main
NAME := oxford-entrance
FIGURES := $(shell find figures -type f -name '*.tex' | sed 's/\.tex$$/.pdf/')
WEB_FIGURES := $(shell find figures-web -type f -name '*.tex' | sed 's/\.tex$$/.svg/')

all: $(NAME).pdf index.html

clean:
	latexmk -C
	cd figures ; latexmk -C ; cd ..
	cd figures-web ; latexmk -C ; cd ..
	rm -rf $(WEB_FIGURES)
	rm -rf $(NAME).pdf
	rm -rf index.html

### HTML ######################################################################

index.html: index.md style.css $(WEB_FIGURES) 
	pandoc $< \
		--from markdown+east_asian_line_breaks \
		--standalone --mathjax \
		--css $(word 2,$^) \
		--output $@

figures-web/%.svg: figures-web/%.pdf
	pdf2svg $< $@

figures-web/%.pdf: figures-web/%.tex figures-web/tile.sty
	latexmk -xelatex -outdir=$(<D) $<

### PDF #######################################################################

$(NAME).pdf: $(MAIN).pdf
	cp $(MAIN).pdf $(NAME).pdf

$(MAIN).pdf: $(MAIN).tex settings.sty $(FIGURES)
	latexmk -xelatex -synctex=1 $(MAIN).tex

figures/%.pdf: figures/%.tex figures/tile.sty
	latexmk -xelatex -outdir=$(<D) $<
