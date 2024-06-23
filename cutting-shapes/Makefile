# LaTeX Makefile

CSS := style.css
CSS_REALPATH := $(shell realpath $(CSS))

.PHONY: all clean

all: index.html

clean:
	rm -rf index.html

index.html: index.md $(CSS_REALPATH) figures/figure-example.svg
	pandoc $< \
		--from markdown+east_asian_line_breaks \
		--toc --number-sections \
		--standalone --mathjax \
		--css $(CSS) \
		--output $@

figures/figure-example.svg: figures/figure-example.pdf
	pdf2svg figures/figure-example.pdf figures/figure-example.svg
