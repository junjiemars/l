;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-


;; The most important characteristic of a programming language:
;; the ability to define new object in terms of others, and to name these
;; objects for future use. Here symbols again play an important role -- they
;; are used to name variables.
;; A variable can take on a value, which can be any Lisp object.

(defparameter p '(John Q Public))

;; Symbols are also used to name functions in Common Lisp. Every symbol can
;; be used as the name of a variable or a function, or both.
