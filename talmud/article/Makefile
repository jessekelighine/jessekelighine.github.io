# LaTeX Makefile

MAIN := main
NAME := fair-division

.PHONY: all clean

all: $(NAME).pdf

clean:
	latexmk -C
	rm -rf $(NAME).pdf

$(NAME).pdf: $(MAIN).pdf
	cp $(MAIN).pdf $(NAME).pdf

$(MAIN).pdf: $(MAIN).tex *.tex settings.sty
	latexmk -xelatex -synctex=1 $(MAIN).tex
