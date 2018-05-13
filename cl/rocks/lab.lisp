;;; -*- Mode: Lisp; Syntax: Common-Lisp -*-
;;;; lab.lisp
;;;;

(in-package #:rocks/lab)
(asdf:load-systems :inferior-shell
									 :external-program)

(defun hello-world ()
	(format t "Hello World!~%"))

(defun split-string (delimiter string)
	(split-sequence:split-sequence delimiter string))

(defun interruptable ()
	(handler-case
			(sleep 100000000)
		(sb-sys:interactive-interrupt
				()
			(progn
				(format *error-output* "~%# user interruptted.~%")
				(sb-ext:exit :code 1)))))
