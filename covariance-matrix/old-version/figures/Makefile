# Latex Makefile

OUTPUT_SVG := visual-1.svg visual-2.svg
OUTPUT_PDF := visual-1.pdf visual-2.pdf
OUTPUT := $(OUTPUT_PDF) $(OUTPUT_SVG)

.PHONY: all clean

all: $(OUTPUT)

clean:
	latexmk -C
	rm -rf $(OUTPUT)

%.svg: %.pdf
	pdf2svg $*.pdf $*.svg

%.pdf: %.tex
	latexmk -xelatex -synctex=1 $*.tex
