

hi: ecl-make.lisp
	ecl --load $^

clean:
	test ! -f hi || rm hi
	test ! -f hi.fasb || rm hi.fasb
	test ! -f ecl.lib || rm ecl.lib
	test ! -f proghi.exe.exp || rm proghi.exe.exp
	test ! -f proghi.exe.lib || rm proghi.exe.lib

test: hi
	./$^


.PHONY: clean test
