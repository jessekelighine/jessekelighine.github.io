# Latex Makefile

MAIN  = divide
RULE  = rule.tex
RULES = talmud \
		equal_losses \
		equal_reward \
		generic \
		proportional

.PHONY: all clean $(RULES)

all: $(RULES)

clean:
	latexmk -C $(MAIN).tex
	rm -rf $(MAIN)-*.pdf
	rm -rf $(MAIN).pdf
	rm -rf *.log
	rm -rf $(RULE)

talmud:        $(MAIN)-talmud.pdf
equal_losses:  $(MAIN)-equal_losses.pdf
equal_reward:  $(MAIN)-equal_reward.pdf
generic:       $(MAIN)-generic.pdf
proportional:  $(MAIN)-proportional.pdf

$(MAIN)-%.pdf: $(MAIN).tex rule-%.tex
	rm -rf $(RULE); ln -s rule-$*.tex $(RULE)
	latexmk -xelatex $<
	mv $(MAIN).pdf $@
	pdf2svg $@ $@.svg
