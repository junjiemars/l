;;;; -*- lexical-binding:t -*-


(require 'ert)

(defalias 'range 'number-sequence)


(ert-deftest our-find-if ()
  (should (eq 'a (our-find-if #'(lambda (x) (eq 'a x))
                              '(b c d e a)))))

(ert-deftest our-length ()
  (should (= 0 (our-length nil)))
  (should (= 3 (our-length '(1 2 3)))))

(ert-deftest our-length1 ()
  (should (= max-lisp-eval-depth (our-length1 (range 1 max-lisp-eval-depth)))))
