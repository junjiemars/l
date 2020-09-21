# mix: c and scheme
#
# make clean test
# GAMBCOMP_VERBOSE=yes make clean test
# VERBOSE=1 make clean test
#

mix_bin_out := mix
mix_lib_out := libmix.so
mix_lib_c_out := mixc
mix_lib_opt := -shared

ifeq ($(shell uname), Darwin)
	mix_lib_out := libmix.dylib
	mix_lib_opt := -dynamiclib
else ifeq ($(OS), Windows_NT)
	mix_bin_out := mix.exe
	mix_lib_out := libmix.lib
endif


gsc := gsc-script
gsc_opt :=
ifeq ($(shell test -n "$(VERBOSE)" && test $(VERBOSE) -gt 0; echo $$?),0)
	gsc_opt := -verbose
endif
libgambit.a := $(shell dirname $(shell dirname $(shell which gsc-script)))/lib/libgambit.a


mix_bin: $(mix_bin_out)
mix_lib: $(mix_lib_out)

test_mix_bin: $(mix_bin_out)
	$(CURDIR)/$(mix_bin_out)
test_mix_lib: $(mix_lib_c_out)
	$(CURDIR)/$(mix_lib_c_out) 2
	$(CURDIR)/$(mix_lib_c_out) 3


m2.c: m2.scm
	$(gsc) $(gsc_opt) -c $<

m3.c: m3.scm
	$(gsc) $(gsc_opt) -c $<

m3_.c: m2.c m3.c
	$(gsc) $(gsc_opt) -link $^

mix_obj := m1.o m2.o m3.o m3_.o
$(mix_obj): m1.c m2.c m3.c m3_.c
	$(gsc) $(gsc_opt) -obj $^

$(mix_bin_out): $(mix_obj)
	$(gsc) $(gsc_opt) -o $@ -exe $^

mix_shared_deps := m1.o m2.o mixlib.o
$(mix_lib_out): $(mix_shared_deps)
	$(CC) -o $@ $(mix_lib_opt) $^ $(libgambit.a)

mixlib.c: m2.scm
	$(gsc) -link -o $@ $^

mixlib.o: m1.c m2.c mixlib.c
	$(gsc) -obj -cc-options "-D___SHARED" $^

$(mix_lib_c_out): test_mix_lib.c $(mix_lib_out)
	$(CC) $(CFLAGS) $(INC) $^ -o $@


clean:
	$(RM) $(mix_bin_out) $(mix_lib_out) $(mix_lib_c_out)
	$(RM) m2.c m3.c m3_.c mixlib.c
	$(RM) *.o
	$(RM) *.dg


default: mix_bin

.PHONY: default clean test
