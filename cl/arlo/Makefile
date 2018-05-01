# Makefile for sbcl-make.lisp

arlo_bin := arlo
ifeq ($(OS), Windows_NT)
arlo_bin := arlo.exe
endif


arlo_dep := arlo.asd \
	          arlo.lisp

$(arlo_bin): sbcl-make.lisp $(arlo_dep)
	ARLO_BIN=$(arlo_bin) sbcl --load $<

clean:
	@test ! -f $(arlo_bin) || rm $(arlo_bin)
	@test ! -f arlo.fasb || rm arlo.fasb

test: $(arlo_bin)
	$(CURDIR)/$(arlo_bin) --non-interactive --eval '(arlo:hello-world)'

default: $(arlo_bin)

.PHONY: default clean test
