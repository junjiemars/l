;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

;; Lisp has a small number of syntactic expressions, they are known as
;; special forms. There are two main differences between Lisp's syntax and
;; other languages:
;; 1. Lisp's syntactic forms are always lists in which the first element
;; is one of a small number of privileged symbols. setf is one of these
;; symbols, so (setf x 10) is a special form.
;; 2. Special forms are expressions that return a value.
;; The philosophy of Lisp is to provide a small number of special forms to
;; do the things that could not otherwise be done, and then to expect the
;; use to write everything else as function.

;; setf is a macro 
(special-operator-p 'setq) ;; => T

;; We call setf a special form operator
;; and (setf x 3) a special form expression

;; special form operators used in this chapter are:
;; defun
;; defparameter
;; setf
;; let
;; case
;; if
;; function or #'
;; quote or '
