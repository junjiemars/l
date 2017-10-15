.PHONY: test

EMACS=emacs-25.3

test: 	2.6_test \
		2.7_test \
		2.8_test \
		2.9_test


2.6_test: 2.6-closures.el 2.6-closures-test.el
	$(EMACS) -batch \
			 -l 2.6-closures.el \
			 -l 2.6-closures-test.el \
			 -f ert-run-tests-batch-and-exit

2.7_test: 2.7-local-functions.el 2.7-local-functions-test.el
	$(EMACS) -batch \
			 -l 2.7-local-functions.el \
			 -l 2.7-local-functions-test.el \
			 -f ert-run-tests-batch-and-exit

2.8_test: 2.8-tail-recursion.el 2.8-tail-recursion-test.el
	$(EMACS) -batch \
			 -l 2.8-tail-recursion.el \
			 -l 2.8-tail-recursion-test.el \
			 -f ert-run-tests-batch-and-exit

2.9_test: 2.9-compilation.el 2.9-compilation-test.el
	$(EMACS) -batch \
			 -l 2.9-compilation.el \
			 -l 2.9-compilation-test.el \
			 -f ert-run-tests-batch-and-exit
