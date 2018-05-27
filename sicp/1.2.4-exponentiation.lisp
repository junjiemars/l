;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

;; linear recursive process
;; θ(N) steps, θ(N) spaces 
(defun :1expt (b n)
	(if (zerop n)
			1
			(* b (:1expt b (1- n)))))

;; linear iterative process
;; θ(N) steps, θ(1) spaces 
(defun :2expt (b n p)
	(if (zerop n)
			p
			(:2expt b (1- n) (* b p))))

(defun :square (b) (* b b))

;; θ(logN) steps, θ(logN) spaces 
(defun :3expt (b n)
	(cond ((zerop n) 1)
				((evenp n) (:square (:3expt b (/ n 2))))
				(t (* b (:3expt b (1- n))))))

#|
Exercise 1.16
Design a procedure that evolves an iterative exponentiation process that uses
successive squaring and uses a logarithmeic number of steps.
|#

;; θ(logN) steps, θ(1) spaces 
(defun :4expt (b n)
	(cond ((zerop n) 1)
				((evenp n) (:4expt (:square b) (/ n 2)))
				(t (* b (:4expt b (1- n))))))

#|
Exercise 1.17
The exponentiation algorithms in this section are based on performaning
exponentiation by means of repeated multiplication. In a similar way,
one can perform integer multiplication by means of repeated addition. The
following multiplication procedure (in which it is assumed that our language
can only add, not multiply) is analogous to the expt procedure:
|#

;; linear recursive process
;; θ(N) steps, θ(N) spaces (N=b)
(defun :* (a b)
	(if (= b 0)
			0
			(+ a (:* a (- b 1)))))

(defun :double (x) (+ x x))

(defun :halve (x) (/ x 2))

#|
Exercise 1.18
Using the results of Excercise 1.16 and Exercise 1.17, devise a procedure that
generates an iterative process for multiplying two integers in terms of adding,
doubling, and halving and uses a logarithmic number of steps.
|#

;; logarithmitic iterative process
;; θ(logN) steps, θ(1) spaces (N=b)
(defun :1* (a b)
	(cond ((zerop b) 0)
				((evenp b) (:1* (:double a) (:halve b)))
				(t (+ a (:1* a (1- b))))))

