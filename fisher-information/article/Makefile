# LaTeX Makefile

MAIN := main
NAME := fisher-information
TEX_FILES := settings.sty

.PHONY: all clean

all: $(NAME).pdf

clean:
	latexmk -C
	rm -rf $(NAME).pdf

$(NAME).pdf: $(MAIN).pdf
	cp $(MAIN).pdf $(NAME).pdf

$(MAIN).pdf: $(MAIN).tex $(TEX_FILES)
	latexmk -xelatex -synctex=1 $(MAIN).tex
