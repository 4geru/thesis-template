TARGET = master
LATEX  = platex
DVIPS  = dvips
DVIPDF = dvipdfmx
MAKEINDEX = makeindex

$(TARGET).dvi: $(TARGET).tex
	$(LATEX) -shell-escape $(TARGET).tex
	$(LATEX) -shell-escape $(TARGET).tex

$(TARGET).pdf: $(TARGET).dvi
	$(DVIPDF) -d 5 -f ms.map $(TARGET).dvi

ps: $(TARGET).dvi
	$(DVIPS) $(TARGET).dvi

pdf: $(TARGET).pdf

all: clean pdf
	open master.pdf

clean:
	rm -f *.dvi *.toc *.aux *.log *.lof *.lot *.idx *.ilg *.ind *.PS *.pdf
