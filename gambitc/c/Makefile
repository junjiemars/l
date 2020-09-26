# mix: c and scheme
#
# make clean test
# GAMBCOMP_VERBOSE=yes make clean test
# VERBOSE=1 make clean test
#

basic_bin_out := basic
basic_lib_out := libbasic.so
basic_lib_c_out := basicc
basic_lib_opt := -shared -fPIC

LDFLAGS += -L$(CURDIR)
LDLIBS = -lbasic -lm -ldl -lutil -lssl -lpthread -lcrypto
LD_LIBRARY_PATH := LD_LIBRARY_PATH=$(CURDIR)

ifeq ($(shell uname), Darwin)
	basic_lib_out := libbasic.dylib
	basic_lib_opt := -dynamiclib
	LDLIBS = -lbasic
else ifeq ($(OS), Windows_NT)
	basic_bin_out := basic.exe
	basic_lib_out := libbasic.lib
endif

gsc := gsc-script
gsc_opt := -keep-temp
ifeq ($(shell test -n "$(VERBOSE)" && test $(VERBOSE) -gt 0; echo $$?),0)
	gsc_opt := -verbose
endif
libgambit.a := $(shell gsc-script -e '(display (path-expand "~~lib"))')libgambit.a


basic_bin: $(basic_bin_out)
$(basic_bin_out): b1.scm b2.scm
	$(gsc) $(gsc_opt) -o $@ -exe $^

test: basic_test
basic_test: basic_bin
	$(CURDIR)/$(basic_bin_out)

clean:
	$(RM) $(basic_bin_out) $(basic_lib_out) $(basic_lib_c_out)
	$(RM) b1.c *_.c
	$(RM) *.o *.o1 *.o2 *.o3
	$(RM) *.dg


default: basic_bin

.PHONY: default clean test
