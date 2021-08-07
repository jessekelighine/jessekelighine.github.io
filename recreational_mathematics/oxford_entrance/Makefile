# Makefile

.PHONY: all clean

MAIN    = oxford_entrance
FIGURES = figures/case_demo.pdf \
		  figures/case_two.pdf \
		  figures/case_six.pdf \
		  figures/case_ten.pdf \
		  figures/case_three.pdf \
		  figures/case_four.pdf \
		  figures/case_seven.pdf \
		  figures/family1.pdf \
		  figures/family2.pdf \
		  figures/family3.pdf \
		  figures/family4.pdf
WEBFILES = figures/web_two.svg \
		   figures/web_demo.svg

all: $(MAIN).html

$(MAIN).html: $(MAIN).md $(MAIN).pdf $(WEBFILES) ../../index.css
	pandoc -f markdown+east_asian_line_breaks -s --mathjax -c ../../index.css oxford_entrance.md -o oxford_entrance.html
	# open $(MAIN).html

$(MAIN).pdf: $(MAIN).tex settings.tex Makefile $(FIGURES) figures/tile.tex
	xelatex $(MAIN).tex
	xelatex $(MAIN).tex
	# open $(MAIN).pdf

# svg for web
figures/web_%.pdf: figures/web_%.tex
	xelatex --output-directory figures $<
figures/web_%.svg: figures/web_%.pdf
	pdf2svg $< $@

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
