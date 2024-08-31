# LaTeX Makefile

MAIN := main
NAME := arrows-impossibility-theorem
TEX_FILES := settings.sty references.bib

.PHONY: all clean

all: $(NAME).pdf

clean:
	latexmk -C
	rm -rf *-SAVE-ERROR
	rm -rf $(NAME).pdf

$(NAME).pdf: $(MAIN).pdf
	cp $(MAIN).pdf $(NAME).pdf

$(MAIN).pdf: $(MAIN).tex $(TEX_FILES)
	latexmk -xelatex -synctex=1 $(MAIN).tex
