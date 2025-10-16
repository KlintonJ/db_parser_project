TARGET = bin/dbview
SRC = $(wildcard src/*.c)
OBJ = $(patsubst src/%.c, obj/%.o, $(SRC))

run: clean default

default: $(TARGET)
	./bin/dbview -nf employees.db

.PHONY clean:
	rm -f obj/*.o
	rm -f bin/*
	# rm -f *.db

$(TARGET): $(OBJ)
	cc -o $@ $?

obj/%.o: src/%.c
	cc -c $< -o $@ -Iinclude
