# Makefile

.PHONY: all clean

SUBPAGES = statistics/statistics.html \
	recreational_mathematics/recreational_mathematics.html \
	miscellaneous/miscellaneous.html \
	gallery/gallery.html

all: index.html

index.html: index.md index.css Makefile $(SUBPAGES)
	pandoc -f markdown+east_asian_line_breaks -s --mathjax -c $(word 2,$^) $< -o $@

# statistics
statistics/statistics.html: statistics/statistics.md index.css
	pandoc -f markdown+east_asian_line_breaks -s --mathjax -c ../$(word 2,$^) $< -o $@
	### add HOME button.
	vim +' exe "/<header" | exe "norm o<a href='../index.html' class='back_button'><strong>HOME</strong></a>\<Esc>" | x ' $@

# recreational mathematics
recreational_mathematics/recreational_mathematics.html: recreational_mathematics/recreational_mathematics.md index.css
	pandoc -f markdown+east_asian_line_breaks -s --mathjax -c ../$(word 2,$^) $< -o $@
	### add HOME button.
	vim +' exe "/<header" | exe "norm o<a href='../index.html' class='back_button'><strong>HOME</strong></a>\<Esc>" | x ' $@

# miscellaneous
miscellaneous/miscellaneous.html: miscellaneous/miscellaneous.md index.css
	pandoc -f markdown+east_asian_line_breaks -s --mathjax -c ../$(word 2,$^) $< -o $@
	### add HOME button.
	vim +' exe "/<header" | exe "norm o<a href='../index.html' class='back_button'><strong>HOME</strong></a>\<Esc>" | x ' $@

# gallery
gallery/gallery.html: gallery/gallery.md index.css
	pandoc -f markdown+east_asian_line_breaks -s --toc --mathjax -c ../$(word 2,$^) $< -o $@
	### add HOME button.
	vim +' exe "/<header" | exe "norm o<a href='../index.html' class='back_button'><strong>HOME</strong></a>\<Esc>" | x ' $@

FILES  = "*.html"
clean:
	eval "rm -rf ${FILES}"
	eval "rm -rf **/${FILES}"
