.PHONY: all clean
all: index.html

clean:
	rm -rf index.html

index.html: index.md Makefile style.css
	pandoc index.md \
		--from markdown+east_asian_line_breaks \
		--to revealjs \
		--output index.html \
		--standalone \
		--mathjax \
		--css style.css \
		--css style-imports.css \
		--variable revealjs-url=https://unpkg.com/reveal.js \
		--variable theme=simple \
		--variable transition=none \
		--variable controls=false \
		--variable slideNumber="'c/t'" \
		--variable history=false
