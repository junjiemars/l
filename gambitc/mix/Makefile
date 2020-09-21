# mix: c and scheme
#
# make clean test
# GAMBCOMP_VERBOSE=yes make clean test
# VERBOSE=1 make clean test
#

mix_bin := mix.out
ifeq ($(OS), Windows_NT)
	mix_bin := mix.exe
endif

gsc := gsc-script
gsc_opt :=
ifeq ($(shell test -n "$(VERBOSE)" && test $(VERBOSE) -gt 0; echo $$?),0)
	gsc_opt := -verbose
endif


m2.c: m2.scm
	$(gsc) $(gsc_opt) -c $<

m3.c: m3.scm
	$(gsc) $(gsc_opt) -c $<

m3_.c: m2.c m3.c
	$(gsc) $(gsc_opt) -link $^

mix_obj := m1.o m2.o m3.o m3_.o
$(mix_obj): m1.c m2.c m3.c m3_.c
	$(gsc) $(gsc_opt) -obj $^

$(mix_bin): $(mix_obj)
	$(gsc) $(gsc_opt) -o $@ -exe $^

clean:
	$(RM) $(mix_bin)
	$(RM) m2.c m3.c m3_.c
	$(RM) *.o

test: $(mix_bin)
	$(CURDIR)/$(mix_bin)

default: $(mix_bin)

.PHONY: default clean test
