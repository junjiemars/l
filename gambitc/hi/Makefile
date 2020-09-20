# gambitc hi

hi_bin := hi.out
ifeq ($(OS), Windows_NT)
	hi_bin := hi.exe
endif

hi_cfg := hi.cfg
hi_cfg_pdf := hi.cfg.pdf
hi_dg := hi.dg
hi_dg_pdf := hi.dg.pdf

gsc := gambitc

$(hi_bin): hi.scm
	$(gsc) -o $@ -exe -cfg -dg $<

clean:
	test ! -f $(hi_bin) || rm $(hi_bin)
	test ! -f $(hi_cfg) || rm $(hi_cfg)
	test ! -f $(hi_cfg_pdf) || rm $(hi_cfg_pdf)
	test ! -f $(hi_dg_pdf) || rm $(hi_dg_pdf)

test: $(hi_bin)
	$(CURDIR)/$(hi_bin)

pdf: $(hi_bin)
	dot -O -Tpdf $(hi_cfg) $(hi_dg)

default: $(hi_bin)

.PHONY: default clean test
