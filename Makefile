.PHONY: all

all: main clean

main: main.hs
	ghc --make main.hs -o main

clean:
	rm -rf *.o *.hi
