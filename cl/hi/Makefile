
hi_bin := hi
ifeq ($(OS), Windows_NT)
hi_bin := hi.exe
endif

cli ?= sbcl

hi_dep := hi.asd \
          package.lisp \
          hi.lisp

hi_bin: $(cli)-make.lisp $(hi_dep)
	$(cli) --load $<
	test -f hi && mv hi $(hi_bin) 

clean:
	test ! -f $(hi_bin) || rm $(hi_bin)
	@test ! -f hi.fasb || rm hi.fasb
	@test ! -f ecl.lib || rm ecl.lib
	@test ! -f proghi.exe.exp || rm proghi.exe.exp
	@test ! -f proghi.exe.lib || rm proghi.exe.lib

# test: 


.PHONY: default clean build
