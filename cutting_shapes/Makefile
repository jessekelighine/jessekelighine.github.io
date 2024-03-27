# Latex Makefile

MAIN    = main
NAME    = cutting_shapes
FILES   = settings.sty
FIGURES = $(shell find figures | grep "^figures/figure-.*\\.tex$$" | sed "s/tex$$/pdf/g")

.PHONY: all clean compact

all: $(MAIN).pdf index.html

clean:
	latexmk -C
	cd figures ; latexmk -C ; cd ..

compact:
	latexmk -c
	cd figures ; latexmk -c ; cd ..

index.html: index.md style.css
	pandoc -f markdown+east_asian_line_breaks -s --mathjax -c $(word 2,$^) $< -o $@

$(MAIN).pdf: $(MAIN).tex $(FILES) $(FIGURES)
	latexmk -xelatex $(MAIN).tex
	cp $(MAIN).pdf $(NAME).pdf

figures/figure-%.pdf: figures/figure-%.tex figures/colors.tex figures/tikzsettings.tex
	latexmk -outdir=figures -xelatex $<
