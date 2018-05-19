;;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-

(defun atomprint (exp &optional (depth 0))
	"Print each item in exp, along with its depth of nesting."
	(if (atom exp)
			(format t "~&ATOM: ~a. DEPTH ~d" exp depth)
			(dolist (element exp)
				(atomprint element (+ depth 1)))))

