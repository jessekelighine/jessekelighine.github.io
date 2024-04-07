# Makefile

MAIN := index
STYLE := style.css

.PHONY: all clean

all: $(MAIN).html

$(MAIN).html: $(MAIN).md $(STYLE)
	pandoc \
		$(MAIN).md \
		--toc --number-sections \
		--standalone --mathjax \
		--css $(STYLE) \
		--output $@

FILES  = "*.html"
clean:
	eval "rm -rf ${FILES}"
