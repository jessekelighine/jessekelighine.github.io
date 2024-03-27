# Makefile

.PHONY: all clean compact

MAIN    = oxford_entrance
FIGURES = figures/case_demo.pdf \
		  figures/case_two.pdf \
		  figures/case_three.pdf \
		  figures/case_four.pdf \
		  figures/case_six.pdf \
		  figures/case_seven.pdf \
		  figures/case_ten.pdf \
		  figures/family1.pdf \
		  figures/family2.pdf \
		  figures/family3.pdf \
		  figures/family4.pdf
WEBFILES = figures/web_two.svg \
		   figures/web_demo.svg

all: $(MAIN).pdf

index.html: index.md style.css $(MAIN).pdf $(WEBFILES) 
	pandoc -f markdown+east_asian_line_breaks -s --mathjax -c $(word 2,$^) $< -o $@

$(MAIN).pdf: $(MAIN).tex settings.tex Makefile $(FIGURES) figures/tile.tex
	xelatex $(MAIN).tex
	xelatex $(MAIN).tex

# svg for web
figures/web_%.pdf: figures/web_%.tex figures/tile.tex
	xelatex --output-directory figures $<
figures/web_%.svg: figures/web_%.pdf
	pdftocairo -svg $< $@
	vim +'exe "norm j" | s/\(width\|height\)="[a-zA-Z0-9.]\+"\s//g | x' $@

# figures/family%.pdf
figures/family%.pdf: figures/family%.tex
	xelatex --output-directory figures $<

# figures/case_%.pdf
figures/case_%.pdf: figures/case_%.tex figures/tile.tex
	xelatex --output-directory figures $<

FILES  = "*.{aux,bbl,bcf,blg,log,run.xml,out,snm,nav,toc,pdf,html,png,svg}"
clean:
	eval "rm -rf ${FILES}"
	eval "rm -rf figures/${FILES}"

NONEED  = "*.{aux,bbl,bcf,blg,log,run.xml,out,snm,nav,toc}"
NONEED2 = "*.{aux,bbl,bcf,blg,log,run.xml,out,snm,nav,toc,pdf}"
compact:
	eval "rm -rf ${NONEED}"
	eval "rm -rf figures/${NONEED2}"
