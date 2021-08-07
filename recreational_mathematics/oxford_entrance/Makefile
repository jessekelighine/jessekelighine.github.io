# Latex Makefile

.PHONY: all clean

MAIN    = oxford_entrance
FIGURES = figures/demo.pdf \
		  figures/two.pdf \
		  figures/six.pdf \
		  figures/ten.pdf \
		  figures/square.pdf \
		  figures/family1.pdf \
		  figures/family2.pdf \
		  figures/family3.pdf \
		  figures/family4.pdf \
		  figures/case_three.pdf \
		  figures/case_four.pdf \
		  figures/case_seven.pdf

all: $(MAIN).html

$(MAIN).html: $(MAIN).md $(MAIN).pdf ../../index.css
	pandoc -f markdown+east_asian_line_breaks -s --mathjax -c ../../index.css oxford_entrance.md -o oxford_entrance.html
	# open $(MAIN).html

$(MAIN).pdf: $(MAIN).tex settings.tex Makefile $(FIGURES) figures/tile.tex
	xelatex $(MAIN).tex
	xelatex $(MAIN).tex
	# open $(MAIN).pdf

# figures/two.pdf
figures/two.pdf: figures/two.tex figures/tile.tex
	xelatex --output-directory figures figures/two.tex
	convert -density 1200 figures/two.pdf figures/two.png

# figures/six.pdf
figures/six.pdf: figures/six.tex figures/tile.tex
	xelatex --output-directory figures figures/six.tex

# figures/ten.pdf
figures/ten.pdf: figures/ten.tex figures/tile.tex
	xelatex --output-directory figures figures/ten.tex

# figures/demo.pdf
figures/demo.pdf: figures/demo.tex figures/tile.tex
	xelatex --output-directory figures figures/demo.tex

# figures/square.pdf
figures/square.pdf: figures/square.tex figures/tile.tex
	xelatex --output-directory figures figures/square.tex

# figures/family1.pdf
figures/family1.pdf: figures/family1.tex
	xelatex --output-directory figures figures/family1.tex

# figures/family2.pdf
figures/family2.pdf: figures/family2.tex
	xelatex --output-directory figures figures/family2.tex

# figures/family3.pdf
figures/family3.pdf: figures/family3.tex
	xelatex --output-directory figures figures/family3.tex

# figures/family4.pdf
figures/family4.pdf: figures/family4.tex
	xelatex --output-directory figures figures/family4.tex

# figures/case_three.pdf
figures/case_three.pdf: figures/case_three.tex
	xelatex --output-directory figures figures/case_three.tex

# figures/case_four.pdf
figures/case_four.pdf: figures/case_four.tex
	xelatex --output-directory figures figures/case_four.tex

# figures/case_seven.pdf
figures/case_seven.pdf: figures/case_seven.tex
	xelatex --output-directory figures figures/case_seven.tex

FILES  = "*.{aux,bbl,bcf,blg,log,run.xml,out,snm,nav,toc,pdf,html,png}"
clean:
	eval "rm -rf ${FILES}"
	eval "rm -rf figures/${FILES}"
