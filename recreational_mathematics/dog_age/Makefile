# Makefile

.PHONY: all clean

MAIN    = dog_age
FIGURES = $(MAIN).svg

all: $(MAIN).html

$(MAIN).html: $(MAIN).md ../../index.css Makefile $(FIGURES)
	pandoc -f markdown+east_asian_line_breaks -s --mathjax -c $(word 2,$^) $< -o $@
	open $(MAIN).html

$(MAIN).svg: $(MAIN).pdf
	pdftocairo -svg $<
	vim +'exe "norm j" | s/\(width\|height\)="[a-zA-Z0-9.]\+"\s//g | x' dog_age.svg
$(MAIN).pdf: $(MAIN).tex
	xelatex $<

FILES  = "*.{aux,bbl,bcf,blg,log,run.xml,out,snm,nav,toc,pdf,html,png,svg}"
clean:
	eval "rm -rf ${FILES}"
