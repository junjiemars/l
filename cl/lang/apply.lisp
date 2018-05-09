;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

(funcall #'+ 1 2 3)
(apply #'+ '(1 2 3))
(apply #'+ 1 2 '(3))

(defun string+ (s1 s2 &rest ss)
	(apply #'concatenate 'string s1 s2 ss))

(string+ "a" "b" "c" "d")

(defun add (a b &rest args)
	(apply #'+ a b args ))


(reduce #'add '(1 2 3 4 5) :initial-value 100)
