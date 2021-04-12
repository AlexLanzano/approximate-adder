APPROXIMATE_ADDER_SOURCES = $(wildcard approximate*.v)
ACCURATE_ADDER_SOURCES = $(wildcard accurate*.v)

all: approximate_adder accurate_adder

approximate_adder:
	iverilog $(APPROXIMATE_ADDER_SOURCES) -o $@

accurate_adder:
	iverilog $(ACCURATE_ADDER_SOURCES) -o $@

.PHONY: test
test: approximate_adder accurate_adder
	@echo "Testing approximate adder"
	vvp approximate_adder
	@echo "Testing accurate adder"
	vvp accurate_adder

clean:
	rm -f approximate_adder accurate_adder
