.PHONY: all

all: main clean

main: main.hs Scan.hs Parser.hs
	ghc --make main.hs -o main

clean:
	rm -rf *.o *.hi
