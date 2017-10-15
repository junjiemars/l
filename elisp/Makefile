.PHONY: test

test: 	hello_test \
		compilation_test

EMACS=emacs-25.3

hello_test: hello.el
	./hello.el

compilation_test: compilation.el compilation-test.el
	$(EMACS) -batch \
			 -l compilation.el \
			 -l compilation-test.el \
			 -f ert-run-tests-batch-and-exit
