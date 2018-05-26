;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-


(defstruct name
	first
	(middle nil)
	last)

(defparameter *x* (make-name :first 'Barrney :last 'Rubble))

(name-first *x*) ;; => BARRNEY
(name-middle *x*) ;; => NIL
(name-last *x*) ;; => RUBBLE
(name-p *x*) ;; => T

(setf (name-middle *x*) 'Q) ;; => Q


#|

|#





