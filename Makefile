# Makefile

.PHONY: all clean

all: index.html

index.html: index.md style.css
	pandoc \
		--toc \
		--from markdown+east_asian_line_breaks \
		--standalone \
		--mathjax \
		--css style.css $< \
		--output $@

FILES  = "*.html"
clean:
	eval "rm -rf ${FILES}"
