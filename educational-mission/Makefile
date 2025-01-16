# Makefile

CSS := style.css
CSS_IMPORT := style-imports.css
CSS_IMG := style-img.css
CSS_ALL := \
	   $(shell realpath $(CSS)) \
	   $(shell realpath $(CSS_IMPORT)) \
	   $(shell realpath $(CSS_IMG))

.PHONY: all clean

all: index.html

clean:
	rm -rf index.html

index.html: index.md $(CSS_ALL)
	pandoc $< \
		--from markdown+east_asian_line_breaks \
		--toc --toc-depth=2 \
		--standalone --mathjax \
		--css $(CSS_IMPORT) \
		--css $(CSS_IMG) \
		--css $(CSS) \
		--output $@
	# Update RSS feed: new <item>, <pubDate>, and <lastBuildDate>
