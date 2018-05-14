;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

;; originally, in lisp there are no lexical variable -- only dynamic ones.
;; and there are no setq or setf, just set function

(defparameter *x* 11)

;; setq (set quoted)
(set (quote *x*) 12)

;; then lexical variable happened, setf (set field) as generic way of
;; assigning values to data structures

(setf *x* 13)

;; setf is macro
