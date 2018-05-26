;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

;; linear recursive process
;; θ(N) steps, θ(N) spaces 
(defun expt1 (b n)
	(if (zerop n)
			1
			(* b (expt1 b (1- n)))))

;; linear iterative process
;; θ(N) steps, θ(1) spaces 
(defun expt2 (b n p)
	(if (zerop n)
			p
			(expt2 b (1- n) (* b p))))


;; θ(logN) steps, θ(logN) spaces 
(defun expt3 (b n)
	(cond ((zerop n) 1)
				((evenp n) (square (expt3 b (/ n 2))))
				(t (* b (expt3 b (1- n))))))

;; Exercise 1.16
;; θ(logN) steps, θ(1) spaces 
(defun expt4 (b n)
	(cond ((zerop n) 1)
				((evenp n) (expt4 (square b) (/ n 2)))
				(t (* b (expt4 b (1- n))))))
