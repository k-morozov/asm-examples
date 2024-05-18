stoi:
	as --64 stoi.S -o bin/stoi.o && \
	ld bin/stoi.o -o bin/stoi && \
	./bin/stoi

example:
	as --64 example.S -o bin/example.o && \
	ld bin/example.o -o bin/example && \
	./bin/example