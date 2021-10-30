.PHONY: all

all: main clean

main: Types.hs Scan.hs Parser.hs main.hs ../bin
	ghc --make Types.hs Scan.hs Parser.hs main.hs -o ../bin/main

clean: 
	rm -rf *.o *.hi
