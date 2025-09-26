# Makefile: Redirecting HTML

GENERATOR := ../share/generate-redirection.sh
OUTPUT := index.html
URL := $(shell cat url)
CSS := style.css

.PHONY: all clean

all: $(OUTPUT)

$(OUTPUT): url
	$(GENERATOR) "$(URL)"
	ln -s ../$(CSS) $(CSS)

clean:
	rm -rf $(OUTPUT)
	rm -f $(CSS)
