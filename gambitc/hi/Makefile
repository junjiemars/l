# gambitc hi

hi_bin := hi
ifeq ($(OS), Windows_NT)
	hi_bin := hi.exe
endif

gsc := gambitc

$(hi_bin): hi.scm
	$(gsc) -exe -o $(hi_bin) $<

clean:
	test ! -f $(hi_bin) || rm $(hi_bin)

test: $(hi_bin)
	$(CURDIR)/$(hi_bin)

default: $(hi_bin)

.PHONY: default clean test
