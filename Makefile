all: mk_dir compile

mk_dir:
	-mkdir obj/

compile:
	pdflatex -output-directory obj/ report
	cp bibliography.bib obj/
	cp apalike-url.bst obj/
	(cd obj && bibtex report.aux)
	pdflatex -output-directory obj/ report
	pdflatex -output-directory obj/ report

rubber: mk_dir
	(cd obj && rubber --pdf ../report.tex)

clean:
	-rm -rfv obj/
