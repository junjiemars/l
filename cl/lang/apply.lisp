;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

(funcall #'+ 1 2 3)
(apply #'+ '(1 2 3))
(apply #'+ 1 2 '(3))

(defun string+ (&rest ss)
	(apply #'concatenate 'string ss))

(string+ "a" "b" "c" "d")

(defun add (a b &rest args)
	(apply #'+ a b args ))


(reduce #'add '(1 2 3 4 5) :initial-value 100)


(defun string++ (seq &optional separator)
	(if separator
			(format nil "~{~A~^~a~}" seq separator)
			(apply #'string+ seq)))

(string++ (list "a" "b" "c" "d") ",")
