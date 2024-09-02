# Makefile: Redirecting HTML

REDIRECTION_PATH := https://drive.google.com/drive/folders/1BEI-TwPjtBVWPuV6qwJnp2rc32FvNejS?usp=drive_link
GENERATOR := generate-redirection.sh
OUTPUT := index.html
CSS := style.css

.PHONY: all clean

all:
	./$(GENERATOR) "$(REDIRECTION_PATH)"

clean:
	rm -rf $(OUTPUT)
