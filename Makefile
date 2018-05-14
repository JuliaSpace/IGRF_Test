FC = gfortran

SRCS = igrf12.f igrf_test.f90

PROGRAM = igrf_test

all: $(PROGRAM)

$(PROGRAM): $(SRCS)
	$(FC) $(FCFLAGS) -o $@ $^

clean:
	rm -f *.o $(PROGRAM)
