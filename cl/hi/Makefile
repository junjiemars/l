
hi_bin := hi
ifeq ($(OS), Windows_NT)
hi_bin := hi.exe
endif

hi_dep := hi.asd \
          package.lisp \
          hi.lisp

hi_sbcl: sbcl-make.lisp $(hi_dep)
	sbcl --load $<

hi_ecl: ecl-make.lisp $(hi_dep)
	ecl --load $<

clean:
	test ! -f $(hi_bin) || rm $(hi_bin)
	@test ! -f hi.fasb || rm hi.fasb
	@test ! -f ecl.lib || rm ecl.lib
	@test ! -f proghi.exe.exp || rm proghi.exe.exp
	@test ! -f proghi.exe.lib || rm proghi.exe.lib

# test: 

default: hi_sbcl

.PHONY: default clean build
