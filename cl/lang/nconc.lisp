;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

(nconc) ;; => NIL

(nconc '(1) '(2) '(3)) ;; => (1 2 3)

(defparameter *x* '(a b c))
(defparameter *y* '(1 2 3))
(defparameter *x1* (copy-list *x*))

(equal *x* *x1*) ;; => T

(nconc *x* *y*) ;; => (A B C 1 2 3)
;; == to
(progn
	(rplacd (last *x1*) *y*) *x1*) ;; => (A B C 1 2 3)
(equal *x* *x1*) ;; => T

(setq *x* '(a b c))
(setq *y* (cdr *x*))
(eq (cdr *x*) *y*) ;; => T
(rplaca *x* *y*) ;; => ((B C) B C)
(eq (cdr *x*) *y*) ;; => T








