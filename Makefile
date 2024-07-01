# Makefile

STYLE := style.css

.PHONY: all clean

all: index.html

clean:
	rm -rf index.html

index.html: index.md $(STYLE)
	pandoc $< \
		--from markdown+east_asian_line_breaks \
		--toc \
		--standalone --mathjax \
		--css $(STYLE) \
		--output $@
