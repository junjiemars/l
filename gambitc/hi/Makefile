# gambitc hi

hi_bin := hi.out
hi_cfg := hi.cfg
hi_cfg_pdf := hi.cfg.pdf

ifeq ($(OS), Windows_NT)
	hi_bin := hi.exe
endif

gsc := gambitc

$(hi_bin): hi.scm
	$(gsc) -exe -cfg -o $@ $<

clean:
	test ! -f $(hi_bin) || rm $(hi_bin)
	test ! -f $(hi_cfg) || rm $(hi_cfg)
	test ! -f $(hi_cfg_pdf) || rm $(hi_cfg_pdf)

test: $(hi_bin)
	$(CURDIR)/$(hi_bin)

pdf: $(hi_bin)
	dot -O -Tpdf $(hi_cfg)

default: $(hi_bin)

.PHONY: default clean test
