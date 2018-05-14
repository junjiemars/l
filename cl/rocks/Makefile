# Makefile for sbcl-make.lisp

rocks_bin := rocks
ifeq ($(OS), Windows_NT)
rocks_bin := rocks.exe
endif


rocks_dep := rocks.asd \
	           rocks.lisp

$(rocks_bin): sbcl-make.lisp $(rocks_dep)
	sbcl --load $<

clean:
	@test ! -f $(rocks_bin) || rm $(rocks_bin)
	@test ! -f rocks.fasb || rm rocks.fasb

test: $(rocks_bin)
	$(CURDIR)/$(rocks_bin) --non-interactive \
												 --eval '(asdf:load-system :rocks)' \
                         --eval '(rocks/lab:hello-world)'

default: $(rocks_bin)

.PHONY: default clean test
