;;;; -*- lexical-binding:t -*-


(require 'ert)

(ert-deftest foo ()
  (should (= 2 (foo 1)))
  (should-not (compiled-function-p #'foo))
  (byte-compile #'foo)
  (should (compiled-function-p #'foo)))

(ert-deftest *bar* ()
  (should (= 2 (funcall *bar* 1)))
  (should (compiled-function-p *bar*)))

(ert-deftest maker-adder ()
  (should-not (compiled-function-p #'make-adder))
  (byte-compile #'make-adder)
  (should (compiled-function-p #'make-adder))
  ;; when one function occurs within another function, and the containing
  ;; function is compiled, the inner function will also get compiled.
  (should (compiled-function-p (make-adder 2))))

