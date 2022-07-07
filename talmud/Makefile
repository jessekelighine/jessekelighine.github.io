# Latex Makefile

MAIN  = fair_division
FILES = settings.sty \
		cartoon.eps cartoon-01.eps \
		graph-equal_loss.tex \
		graph-equal_reward.tex \
		graph-generic.tex \
		graph-proportional.tex \
		graph-talmud.tex \
		table-proportional.tex \
		table-talmud1-1.tex \
		table-talmud1.tex \
		table-talmud2.tex \
		divide/divide-generic.pdf \
		divide/divide-proportional.pdf \
		divide/divide-equal_losses.pdf \
		divide/divide-equal_reward.pdf \
		divide/divide-talmud.pdf

.PHONY: all clean

all: $(MAIN).pdf

clean:
	latexmk -C
	cd divide; make clean; cd ..

$(MAIN).pdf: $(MAIN).tex $(FILES)
	latexmk -xelatex $(MAIN).tex

divide/divide-%.pdf: divide/divide.tex divide/rule-%.tex
	cd divide; make $*; cd ..
