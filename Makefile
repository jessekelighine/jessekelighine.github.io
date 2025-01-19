# Makefile

CSS := style.css
CSS_IMPORT := style-imports.css

.PHONY: all clean

all: index.html

clean:
	rm -rf index.html

index.html: index.md $(CSS) $(CSS_IMPORT) confucius-said.js
	pandoc $< \
		--from markdown+east_asian_line_breaks \
		--toc \
		--standalone --mathjax \
		--css $(CSS_IMPORT) \
		--css $(CSS) \
		--output $@
