;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-


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


;; collect all symbols in a package
;; (loop for s being each external-symbol of *package*
;;      collect s)

;; symbol case (in)sensitive? default is UPCASE
(if (eq :upcase (readtable-case *readtable*))
		(and
		 (eq 'foo 'Foo)
		 (eq (|SYMBOL-NAME| 'foo) (SYMBOL-NAME 'foo)))) ;; => T

(SETF (READTABLE-CASE *READTABLE*) :PRESERVE)
(EQ 'FOO 'FOO) ;; => T
(EQ 'foo 'FOO) ;; => NIL
(SETF (READTABLE-CASE *READTABLE*) :UPCASE)

;; is same thing? or interchangeable?
(= 1 (length
			(remove-duplicates
			 (mapcar #'find-package '(cl CL :CL #:CL "CL"))))) ;; => T

(defpackage :p1
  (:intern :alpha)
	(:use :cl)
  (:export :bravo :charlie))

(defpackage :p2
  (:intern :alpha :delta)
  (:use :p1)
	(:shadowing-import-from :p1 :bravo)
  (:export :bravo :echo))

(defpackage :p3
  (:intern :alpha)
  (:use :p2 :cl)
  (:export :charlie)
  (:import-from :p2 :delta))
