# Makefile

CSS := style.css
CSS_IMPORT := style-imports.css
CSS_IMG := style-img.css

.PHONY: all clean

all: index.html

clean:
	rm -rf index.html

index.html: index.md $(shell realpath $(CSS)) $(shell realpath $(CSS_IMPORT)) $(shell realpath $(CSS_IMG))
	pandoc $< \
		--from markdown+east_asian_line_breaks \
		--toc --toc-depth=2 \
		--standalone --mathjax \
		--css $(CSS_IMPORT) \
		--css $(CSS_IMG) \
		--css $(CSS) \
		--output $@
