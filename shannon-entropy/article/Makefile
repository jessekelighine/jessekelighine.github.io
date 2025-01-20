# LaTeX Makefile

MAIN := main
NAME := shannon-entropy
TEX_FILES := settings.sty \
	     figures/*
	     # figures/prefix-tree.pdf \

.PHONY: all clean

all: $(NAME).pdf

clean:
	latexmk -C
	rm -rf *-SAVE-ERROR
	rm -rf $(NAME).pdf

$(NAME).pdf: $(MAIN).pdf
	cp $(MAIN).pdf $(NAME).pdf

$(MAIN).pdf: $(MAIN).tex $(TEX_FILES)
	# grep -o '.' $(MAIN).tex | rg '[^\x00-\x7F]' | wc -l | xargs echo "Chinese Word Count:"
	latexmk -shell-escape -xelatex -synctex=1 $(MAIN).tex
