
main.pdf:
	xelatex main.tex

main.odt:
	mk4ht xelatex main.tex

main.docx:
	pandoc -t docx main.tex -o main.docx \
		--reference-links=true \
		--biblatex \
		--bibliography=Karakin7semCoursework.bib
