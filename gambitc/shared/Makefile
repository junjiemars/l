# mix: c and scheme


ifeq ($(OS), Darwin)
	mix_lib := mix.dylib
	shared_opt := -dynamiclib
	mix_bin := mix
else ifeq ($(OS), Windows_NT)
	mix_lib := mix.lib
	mix_bin := mix.exe
else
	mix_lib := mix.so
	shared_opt := shared
	mix_bin := mix
endif

gsc := gambitc

mixlib.c: m1.c m2.scm
	$(gsc) -verbose -link -o $@ m2

mix_obj := m1.o m2.o mixlib.o
$(mix_obj): m1.c m2.c mixlib.c
	$(gsc) -verbose -obj -cc-options "-D___SHARED" $^

$(mix_lib): $(mix_obj)
	$(CC) $(shared_opt) $^ -o $@

clean:
	$(RM) $(mix_lib)
	$(RM) m2.c mixlib.c m3.c m3_.c
	$(RM) *.o

test: $(mix_bin)
	$(CURDIR)/$(mix_bin)

default: $(mix_lib)

.PHONY: default clean test
