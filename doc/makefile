DEST_DIR=pdf
SRC_DIR=src 

all:
	export TEXINPUTS=.:/usr/local/texlive/2019/texmf-dist/tex//:
	pdflatex --shell-escape --output-dir=./pdf src/main.tex 
	pdflatex --shell-escape --output-dir=./pdf src/main.tex 

clean:
	-rm ./pdf/*.aux	
	-rm ./pdf/*.toc
	-rm ./pdf/*.log
	-rm ./pdf/*.out
	-rm ./pdf/*.lof
