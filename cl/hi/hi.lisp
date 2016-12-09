
(defpackage :hi
  (:use :common-lisp :asdf)
  (:export #:main #:sqr))

(in-package :hi)

(defun main ()
  (print "abc"))

(defun sqr (n)
  (* n n))

(defun cube (n)
  (* n (sqr n)))
