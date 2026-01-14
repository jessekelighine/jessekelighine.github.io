
# Makefile

CSS := style.css
CSS_IMPORT := style-imports.css
CSS_ALL := \
	   $(shell realpath $(CSS)) \
	   $(shell realpath $(CSS_IMPORT))

.PHONY: all
all: index.html

.PHONY: clean
clean:
	rm -rf index.html

index.html: index.md $(CSS_ALL)
	pandoc $< \
		--from markdown+east_asian_line_breaks \
		--toc --toc-depth=1 \
		--standalone --mathjax \
		--css $(CSS_IMPORT) \
		--css $(CSS) \
		--output $@
	# Run `make rss` to generate RSS feed

.PHONY: rss
rss:
	# Run `make` to generate index.html first
	./update-rss.sh "https://jessekelighine.com/confucianism-potpourri"
