.PHONY: all

all: main clean

main: src/Types.hs src/Scan.hs src/Parser.hs src/main.hs bin
	ghc --make src/Types.hs src/Scan.hs src/Parser.hs src/main.hs -o bin/main

clean: src
	rm -rf src/*.o src/*.hi
