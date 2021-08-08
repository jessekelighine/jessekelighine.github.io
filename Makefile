# Makefile

.PHONY: all clean

SUBPAGES = \
	statistics.html \
	recreational_mathematics.html \
	miscellaneous.html \
	gallery.html

all: index.html

# index
index.html: index.md style.css $(SUBPAGES) Makefile 
	pandoc -f markdown+east_asian_line_breaks -s --mathjax -c $(word 2,$^) $< -o $@

# statistics
statistics.html: statistics.md style.css
	pandoc -f markdown+east_asian_line_breaks -s --mathjax -c $(word 2,$^) $< -o $@

# recreational mathematics
recreational_mathematics.html: recreational_mathematics.md style.css
	pandoc -f markdown+east_asian_line_breaks -s --mathjax -c $(word 2,$^) $< -o $@

# miscellaneous
miscellaneous.html: miscellaneous.md style.css
	pandoc -f markdown+east_asian_line_breaks -s --mathjax -c $(word 2,$^) $< -o $@
	### add HOME button.

# gallery
gallery.html: gallery.md style.css
	pandoc -f markdown+east_asian_line_breaks -s --toc --mathjax -c $(word 2,$^) $< -o $@

FILES  = "*.html"
clean:
	eval "rm -rf ${FILES}"
