.PHONY: all clean
all: index.html

clean:
	rm -rf index.html

index.html: index.md
	# pandoc -t revealjs index.md -o index.html -sV revealjs-url=https://revealjs.com
	pandoc index.md \
		-t revealjs -s -o index.html \
		-V revealjs-url=https://unpkg.com/reveal.js/ \
		-V theme=serif
		# --include-in-header=slides.css \
