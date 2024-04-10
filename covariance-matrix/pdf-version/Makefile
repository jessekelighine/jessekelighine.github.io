# Latex Makefile

MAIN := main
NAME := covariance-matrix

.PHONY: all clean

all: $(NAME).pdf

clean:
	latexmk -C
	rm -rf $(NAME).pdf

$(NAME).pdf: $(MAIN).pdf
	cp $(MAIN).pdf $(NAME).pdf

$(MAIN).pdf: $(MAIN).tex settings.sty figures/*.pdf
	latexmk -xelatex -synctex=1 $(MAIN).tex
