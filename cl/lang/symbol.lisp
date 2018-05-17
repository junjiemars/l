
;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

(defpackage :p1
  (:intern :alpha)
  (:export :bravo :charlie))

(defpackage :p2
  (:intern :alpha :delta)
  (:use :p1)
  (:export :bravo :echo))

(defpackage :p3
  (:intern :alpha)
  (:use :p2 :cl)
  (:export :charlie)
  (:import-from :p2 :delta))


;; make fresh, uninterned symbols
(defparameter *x* "aaa1")
;; => T|NIL, implemenation dependent
(eq *x* (symbol-name (make-symbol *x*)))
;; fresh, => NIL
(eq (make-symbol *x*) (make-symbol *x*))
(find-symbol "AAA1") ;; => NIL,NIL


;; make symbol inaccessible
(defun inaccessible-fn () 49)
(defparameter *inaccessible-fn* 'inaccessible-fn)
(symbol-function 'inaccessible-fn)
(unintern 'inaccessible-fn)
(fboundp 'inaccessible-fn) ;; => NIL
;; restore inaccessible-fn -> fn object
(setf (symbol-function 'inaccessible-fn)
      (symbol-function *inaccessible-fn*))
;; or 
;; (import *inaccessible-fn*)
(fboundp 'inaccessible-fn) ;; => T


;; shadowing: avoid name conflicts

(defpackage :bio
  (:use :cl)
  (:export :cat :dog :tree))

(in-package :bio)
(defclass tree () ())
(defpackage :grapha
  (:use :cl)
  (:export :vertex :edge :tree))
;; will shadow 'grapha:tree if 'tree existing
;; (shadow 'tree)
;; will import 'grpha:tree and shadown the existing 'bio:tree
(shadowing-import 'grapha:tree)
(use-package :grapha)

;; collect all symbols in a package
(loop for s being each external-symbol of *package*
     collect s)

;; symbol case (in)sensitive? default is UPCASE
(eq :upcase (readtable-case *readtable*))
(eq 'foo 'Foo)
(eq 'foo 'F\oO)
(eq (|SYMBOL-NAME| 'foo) (SYMBOL-NAME 'foo))
#|
(SETF (READTABLE-CASE *READTABLE*) :PRESERVE)
(EQ 'FOO 'FOO)
(EQ 'foo 'FOO)
(SETF (READTABLE-CASE *READTABLE*) :UPCASE)
|#

;; is same thing? or interchangeable?
(length
 (remove-duplicates
  (mapcar #'find-package '(CL :CL #:CL "CL"))))