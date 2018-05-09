;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

(defun %d (stream &rest args)
	(declare (ignore args)
					 (special separator))
	(princ separator stream))

(defun string++ (list separator)
	(declare (special separator))
	(format nil "~{~A~^~/%d/~}" list))


(string++ '("a" "b" "c") ",")

