

#|;; migrate to packages.lisp
(defpackage :hi
  (:use :common-lisp)
  (:export #:sqr #:cube)
  (:import-from :utils))
|#

(in-package :hi)

(defun sqr (n)
  (* n n))

(defun cube (n)
  (* n (sqr n)))
