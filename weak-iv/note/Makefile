# LaTeX Makefile

MAIN := main
NAME := weak-iv-note

.PHONY: all clean

all: $(NAME).pdf

clean:
	latexmk -C
	rm -rf *-SAVE-ERROR
	rm -rf $(NAME).pdf

$(NAME).pdf: $(MAIN).pdf
	cp $(MAIN).pdf $(NAME).pdf

$(MAIN).pdf: $(MAIN).tex settings.sty references.bib
	latexmk -xelatex -synctex=1 $(MAIN).tex
