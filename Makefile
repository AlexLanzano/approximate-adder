APPROXIMATE_ADDER_SOURCES = $(wildcard approximate*.v)
ACCURATE_ADDER_SOURCES = $(wildcard accurate*.v)

all: approximate_adder accurate_adder
test: test_approximate_adder test_accurate_adder

approximate_adder: $(APPROXIMATE_ADDER_SOURCES)
	iverilog $(APPROXIMATE_ADDER_SOURCES) -o $@

accurate_adder: $(ACCURATE_ADDER_SOURCES)
	iverilog $(ACCURATE_ADDER_SOURCES) -o $@


.PHONY: test_accurate_adder
test_accurate_adder: accurate_adder
	@echo "Testing accurate adder"
	@vvp accurate_adder

.PHONY: test_approximate_adder
test_approximate_adder: approximate_adder
	@echo "Testing approximate adder"
	@vvp approximate_adder


clean:
	rm -f approximate_adder accurate_adder
