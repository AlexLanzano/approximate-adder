SOURCES = $(wildcard *.v)

all: approximate_adder

approximate_adder:
	iverilog $(SOURCES) -o $@

.PHONY: test
test: approximate_adder
	vvp approximate_adder

clean:
	rm -f approximate_adder
