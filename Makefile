# Makefile

.PHONY: all

all: index.html

index.html: index.md Makefile notion.css \
	statistics/statistics.html \
	recreational_mathematics/recreational_mathematics.html \
	miscellaneous/miscellaneous.html
	pandoc -f markdown+east_asian_line_breaks -s --mathjax -c ./notion.css index.md -o index.html

statistics/statistics.html: statistics/statistics.md
	pandoc -f markdown+east_asian_line_breaks -s --mathjax -c ../notion.css statistics/statistics.md -o statistics/statistics.html

recreational_mathematics/recreational_mathematics.html: recreational_mathematics/recreational_mathematics.md
	pandoc -f markdown+east_asian_line_breaks -s --mathjax -c ../notion.css recreational_mathematics/recreational_mathematics.md -o recreational_mathematics/recreational_mathematics.html

miscellaneous/miscellaneous.html: miscellaneous/miscellaneous.md
	pandoc -f markdown+east_asian_line_breaks -s --mathjax -c ../notion.css miscellaneous/miscellaneous.md -o miscellaneous/miscellaneous.html
