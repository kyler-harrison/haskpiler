.PHONY: all

all: main clean

main: main.hs
	ghc main.hs -o main

clean:
	rm -rf *.o *.hi
