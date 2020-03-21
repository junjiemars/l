# mix: c and scheme

mix_bin := mix
ifeq ($(OS), Windows_NT)
	mix_bin := mix.exe
endif

gsc := gambitc

m2.c: m2.scm
	$(gsc) -verbose -c $<

m3.c: m3.scm
	$(gsc) -verbose -c $<

m3_.c: m2.c m3.c
	$(gsc) -verbose -link $^

mix_obj := m1.o m2.o m3.o m3_.o
$(mix_obj): m1.c m2.c m3.c m3_.c
	$(gsc) -verbose -obj $^

$(mix_bin): $(mix_obj)
	$(gsc) -verbose -exe -o $@ $^

clean:
	$(RM) $(mix_bin)
	$(RM) m2.c m3.c m3_.c
	$(RM) *.o

test: $(mix_bin)
	$(CURDIR)/$(mix_bin)

default: $(mix_bin)

.PHONY: default clean test
