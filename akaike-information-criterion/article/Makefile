# Latex Makefile

MAIN := main
NAME := aic

.PHONY: all clean

all: $(NAME).pdf

clean:
	latexmk -C
	rm -rf $(NAME).pdf

$(NAME).pdf: $(MAIN).pdf
	cp $(MAIN).pdf $(NAME).pdf

$(MAIN).pdf: $(MAIN).tex settings.sty
	# grep -o '.' $(MAIN).tex | rg '[^\x00-\x7F]' | wc -l | xargs echo "Chinese Word Count:"
	latexmk -xelatex -synctex=1 $(MAIN).tex
