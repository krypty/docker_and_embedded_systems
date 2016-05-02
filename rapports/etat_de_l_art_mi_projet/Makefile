# Makefile to create PDF documents from LaTeX-Files
# Needed software packages: pdflatex, rubber
# License: No copyright, just do what the heck you want with it

all: pdf clean

pdf:
			for file in $$(ls *tex | cut -d \. -f 1) ; do make $$file.pdf ; done

%.pdf: %.tex
#			rubber --unsafe -c 'setlist arguments -no-shell-escape -interaction=nonstopmode -file-line-error' -m pdftex $<
			pdflatex -shell-escape -interaction=nonstopmode -file-line-error $<
			pdflatex -shell-escape -interaction=nonstopmode -file-line-error $< # run twice for labels etc

clean:
			rm -f *.toc *.aux *.log *.out

cleanall:
			rm -f *.toc *.pdf *.aux *.log *.out

.PHONY: all pdf clean cleanall
.SILENT: pdf

# vim: set tabstop=4 shiftwidth=4 noexpandtab:
