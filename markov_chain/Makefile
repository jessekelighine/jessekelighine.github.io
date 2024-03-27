# Makefile

.PHONY: all clean

all: index.html

index.html: index.md style.css Makefile 
	pandoc -f markdown+east_asian_line_breaks -s --mathjax -c $(word 2,$^) $< -o $@

FILES  = "*.html"
clean:
	eval "rm -rf ${FILES}"
