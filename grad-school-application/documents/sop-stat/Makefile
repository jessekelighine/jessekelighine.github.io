# Latex Makefile

MAIN := main
NAME := sop-stat
SCHOOLS := ucl nottingham eth lse

.PHONY: all clean $(SCHOOLS)

all:
	# please specify a school: $(SCHOOLS)

clean:
	rm -f aux-school
	latexmk -C
	rm -f $(NAME)-*.pdf

$(SCHOOLS):
	rm -f aux-school
	ln -s school-files/$@ aux-school
	latexmk -xelatex $(MAIN).tex
	cp $(MAIN).pdf $(NAME)-$@.pdf
