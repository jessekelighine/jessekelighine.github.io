# Makefile

.PHONY: all

all: index.html

index.html: index.md Makefile index.css \
	resources/pinkeln.png \
	statistics/statistics.html \
	recreational_mathematics/recreational_mathematics.html \
	miscellaneous/miscellaneous.html \
	gallery/gallery.html
	pandoc -f markdown+east_asian_line_breaks -s --mathjax -c ./index.css index.md -o index.html

statistics/statistics.html: statistics/statistics.md ./index.css
	pandoc -f markdown+east_asian_line_breaks -s --mathjax -c ../index.css statistics/statistics.md -o statistics/statistics.html

recreational_mathematics/recreational_mathematics.html: recreational_mathematics/recreational_mathematics.md ./index.css
	pandoc -f markdown+east_asian_line_breaks -s --mathjax -c ../index.css recreational_mathematics/recreational_mathematics.md -o recreational_mathematics/recreational_mathematics.html

miscellaneous/miscellaneous.html: miscellaneous/miscellaneous.md ./index.css
	pandoc -f markdown+east_asian_line_breaks -s --mathjax -c ../index.css miscellaneous/miscellaneous.md -o miscellaneous/miscellaneous.html

gallery/gallery.html: gallery/gallery.md ./index.css
	pandoc -f markdown+east_asian_line_breaks -s --mathjax -c ../index.css gallery/gallery.md -o gallery/gallery.html
