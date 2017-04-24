

#|;; migrate to packages.lisp
(defpackage :hi
  (:use :common-lisp)
  (:export #:sqr #:cube)
  (:import-from :utils))
|#

(in-package :hi)

(defun sqr (n)
  (declaim (optimize (debug 3) (safety 0) (speed 0)))
  (* n n))

(defun cube (n)
  (declaim (optimize (debug 3) (safety 0) (speed 0)))
  (* n (sqr n)))
